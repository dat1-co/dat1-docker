docker compose build
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/dat1/dat1/runtime
docker push public.ecr.aws/dat1/dat1/runtime:"$1"
docker tag public.ecr.aws/dat1/dat1/runtime:"$1" public.ecr.aws/dat1/dat1/runtime:latest
docker push public.ecr.aws/dat1/dat1/runtime:latest
