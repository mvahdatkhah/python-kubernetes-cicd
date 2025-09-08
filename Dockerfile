# Dockerfile
FROM python:3.12-slim AS runtime
WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# system deps (add as needed)
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# install python deps first for better layer cache
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# copy app
COPY . .

# security: run as non-root
RUN useradd -m appuser
USER appuser

ENV PORT=8000
EXPOSE 8000

# If you use FastAPI/Flask with gunicorn, switch the CMD accordingly
# Example (FastAPI): CMD ["gunicorn", "-b", "0.0.0.0:8000", "app:app", "-k", "uvicorn.workers.UvicornWorker"]
CMD ["python", "app.py"]
