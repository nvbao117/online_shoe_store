import os
from dotenv import load_dotenv

load_dotenv()

# ChromaDB
CHROMA_HOST           = os.getenv("CHROMA_HOST", "localhost")
CHROMA_PORT           = int(os.getenv("CHROMA_PORT", "8000"))
COLLECTION_NAME       = os.getenv("COLLECTION_NAME", "clip-product-images")

# Model name
CLIP_MODEL_NAME       = os.getenv("CLIP_MODEL_NAME", "ViT-B/32")

# Paths
PRODUCT_IMAGES_PATH   = os.getenv("PRODUCT_IMAGES_PATH", "../src/data/images/products")

# Server
HOST                  = os.getenv("HOST", "0.0.0.0")
PORT                  = int(os.getenv("PORT", "8001"))

#MYSQL
DB_HOST               = os.getenv("DB_HOST", "localhost")
DB_PORT               = int(os.getenv("DB_PORT", "3306"))
DB_NAME               = os.getenv("DB_NAME", "shoe_store")
DB_USER               = os.getenv("DB_USER", "root")
DB_PASSWORD           = os.getenv("DB_PASSWORD", "nham2mat")

IMAGE_WEIGHT          = float(os.getenv("IMAGE_WEIGHT", "0.6"))
TEXT_WEIGHT           = float(os.getenv("TEXT_WEIGHT", "0.4"))
