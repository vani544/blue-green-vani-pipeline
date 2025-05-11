FROM python:3.9-slim

WORKDIR /app

COPY ./app /app

RUN pip install flask gunicorn

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set environment for blue or green (default to blue)
ARG DEPLOY_ENV=blue
ENV DEPLOY_ENV=${DEPLOY_ENV}

# Port 5000 for the application
EXPOSE 5000

# Use gunicorn with proper timeout settings
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--timeout", "120", "--workers", "2", "app:app"]
