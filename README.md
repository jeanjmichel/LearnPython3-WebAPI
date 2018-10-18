To run this project will be required some libs like Flask and JWT.
To simplify this process we will create a virtual environments inside the app folder.

To do this first clone the repository for your machine.
Open a terminal and goes to the project home folder:

    cd <your_path>/LearnPython3-WebAPI

Now insert this commands in this sequence:

>**Note:** if you are a Windows user you have disconsider when I wrote "python3" in this commands below and use just "python" (eg.: LearnPython3-WebAPI$ python -m venv venv). The same have be done with "LearnPython3-WebAPI$ source venv/bin/activate", disconsider "source" and call just "LearnPython3-WebAPI$ venv/bin/activate".

    LearnPython3-WebAPI$ pip install virtualenv
    LearnPython3-WebAPI$ python3 -m venv venv
    LearnPython3-WebAPI$ source venv/bin/activate

This created and initialized the environment.
Paying attention you will note that not your terminal (venv) before the folder path, like this:

    (venv) Area51:LearnPython3-WebAPI jeanjmichel$

Everything installed now will be in this environment.

    LearnPython3-WebAPI$ pip install --upgrade pip (optional)
    LearnPython3-WebAPI$ pip install -U flask
    LearnPython3-WebAPI$ pip install -U jwt
    LearnPython3-WebAPI$ pip install -U pylint
    LearnPython3-WebAPI$ pip install -U mysql-connector
    LearnPython3-WebAPI$ pip install -U rope
    
Let's go code now :)