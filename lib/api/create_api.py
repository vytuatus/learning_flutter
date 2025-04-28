from fastapi import FastAPI
from pydantic import BaseModel
from typing import Optional
from datetime import datetime
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

# Allow all origins for dev purposes
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # In production, specify the actual domain!
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

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
            "image_url": "https://media.istockphoto.com/id/2188501555/photo/phoenix-skyline-at-sunset-with-saguaro-cactus.jpg?s=1024x1024&w=is&k=20&c=_PTX2uv__4PKwwGZ3BZB2LdWwE7veEGTf52ie7UrhPI=",
            "thumbnail_url": "https://example.com/images/sunset_thumb.jpg",
            "created_at": datetime.utcnow().isoformat(),
            "updated_at": datetime.utcnow().isoformat(),
        },
        {
            "id": "2",
            "name": "Forest",
            "description": "A lush green forest.",
            "image_url": "https://media.istockphoto.com/id/2114709363/photo/water-surface-and-sky-reflection-calm-nature-abstract-background-web-banner.jpg?s=1024x1024&w=is&k=20&c=zHg6y0GJYBRrziFczYALYUAGh__l71VzzNwsYLyIBvo=",
            "thumbnail_url": "https://example.com/images/forest_thumb.jpg",
            "created_at": datetime.utcnow().isoformat(),
            "updated_at": datetime.utcnow().isoformat(),
        },
    ]
    # uvicorn lib.api.create_api:app --reload