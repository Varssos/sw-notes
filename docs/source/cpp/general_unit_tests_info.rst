General info about unittests
============================


Unit tests
~~~~~~~~~~

Mock
~~~~

Nice `tutorial <https://cpp-polska.pl/post/podstawy-pracy-z-googlemock>`_ about google mocks 

Main mock function is to replace external environment for our code. 
For example instead of using Modbus slave device, we use its simulator

Fake object
-----------

It only imitate real object behaviour

Stub
----

Only difference between fake object and stub is that stub return fixed values like::

    std::string getMessage() const override {
        return "this is stub message";
    }

Mock object
-----------

Mocks are objects which allow us to define **stubs**
