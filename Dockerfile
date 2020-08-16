FROM ubuntu:18.04
RUN apt-get update -y
RUN apt-get install -y python3.7 python3-pip python-dev build-essential
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.7 10
RUN python3.7 -m pip install pip
ADD . /sample_flask
WORKDIR /sample_flask
RUN python -m pip install -r requirement.txt
ENTRYPOINT ["python"]
CMD ["flask_hello_dock.py"]
