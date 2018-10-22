To run this project will be required some libs like Flask and JWT.
To simplify this process we will create a virtual environments inside the app folder.

To do this first clone the repository for your machine.
Open a terminal and goes to the project home folder:

    cd <your_path>/LearnPython3-WebAPI

Now insert this commands in this sequence:

>**Note:** if you are a Windows user you have consider the commands on column "On Windows" (eg.: LearnPython3-WebAPI$ python -m venv venv).

    On macOS                                      On Windows
    --------------------------------------------- -------------------------
    LearnPython3-WebAPI$ pip install virtualenv   
    LearnPython3-WebAPI$ python3 -m venv venv     python -m venv venv
    LearnPython3-WebAPI$ source venv/bin/activate venv\Scripts\activate.bat

This created and initialized the environment.
Paying attention you will note that not your terminal (venv) before the folder path, like this:

    **(venv)** Area51:LearnPython3-WebAPI jeanjmichel$

Everything installed now will be in this environment.

    LearnPython3-WebAPI$ pip install -U flask
    LearnPython3-WebAPI$ pip install -U flask_sqlalchemy
    LearnPython3-WebAPI$ pip install -U PyJWT
    LearnPython3-WebAPI$ pip install -U pylint
    LearnPython3-WebAPI$ pip install -U mysql-connector
    LearnPython3-WebAPI$ pip install -U rope
    
Now let's go code :)