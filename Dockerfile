# Stage 1: Build stage
FROM python:3.12-slim as builder

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Install build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install dependencies into a virtual environment
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: Final Runtime stage
FROM python:3.12-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PATH="/opt/venv/bin:$PATH"
ENV STREAMLIT_SERVER_PORT=8501
ENV STREAMLIT_SERVER_ADDRESS=0.0.0.0

WORKDIR /app

# Copy virtual environment from builder
COPY --from=builder /opt/venv /opt/venv

# Copy application code
COPY . .

# Create a non-privileged user to run the app
RUN adduser --disabled-password --gecos "" streamlituser && \
    chown -R streamlituser:streamlituser /app
USER streamlituser

# Expose Streamlit port
EXPOSE 8501

# Healthcheck to ensure the container is running correctly
HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl --fail http://localhost:8501/_stcore/health || exit 1

# Command to run the application
ENTRYPOINT ["streamlit", "run", "app.py"]
