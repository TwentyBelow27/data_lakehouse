#!/bin/bash

echo "Creating admin user..."
superset fab create-admin \
    --username "${ADMIN_USERNAME:-admin}" \
    --password "${ADMIN_PASSWORD:-admin}" \
    --firstname Admin \
    --lastname User \
    --email admin@example.com \
    2>/dev/null || echo "Admin already exists"

echo "Upgrading database..."
superset db upgrade

echo "Initializing Superset..."
superset init

echo "Starting Superset..."
exec superset run -p 8088 --host 0.0.0.0