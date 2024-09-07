# Dat1.co runtime docker image

This is the official runtime image for Dat1.co.
To try it out locally, you can run the following command in the project directory:

```bash
docker run -it --rm -p 8000:8000 -v .:/app --gpus '"device=0"'  public.ecr.aws/dat1/dat1/runtime:0.1
```

## Example Project

There's also an example project available in the [example](example) directory.
It runs a tinyllama model with a simple web interface.

Before running it, you need to download the weights:
```bash
curl -o example/model.safetensors https://huggingface.co/TinyLlama/TinyLlama-1.1B-Chat-v1.0/resolve/main/model.safetensors
```


You can send a POST request to the `/infer` endpoint with a JSON payload containing a `prompt` field:

```bash
curl --request POST \
  --url http://localhost:8000/infer \
  --header 'Content-Type: application/json' \
  --data '{
	"prompt": "Hello, what is your name?"
}'
```
