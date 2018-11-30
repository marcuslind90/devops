# Load Testing with Locust.io

Example of how to setup load testing using [Locust.io](https://locust.io).

We are using a simple Django application using Gunicorn and Nginx. We 
are only simulating requests against the index page at `/`.

## Quick Start

1. Install Docker
2. Start your containers with `docker-compose up` 
3. Run Locust with `locust -f resources/locustio/locustfile.py --host=http://0.0.0.0`
4. Navigate to `http://localhost:8089` to access Locust Web UI and do your load testing
