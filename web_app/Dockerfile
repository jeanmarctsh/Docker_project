FROM python:3.13-slim

LABEL author="APP FROM GITHUB and DOKERFILE-DEPLOY BY JM "

RUN apt-get update && apt-get install -y --no-install-recommends \
    default-mysql-client \
    && rm -rf /var/lib/apt/lists/*


RUN groupadd -r appgroup && useradd -r -g appgroup -u 1001 marco

WORKDIR /home/apk

COPY --chown=marco:appgroup ./Hotel-Management-using-SQL-main/app /home/apk/

COPY --chown=marco:appgroup w-db.sh /usr/local/bin/w-db.sh

RUN pip install --no-cache-dir streamlit pillow pandas mysql-connector-python

RUN chmod +x /usr/local/bin/w-db.sh

USER marco

EXPOSE 8501

CMD ["/usr/local/bin/w-db.sh"]

## projet en cours de développement
## projet python télécharger sur github


## connaitre le port par defaut de streamlit
