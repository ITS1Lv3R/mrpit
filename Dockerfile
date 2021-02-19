FROM python:3.6
WORKDIR home/magazine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip

COPY ./requirements.txt .
RUN pip install -r requirements.txt

RUN apt-get update && apt-get install netcat -y

COPY ./entrypoint.sh /home/magazine/entrypoint.sh

# copy project
COPY . /home/magazine

# nginx
# ADD ./config/nginx/uwsgi_params /etc/nginx/
# ADD ./config/nginx/django.conf /etc/nginx/conf.d/default.conf


ENTRYPOINT ["/home/magazine/entrypoint.sh"]


