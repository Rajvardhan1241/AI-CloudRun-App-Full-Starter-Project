# AI CloudRun App (Starter)

This is a starter template implementing an AI-powered, Cloud Run friendly application scaffold. It contains:

- FastAPI application
- MCP Toolbox (MongoDB / BigQuery / Spanner / Cloud Storage stubs)
- ADK agent (RAG + guardrails)
- LLM client stub and Vertex AI (Gemini) integration example
- Dockerfile and Cloud Run deploy script

## Quickstart

1. Create `.env` (or set env vars):

```
MONGO_URI=mongodb+srv://user:pass@cluster.mongodb.net/?retryWrites=true&w=majority
GCP_PROJECT=your-gcp-project
LLM_API_KEY=demo
VERTEX_ENDPOINT_ID=your-endpoint-id
GCP_LOCATION=us-central1
```

2. Build & run locally:

```bash
uvicorn app.main:app --reload --port 8080
```

3. Test:

```bash
curl -X POST "http://127.0.0.1:8080/query" -H "Content-Type: application/json" -d '{"user_id":"u1","question":"How to reset my password?"}'
```

4. Deploy to Cloud Run using `cloudrun_deploy.sh` or GitHub Actions.

## Next steps / Production notes

- Replace LLM client with Vertex AI / OpenAI SDK and implement proper auth
- Use MongoDB Atlas vector search or a dedicated vector DB for RAG
- Secure secrets using Secret Manager
- Use Cloud Tasks / Cloud Run Jobs for background work
- Add monitoring and structured logging
