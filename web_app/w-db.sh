#!/bin/sh
# w-db.sh

echo "Waiting for MySQL at $DB_HOST..."

while ! mysqladmin ping -h "$DB_HOST" --silent; do
    echo "MySQL is unavailable - sleeping"
    sleep 2
done

echo "MySQL is up - starting Streamlit"
exec streamlit run /home/apk/Main_Page.py --server.port 8501 --server.address 0.0.0.0