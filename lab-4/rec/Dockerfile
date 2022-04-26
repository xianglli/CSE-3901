# syntax=docker/dockerfile:1
FROM conda/miniconda3:latest
RUN apt-get update -qq && apt-get install -y python3-pip && apt install -y build-essential libpython3-dev  
WORKDIR /rec
COPY . /rec
# ADD requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt


EXPOSE 5000
CMD ["python3", "server.py"]
