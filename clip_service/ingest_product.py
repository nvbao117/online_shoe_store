import os
import sys
from tqdm import tqdm
import numpy as np
import logging
from decimal import Decimal

from clip_model import get_embedder
from chroma_client import get_store
from db_client import get_database
from config import PRODUCT_IMAGES_PATH, CLIP_MODEL_NAME, IMAGE_WEIGHT, TEXT_WEIGHT

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


def build_text_for_embedding(product: dict) -> str:
    """Build text description from product info"""
    parts = []
    
    if product.get('product_name'):
        parts.append(product['product_name'])
    
    if product.get('brand_name'):
        parts.append(product['brand_name'])
    
    if product.get('category_name'):
        parts.append(product['category_name'])
    
    if product.get('color'):
        parts.append(f"Color {product['color']}")
    
    if product.get('description'):
        desc = str(product['description'])[:150]
        parts.append(desc)
    
    return ". ".join(parts) if parts else "shoe product"


def get_image_path(product: dict, base_path: str) -> str:
    """Get the image file path"""
    image_url = product.get('image_url')
    if not image_url:
        return None
    
    path = image_url.replace("\\", "/").strip()
    
    prefixes = ["/src/data/images/products/", "src/data/images/products/", 
                "/images/products/", "images/products/"]
    for prefix in prefixes:
        if path.startswith(prefix):
            path = path[len(prefix):]
            break
    
    full_path = os.path.join(base_path, path)
    if os.path.exists(full_path):
        return full_path
    
    return None


def clean_text(text: str) -> str:
    """Remove control characters that break JSON"""
    if not text:
        return ""
    # Replace \r\n and other control chars with space
    import re
    text = re.sub(r'[\r\n\t]+', ' ', str(text))
    text = re.sub(r'[\x00-\x1f\x7f-\x9f]', '', text)
    return text.strip()


def build_metadata(product: dict, display_image_url: str) -> dict:
    """Build metadata dict for ChromaDB"""
    price = product.get('price')
    if isinstance(price, Decimal):
        price = float(price)
    
    return {
        "product_id": str(product.get('product_id', '')),
        "description": clean_text(product.get('description', ''))[:500],
        "image_url": display_image_url,
        "product_name": clean_text(product.get('product_name', '')),
        "price": price or 0,
        "status": str(product.get('status', 'ACTIVE')),
        "brand_name": clean_text(product.get('brand_name', '')),
        "category_name": clean_text(product.get('category_name', '')),
        "color": clean_text(product.get('color', ''))
    }


def create_hybrid_embedding(image_embedding: np.ndarray, text_embedding: np.ndarray) -> np.ndarray:
    """Combine image and text embeddings with weighted average"""
    combined = IMAGE_WEIGHT * image_embedding + TEXT_WEIGHT * text_embedding
    combined = combined / np.linalg.norm(combined)
    return combined


def main():
    print("=" * 60)
    print("CLIP Product Ingestion (Full Metadata)")
    print("=" * 60)
    print(f"Weights: Image={IMAGE_WEIGHT*100:.0f}%, Text={TEXT_WEIGHT*100:.0f}%")
    
    base_path = os.path.abspath(PRODUCT_IMAGES_PATH)
    print(f"Images path: {base_path}")
    
    print("\nLoading CLIP model...")
    embedder = get_embedder(CLIP_MODEL_NAME)
    
    print("Connecting to ChromaDB...")
    store = get_store()
    
    print("Connecting to MySQL...")
    db = get_database()
    
    print("Fetching products from database...")
    products = db.get_all_products_for_embedding()
    print(f"Found {len(products)} active products")
    
    if not products:
        print("No products found!")
        sys.exit(1)
    
    if store.count() > 0:
        resp = input(f"Found {store.count()} existing embeddings. Delete? (y/N): ")
        if resp.lower() == 'y':
            store.delete_all()
    
    print(f"\nProcessing {len(products)} products...")
    
    success = 0
    no_image = 0
    errors = 0
    
    for product in tqdm(products, desc="Embedding Products"):
        try:
            product_id = product['product_id']
            
            image_path = get_image_path(product, base_path)
            
            if not image_path:
                no_image += 1
                continue
            
            text = build_text_for_embedding(product)
            
            image_embedding = embedder.encode_image_from_path(image_path)
            text_embedding = embedder.encode_text(text)
            
            hybrid_embedding = create_hybrid_embedding(image_embedding, text_embedding)
            
            rel_path = os.path.relpath(image_path, base_path)
            image_url = "/images/products/" + rel_path.replace("\\", "/")
            
            metadata = build_metadata(product, image_url)
            
            store.upsert_with_metadata(product_id, hybrid_embedding, metadata)
            
            success += 1
            
        except Exception as e:
            errors += 1
            if errors <= 5:
                logger.warning(f"Failed: {product.get('product_id')}: {e}")
    
    db.close()
    
    print("\n" + "=" * 60)
    print("PRODUCT INGESTION COMPLETE")
    print("=" * 60)
    print(f"Success: {success}")
    print(f"No image: {no_image}")
    print(f"Errors: {errors}")
    print(f"Total in ChromaDB: {store.count()}")


if __name__ == "__main__":
    main()
