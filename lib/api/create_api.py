from fastapi import FastAPI
from pydantic import BaseModel
from typing import Optional
from datetime import datetime

app = FastAPI()

class PixelformImage(BaseModel):
    id: Optional[str]
    name: Optional[str]
    description: Optional[str]
    image_url: Optional[str]
    thumbnail_url: Optional[str]
    created_at: Optional[str]
    updated_at: Optional[str]

@app.get("/images", response_model=list[PixelformImage])
async def get_images():
    # Example dummy data
    return [
        {
            "id": "1",
            "name": "Sunset",
            "description": "A beautiful sunset.",
            "image_url": "https://example.com/images/sunset.jpg",
            "thumbnail_url": "https://example.com/images/sunset_thumb.jpg",
            "created_at": datetime.utcnow().isoformat(),
            "updated_at": datetime.utcnow().isoformat(),
        },
        {
            "id": "2",
            "name": "Forest",
            "description": "A lush green forest.",
            "image_url": "https://example.com/images/forest.jpg",
            "thumbnail_url": "https://example.com/images/forest_thumb.jpg",
            "created_at": datetime.utcnow().isoformat(),
            "updated_at": datetime.utcnow().isoformat(),
        },
    ]
