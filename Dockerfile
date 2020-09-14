FROM python:3.7-slim

RUN apt-get update -y
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN apt-get install -y gcc vim apt-transport-https ca-certificates gnupg curl wget

RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
RUN apt-get update -y
RUN apt-get install -y google-cloud-sdk

RUN pip install apache-airflow==1.10.12 --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-1.10.12/constraints-3.7.txt"
RUN airflow initdb

RUN mkdir -p /root/airflow/dags

COPY launch.sh /root/launch.sh
RUN chmod +x /root/launch.sh

COPY requirements.txt /root/requirements.txt
RUN pip install -r /root/requirements.txt

EXPOSE 8080
CMD ["bash", "/root/launch.sh"]
