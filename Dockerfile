FROM alpine:3.5

WORKDIR /usr/src/app/

# copying project files to container
COPY requirements.txt /usr/src/app/
COPY app.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/

# installing python and pip
RUN apk add --update py2-pip
RUN pip install --upgrade pip

# installing requirements
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

# run the application
CMD ["python", "/usr/src/app/app.py"]