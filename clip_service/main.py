"""
FastAPI Server - CLIP Image Search API
"""
from fastapi import FastAPI, UploadFile, File, HTTPException, Query
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import List
import logging

from clip_model import get_embedder
from chroma_client import get_store, SearchResult
from config import HOST, PORT, CLIP_MODEL_NAME

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

app = FastAPI(
    title="CLIP Image Search Service",
    description="Semantic image search using OpenAI CLIP",
    version="1.0.0"
)

# CORS for Spring Boot
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


# Models
class TextSearchRequest(BaseModel):
    query: str
    top_k: int = 10


# Startup
@app.on_event("startup")
async def startup():
    logger.info("Starting CLIP Image Search Service...")
    get_embedder(CLIP_MODEL_NAME)
    store = get_store()
    logger.info(f"ChromaDB has {store.count()} embeddings")
    logger.info("Service ready!")


# Endpoints
@app.get("/health")
async def health():
    store = get_store()
    return {
        "status": "healthy",
        "model": CLIP_MODEL_NAME,
        "embeddings_count": store.count()
    }


@app.post("/api/search/image")
async def search_by_image(
    file: UploadFile = File(...),
    top_k: int = Query(default=10, ge=1, le=50)
):
    """Search products by uploaded image - returns full metadata"""
    try:
        logger.info(f"Image search - {file.filename}")
        
        image_bytes = await file.read()
        embedder = get_embedder()
        embedding = embedder.encode_image_from_bytes(image_bytes)
        
        store = get_store()
        results = store.search_with_metadata(embedding, top_k)
        
        logger.info(f"Found {len(results)} results")
        
        return {"results": results}
    except Exception as e:
        logger.error(f"Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))


@app.post("/api/search/text")
async def search_by_text(request: TextSearchRequest):
    """Search products by text description - returns full metadata"""
    try:
        logger.info(f"Text search - '{request.query}'")
        
        embedder = get_embedder()
        embedding = embedder.encode_text(request.query)
        
        store = get_store()
        results = store.search_with_metadata(embedding, request.top_k)
        
        logger.info(f"Found {len(results)} results")
        
        return {"results": results}
    except Exception as e:
        logger.error(f"Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))


@app.post("/api/search/variants")
async def search_variants(request: TextSearchRequest):
    """Search product variants with full metadata"""
    try:
        logger.info(f"Variant search - '{request.query}'")
        
        embedder = get_embedder()
        embedding = embedder.encode_text(request.query)
        
        store = get_store()
        results = store.search_with_metadata(embedding, request.top_k)
        
        logger.info(f"Found {len(results)} variants")
        
        return {"results": results}
    except Exception as e:
        logger.error(f"Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))


if __name__ == "__main__":
    import uvicorn
    uvicorn.run("main:app", host=HOST, port=PORT, reload=True)
