from fastapi import Request, FastAPI
from vllm import LLM, SamplingParams
import os

llm = LLM(model=os.path.expanduser('./'), load_format="safetensors", enforce_eager=True)

app = FastAPI()

@app.get("/")
async def root():
    return "OK"

@app.post("/infer")
async def infer(request: Request):
    request = await request.json()
    prompts = request["prompt"]
    sampling_params = SamplingParams(temperature=0.8, top_p=0.95)
    outputs = llm.generate(prompts, sampling_params)
    return { "response" : outputs[0].outputs[0].text }
