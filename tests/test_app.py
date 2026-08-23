import pytest
import sys
import os
sys.path.append(os.path.abspath("docker"))
from app import app

@pytest.fixture
def client():
    app.config["TESTING"] = True
    with app.test_client() as client:
        yield client

def test_healthz_endpoint(client):
    response = client.get("/healthz")
    assert response.status_code == 200
    assert response.json["status"] == "healthy"

def test_ready_endpoint(client):
    response = client.get("/ready")
    assert response.status_code == 200
    assert response.json["status"] == "ready"

def test_root_endpoint(client):
    response = client.get("/")
    assert response.status_code == 200
    assert response.json["status"] == "online"
