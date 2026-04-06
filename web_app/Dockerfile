FROM python:3.13-slim

LABEL author="APP FROM GITHUB and DOKERFILE-DEPLOY BY JM "

RUN apt-get update && apt-get upgrade -y
RUN apt-get update && apt-get install -y default-mysql-client && rm -rf /var/lib/apt/lists/*


RUN groupadd -r appgroup && useradd -r -g appgroup -u 1001 marco

WORKDIR /home/apk

COPY ./Hotel-Management-using-SQL-main/app /home/apk/

COPY w-db.sh /w-db.sh

RUN pip install --no-cache-dir streamlit pillow pandas mysql-connector-python

RUN chmod +x /w-db.sh

RUN chown -R marco:appgroup /home/apk

USER marco

EXPOSE 8501

CMD ["/w-db.sh"]

## projet en cours de développement
## projet python télécharger sur github


## connaitre le port par defaut de streamlit
