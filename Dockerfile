FROM pytorch/pytorch:2.4.0-cuda12.4-cudnn9-runtime
RUN apt-get update
RUN apt install build-essential -y

RUN pip install vllm
RUN pip install fastapi uvicorn
RUN pip install bitsandbytes
RUN pip install triton
RUN pip install pydantic
RUN pip install accelerate
RUN pip install deepspeed
RUN pip install huggingface-hub
RUN pip install imageio
RUN pip install numpy
RUN pip install omegaconf
RUN pip install pandas
RUN pip install Pillow
RUN pip install tokenizers
RUN pip install xformers
RUN pip install safetensors
RUN pip install diffusers
RUN pip install sentencepiece
RUN pip install gradio
RUN pip install opencv-python
RUN pip install einops
RUN pip install timm
RUN pip install onnxruntime
RUN pip install unsloth
RUN pip install transformers==4.44.2
RUN pip install llama-cpp-python==0.3.4 --extra-index-url https://abetlen.github.io/llama-cpp-python/whl/cu124


WORKDIR /app
ENTRYPOINT ["uvicorn", "handler:app", "--host", "0.0.0.0"]
