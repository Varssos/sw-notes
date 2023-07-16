Turtle
======

This section present how to prepare your windows environment to start with ``turtle`` python module from scratch.


Install python
~~~~~~~~~~~~~~

https://www.python.org/downloads/

``Turtle`` module is already installed by default in python3. You don't need to install any new packages.

Prepare VS code
~~~~~~~~~~~~~~~

1. `Download from here vs code <https://code.visualstudio.com/download>`_ 
2. Create a folder for turtle projects
3. Open this folder in VS Code: ``File``-> ``Open folder..``
4. Create file e.g. ``test.py``
5. Insert this example code::

    import turtle

    t = turtle.Turtle()
    t.shape('turtle')
    t.forward(200)
    t.right(90)
    t.forward(150)
    t.right(90)
    t.forward(100)
    t.home()
    turtle.exitonclick()

6. Run code with ``Run`` -> ``Start Debugging`` or ``Run Without Debugging`` or click ``F5``

Articles about turtle module
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

`Wstęp do Python Turtle <https://analityk.edu.pl/python-turtle-grafika-zolwia/>`_ 

`Wyścig żółwi <http://analityk.edu.pl/python-turtle-wyscig-zolwi/>`_ 

`Obsługa zdarzeń <http://analityk.edu.pl/python-turtle-obsluga-zdarzen/>`_ 

`Kółko krzyżyk <http://analityk.edu.pl/tic-tac-toe-czyli-kolko-i-krzyzyk-w-python-turtle/>`_

`The Beginner's Guide to Python Turtle <https://realpython.com/beginners-guide-python-turtle/>`_ 

`Python turtle module documentation <https://docs.python.org/3/library/turtle.html>`_ 

https://www.youtube.com/watch?v=pzUFOPr7HiI