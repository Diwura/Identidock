FROM python:3.6

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install Flask==2.0.2 uWSGI==2.0.19.1 requests==2.25.1 redis==3.5.3

WORKDIR /app
COPY app /app
COPY cmd.sh /
EXPOSE 9090 9191
USER uwsgi

CMD ["/cmd.sh"]
