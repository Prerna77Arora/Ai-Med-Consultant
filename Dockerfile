# ---------- base image ----------
FROM python:3.10-slim

# ---------- system deps ----------
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ffmpeg \          
    libportaudio2 \
    portaudio19-dev \
    gcc\
    libc-dev\
    make && \
    rm -rf /var/lib/apt/lists/*

# ---------- workdir ----------
WORKDIR /app

# ---------- Python deps ----------
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# ---------- app code ----------
COPY . .

# ---------- ports & start ----------
EXPOSE 7860
CMD ["python", "gradio_app.py"]
