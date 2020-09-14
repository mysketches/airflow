#!/bin/bash
nohup airflow scheduler &
airflow webserver -p 8080