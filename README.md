To run this project will be required some libs like Flask and JWT.
To simplify this process we will create a virtual environments inside the app folder.

To do this first clone the repository for your machine.
Open a terminal and goes to the project home folder:

    cd <your_path>/LearnPython3-WebAPI

Now insert this commands in this sequence:

    LearnPython3-WebAPI$ python3 -m venv venv
    LearnPython3-WebAPI$ source venv/bin/activate

This created and initialized the environment.
Paying attention you will note that not your terminal (venv) before the folder path, like this:

    (venv) Area51:LearnPython3-WebAPI jeanjmichel$

Everything installed now will be in this environment.

    LearnPython3-WebAPI$ pip install --upgrade pip
    LearnPython3-WebAPI$ pip install -U flask
    LearnPython3-WebAPI$ pip install -U jwt
    LearnPython3-WebAPI$ pip install -U pylint

Running this command you will see all libs installed:

    LearnPython3-WebAPI$ pip freeze

    asn1crypto==0.24.0
    cffi==1.11.5
    Click==7.0
    cryptography==2.3.1
    Flask==1.0.2
    idna==2.7
    itsdangerous==0.24
    Jinja2==2.10
    jwt==0.5.4
    MarkupSafe==1.0
    pycparser==2.19
    six==1.11.0
    Werkzeug==0.14.1

Let's go code now :)