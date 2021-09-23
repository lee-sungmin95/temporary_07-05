FROM python:3.9.0

WORKDIR /home/

RUN echo 'lksmaoidmf'

RUN git clone https://github.com/lee-sungmin95/temporary_07-05.git

WORKDIR /home/temporary_07-05/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash", "-c", "python manage.py migrate --settings=g0705.settings.deploy && python manage.py collectstatic --noinput --settings=g0705.settings.deploy && gunicorn --env DJANGO_SETTINGS_MODULE=g0705.settings.deploy g0705.wsgi --bind 0.0.0.0:8000"]

