FROM pytorch/pytorch:2.4.0-cuda12.4-cudnn9-runtime
RUN apt-get update
# vllm
RUN pip install vllm
RUN pip install fastapi uvicorn
WORKDIR /app
ENTRYPOINT ["uvicorn", "handler:app", "--host", "0.0.0.0"]
