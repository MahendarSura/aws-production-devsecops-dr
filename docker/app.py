import os
import time
from flask import Flask, jsonify

app = Flask(__name__)

START_TIME = time.time()
APP_VERSION = os.getenv("APP_VERSION", "1.0.0")
ENVIRONMENT = os.getenv("APP_ENV", "production")
AWS_REGION = os.getenv("AWS_REGION", "ap-south-1")

@app.route("/")
def index():
    return jsonify({
        "status": "online",
        "service": "aws-production-devsecops-dr",
        "environment": ENVIRONMENT,
        "region": AWS_REGION,
        "version": APP_VERSION,
        "uptime_seconds": int(time.time() - START_TIME)
    })

@app.route("/healthz")
def healthz():
    return jsonify({"status": "healthy"}), 200

@app.route("/ready")
def ready():
    return jsonify({"status": "ready"}), 200

if __name__ == "__main__":
    port = int(os.getenv("PORT", 8080))
    app.run(host="0.0.0.0", port=port)
