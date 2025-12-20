import chromadb
import numpy as np
from typing import List
from dataclasses import dataclass
import logging

from config import CHROMA_HOST, CHROMA_PORT, COLLECTION_NAME

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


@dataclass
class SearchResult:
    product_id: str
    similarity: float
    image_url: str


class ChromaImageStore:
    def __init__(self, host: str = CHROMA_HOST, 
                        port: int = CHROMA_PORT, 
                        collection_name: str = COLLECTION_NAME):
        
        logger.info(f"Connecting to ChromaDB at {host}:{port}...")
        
        self.client = chromadb.HttpClient(host=host, port=port)
        
        self.collection = self.client.get_or_create_collection(
            name=collection_name,
            metadata={"hnsw:space": "cosine"}
        )
        
        logger.info(f"Connected! Collection has {self.collection.count()} items")
    
    def add(self, product_id: str, embedding: np.ndarray, image_url: str):
        self.collection.add(
            ids=[product_id],
            embeddings=[embedding.tolist()],
            metadatas=[{"product_id": product_id, "image_url": image_url}]
        )
    
    def upsert(self, product_id: str, embedding: np.ndarray, image_url: str):
        self.collection.upsert(
            ids=[product_id],
            embeddings=[embedding.tolist()],
            metadatas=[{"product_id": product_id, "image_url": image_url}]
        )
    
    def upsert_with_metadata(self, item_id: str, embedding: np.ndarray, metadata: dict):
        """Upsert with full metadata dict"""
        self.collection.upsert(
            ids=[item_id],
            embeddings=[embedding.tolist()],
            metadatas=[metadata]
        )
    
    def search(self, query_embedding: np.ndarray, top_k: int = 10) -> List[SearchResult]:
        results = self.collection.query(
            query_embeddings=[query_embedding.tolist()],
            n_results=top_k,
            include=["metadatas", "distances"]
        )
        
        search_results = []
        if results["ids"] and len(results["ids"]) > 0:
            for i in range(len(results["ids"][0])):
                product_id  =   results["ids"][0][i]
                distance    =   results["distances"][0][i]
                metadata    =   results["metadatas"][0][i]
                
                search_results.append(SearchResult(
                    product_id=metadata.get("product_id", product_id),
                    similarity=1 - distance,  # cosine distance to similarity
                    image_url=metadata.get("image_url", "")
                ))
        
        return search_results
    
    def search_with_metadata(self, query_embedding: np.ndarray, top_k: int = 10) -> List[dict]:
        """Search and return full metadata"""
        results = self.collection.query(
            query_embeddings=[query_embedding.tolist()],
            n_results=top_k,
            include=["metadatas", "distances"]
        )
        
        search_results = []
        if results["ids"] and len(results["ids"]) > 0:
            for i in range(len(results["ids"][0])):
                item_id = results["ids"][0][i]
                distance = results["distances"][0][i]
                metadata = results["metadatas"][0][i].copy()
                
                # Add computed fields
                metadata["id"] = item_id
                metadata["similarity"] = 1 - distance
                
                search_results.append(metadata)
        
        return search_results
    
    def delete_all(self):
        all_data = self.collection.get()
        if all_data["ids"]:
            self.collection.delete(ids=all_data["ids"])
            logger.info(f"Deleted {len(all_data['ids'])} items")
    
    def count(self) -> int:
        return self.collection.count()


_store = None

def get_store() -> ChromaImageStore:
    global _store
    if _store is None:
        _store = ChromaImageStore()
    return _store
