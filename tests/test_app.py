import pytest
from docker.app import app

@pytest.fixture
def client():
    app.config["TESTING"] = True
    with app.test_client() as client:
        yield client

def test_health_endpoint(client):
    response = client.get("/healthz")
    assert response.status_code == 200
    assert response.json["status"] == "healthy"

def test_ready_endpoint(client):
    response = client.get("/ready")
    assert response.status_code == 200
    assert response.json["ready"] is True
