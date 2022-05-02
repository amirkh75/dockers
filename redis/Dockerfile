FROM python:3.9.6-alpine


ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /usr/app/src

RUN pip install --upgrade pip

RUN pip install redis


COPY example_redis-py.py ./

CMD [ "python", "./example_redis-py.py"]