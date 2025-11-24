#!/bin/bash
# Usage: ./cloudrun_deploy.sh PROJECT_ID REGION
PROJECT_ID=${1:-YOUR_GCP_PROJECT}
REGION=${2:-us-central1}
IMAGE=gcr.io/${PROJECT_ID}/ai-cloudrun-app:latest

# Build and push
docker build -t $IMAGE .
docker push $IMAGE

# Deploy
gcloud run deploy ai-cloudrun-app \
  --image $IMAGE \
  --platform managed \
  --region $REGION \
  --allow-unauthenticated \
  --set-env-vars MONGO_URI="your-mongo-uri",GCP_PROJECT="$PROJECT_ID",LLM_API_KEY="your-key",VERTEX_ENDPOINT_ID="your-endpoint-id",GCP_LOCATION="us-central1"
