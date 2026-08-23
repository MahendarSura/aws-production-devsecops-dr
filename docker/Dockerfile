FROM python:3.12-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --user -r requirements.txt

FROM python:3.12-slim
WORKDIR /app
RUN groupadd -g 10001 appgroup && useradd -u 10001 -g appgroup appuser
COPY --from=builder /root/.local /home/appuser/.local
COPY app.py .
ENV PATH=/home/appuser/.local/bin:$PATH
USER 10001:10001
EXPOSE 8080
HEALTHCHECK --interval=15s --timeout=3s --retries=3 CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:8080/healthz')"
CMD ["python", "app.py"]
