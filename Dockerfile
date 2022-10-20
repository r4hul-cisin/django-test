FROM python:3.10.6-alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /code
RUN pip install --upgrade pip
COPY requirements.txt /code
RUN pip install -r requirements.txt
COPY . /code
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
