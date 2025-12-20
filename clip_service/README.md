# CLIP Image Search Microservice

Python FastAPI microservice for semantic image search using OpenAI CLIP model.

## Quick Start

```bash
cd clip_service
python -m venv venv
venv\Scripts\activate          # Windows
pip install -r requirements.txt
pip install git+https://github.com/openai/CLIP.git

# Ingest product images (run once)
python ingest_products.py

# Start server
uvicorn main:app --port 8001 --reload
```

## API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/search/image` | Search by image upload |
| POST | `/api/search/text` | Search by text description |
| GET | `/health` | Health check |

## Configuration

Copy `.env.example` to `.env` and update values.
