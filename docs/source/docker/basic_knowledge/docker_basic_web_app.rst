Docker basic web app
====================

Basic docker web app files
~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    .
    ├── Dockerfile
    ├── app.py
    └── requirements.txt

app.py

.. code-block:: python

    from flask import Flask

    app = Flask(__name__)

    @app.route('/')
    def hello_world():
        return "Hello,Internet"

Dockerfile

.. code-block:: dockerfile

    FROM python:3.8

    COPY requirements.txt .
    RUN pip install -r requirements.txt

    COPY app.py .

    CMD FLASK_APP=app python -m flask run --host=0.0.0.0

requirements.txt::

    flask


How to run container on port 5123
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    # Build docker image
    docker build --tag pyapp:web .

    # Run app in docker container on port 5000 and connect it ( or forward idk ) to host 5123 port
    docker run --publish 5123:5000 pyapp:web