FROM public.ecr.aws/neuron/pytorch-inference-neuronx:2.1.2-neuronx-py310-sdk2.20.0-ubuntu20.04
RUN apt-get update
RUN apt update -y
RUN apt upgrade -y
# vllm
RUN apt install -y g++ git

#Create Python venv
RUN python -m venv aws_neuron_venv_pytorch

# Activate Python venv
RUN bash aws_neuron_venv_pytorch/bin/activate

# Install Jupyter notebook kernel
RUN pip install ipykernel
RUN python -m ipykernel install --user --name aws_neuron_venv_pytorch --display-name "Python (torch-neuronx)"
RUN pip install jupyter notebook
RUN pip install environment_kernels

# Set pip repository pointing to the Neuron repository
RUN python -m pip config set global.extra-index-url https://pip.repos.neuron.amazonaws.com

# Install wget, awscli
RUN python -m pip install wget
RUN python -m pip install awscli

# Update Neuron Compiler and Framework
RUN python -m pip install --upgrade neuronx-cc==2.* --pre torch-neuronx==2.1.* torchvision transformers-neuronx

RUN git clone https://github.com/vllm-project/vllm.git
RUN cd vllm && pip install -U -r requirements-neuron.txt && VLLM_TARGET_DEVICE="neuron" pip install .

RUN pip install fastapi uvicorn
WORKDIR /app
ENTRYPOINT ["uvicorn", "handler:app", "--host", "0.0.0.0"]
