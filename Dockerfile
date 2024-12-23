FROM pytorch/pytorch:2.5.1-cuda12.4-cudnn9-devel
RUN apt-get update
RUN apt install build-essential -y

RUN pip install accelerate
RUN pip install fastapi uvicorn
RUN pip install bitsandbytes
RUN pip install deepspeed==0.16.1
RUN pip install Pillow==10.4.0 imageio==2.36.1
RUN pip install omegaconf==2.3.0
RUN pip install pandas==2.2.3
RUN pip install tokenizers==0.21.0
RUN pip install torch==2.5.1 xformers --index-url https://download.pytorch.org/whl/cu124
RUN pip install sentencepiece
RUN pip install gradio
RUN pip install opencv-python
RUN pip install timm
RUN pip install unsloth
RUN pip install diffusers
RUN pip install llama-cpp-python==0.3.4 --extra-index-url https://abetlen.github.io/llama-cpp-python/whl/cu124
RUN pip install torch==2.5.1 vllm==0.6.4
RUN pip install loadimg
RUN pip install uvloop
RUN pip install ujson
RUN pip install boto3
RUN pip install sse_starlette
RUN pip install starlette-context
RUN pip install pydantic-settings

WORKDIR /app
ENTRYPOINT ["uvicorn", "handler:app", "--host", "0.0.0.0"]
