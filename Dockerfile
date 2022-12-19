FROM jupyter/datascience-notebook:latest

RUN apt update -y && apt install awscli cron gpg ccrypt -y
