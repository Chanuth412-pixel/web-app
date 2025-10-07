FROM python:3.11-slim
WORKDIR /app

COPY requirements-prod.txt /app/
RUN python -m pip install --upgrade pip setuptools wheel \
    && pip install --no-cache-dir -r requirements-prod.txt

COPY . /app/
EXPOSE 8000
CMD ["gunicorn", "self_healing_app.wsgi:application", "-b", "0.0.0.0:8000", "--workers", "2"]