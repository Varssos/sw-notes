.. warning::
    This page has been migrated to varssos-mkdocs (docs/cpp/various_cpp_topics/lvalue_rvalue.md). This copy is outdated and no longer maintained.

L-value vs r-value
==================

`AGH article about lvalue vs rvlaue <https://home.agh.edu.pl/~mbargiel/teaching/cpp/slides/cpp-slides.php>`_ 

.. image:: ./value_categories-1.jpg


Lvalues::

    foo() // zwracana wartość odnosi się do zmiennej statycznej 'i'.
    a // odnosi się do zmiennej 'a' można przypisać do zmiennej int&
    bar // odnosi się do zmiennej `bar`. zwracany typ to Bar&
    bar.m // odnosi się do pola `m` obiektu `bar`. Można przypisać do zmiennej  int&

Not lvalues::

    5 // nie odnosi się do żadnej istniejącej zmiennej.
    Bar{} // nie odnosi się do żadnej istniejącej zmiennej, lecz tworzy nową.
    std::move(a); // zwracany typ jest T&&, a nie T&