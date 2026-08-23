import os
from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/healthz", methods=["GET"])
def health_check():
    return jsonify(status="healthy", environment=os.getenv("APP_ENV", "production")), 200

@app.route("/ready", methods=["GET"])
def readiness_check():
    return jsonify(ready=True), 200

@app.route("/", methods=["GET"])
def root():
    return jsonify(
        message="DevSecOps Production Platform Live",
        version="v1.0.0",
        region=os.getenv("AWS_REGION", "ap-south-1")
    ), 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
