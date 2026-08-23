FROM python:3.12-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --user -r requirements.txt

FROM python:3.12-slim AS final
RUN groupadd -g 10001 appgroup && useradd -u 10001 -g appgroup -s /bin/sh appuser
WORKDIR /app
COPY --from=builder /root/.local /home/appuser/.local
COPY app.py .
ENV PATH=/home/appuser/.local/bin:$PATH PYTHONUNBUFFERED=1 APP_ENV=production
USER 10001:10001
EXPOSE 8080
HEALTHCHECK --interval=30s --timeout=3s --retries=3 CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:8080/healthz')" || exit 1
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "--workers", "2", "--threads", "4", "app:app"]
