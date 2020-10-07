# Airflow for developers

Here is a simple instance of Airflow, for developers. 1 image, 1 instance, everything running inside.

__Bear in mind that this image is not for production purposes. Its goal is to help developers build and test their DAGS, before deploying on a production Airflow infrastructure.__

## Fetch the image

    docker pull mysketches/airflow

This will pull the latest version of Airflow. If you wish to pull a specific version of Airflow, you shall proceed as follow:

    docker pull mysketches/airflow:1.10.12

## Basic run of the container

    docker run -d --name airflow -p 8080:8080 -v <my_dags_folder>:/root/airflow/dags mysketches/airflow:1.10.12

## Options

Launching a container is pretty straightforward. Here are the basic options you may need to access the WebUI, and work on your DAGS:

    -p 8090:8080

Use the `-p` option to map the `8090` port of your local machine to the `8080` port of the container where AIrflow is exposed.

    -v <my_dags_folder>:/root/airflow/dags

Use the `-v` option to map your `dags_folder` in your local machine with the default `dags` folder in the Airflow container.

    -v <my_logs_folder>:/root/airflow/logs

Use the `-v` option to map your `logs_folder` in your local machine with the default `logs` folder in the Airflow container.