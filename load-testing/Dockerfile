FROM python:3.6
ENV PYTHONUNBUFFERED 1

RUN mkdir /app
WORKDIR /app
ADD ./app /app/
RUN pip install -Ur requirements.txt
