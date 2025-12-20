"""
Multilingual CLIP Model - Support Vietnamese text search
Uses sentence-transformers for multilingual text encoding
"""
import torch
import open_clip
from PIL import Image
import numpy as np
import logging
import io
from sentence_transformers import SentenceTransformer

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class MultilingualCLIPEmbedder:
    """Multilingual CLIP for Vietnamese text search"""
    
    def __init__(self, model_name: str = "ViT-B-32"):
        self.device = "cuda" if torch.cuda.is_available() else "cpu"
        logger.info(f"Loading Multilingual CLIP on {self.device}...")
        
        self.clip_model, _, self.preprocess = open_clip.create_model_and_transforms(
            'ViT-B-32', 
            pretrained='laion2b_s34b_b79k'
        )
        self.clip_model = self.clip_model.to(self.device)
        self.clip_model.eval()
        self.text_model = SentenceTransformer('sentence-transformers/clip-ViT-B-32-multilingual-v1')
        
        logger.info("Multilingual CLIP loaded!")
    
    def encode_image(self, image: Image.Image) -> np.ndarray:
        image_input = self.preprocess(image).unsqueeze(0).to(self.device)
        
        with torch.no_grad():
            embedding = self.clip_model.encode_image(image_input)
            embedding = embedding / embedding.norm(dim=-1, keepdim=True)
        
        return embedding.cpu().numpy().flatten()
    
    def encode_image_from_path(self, path: str) -> np.ndarray:
        image = Image.open(path).convert("RGB")
        return self.encode_image(image)
    
    def encode_image_from_bytes(self, image_bytes: bytes) -> np.ndarray:
        image = Image.open(io.BytesIO(image_bytes)).convert("RGB")
        return self.encode_image(image)
    
    def encode_text(self, text: str) -> np.ndarray:
        """Encode Vietnamese/English text to 512-dim normalized embedding"""
        embedding = self.text_model.encode(text, normalize_embeddings=True)
        return embedding


# Singleton
_embedder = None

def get_embedder(model_name: str = "ViT-B-32") -> MultilingualCLIPEmbedder:
    global _embedder
    if _embedder is None:
        _embedder = MultilingualCLIPEmbedder(model_name)
    return _embedder
