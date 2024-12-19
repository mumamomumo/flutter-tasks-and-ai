#create a api hosted on local computer to send a request to the llm, using fastapi

from fastapi import FastAPI
import requests
import json

app = FastAPI()

@app.get('/')
async def llm(prompt: str):
    params = {
        "prompt": prompt,
        "model": "mistral",
        "stream": False
    }
    print("Prompt: " + prompt)
    response = requests.post("http://localhost:11434/api/generate", json=params)
    content = json.loads(response.text)["response"]
    return {"message": content}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)