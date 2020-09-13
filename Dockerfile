FROM python:3.7-slim

RUN apt-get update -y
RUN apt-get install -y gcc vim
RUN pip install apache-airflow==1.10.12 --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-1.10.12/constraints-3.7.txt"
RUN airflow initdb
RUN mkdir p ~/airflow/dags
RUN echo '#!/bin/bash' > launch.sh
RUN echo 'nohup airflow scheduler &' >> launch.sh
RUN echo 'airflow webserver -p 8080' >> launch.sh
RUN chmod +x launch.sh

EXPOSE 8080
CMD ["bash", "launch.sh"]
