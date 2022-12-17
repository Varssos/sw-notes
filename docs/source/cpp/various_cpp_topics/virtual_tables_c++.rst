Virtual Tables in C++
=====================

`Understanding Virtual Tables in C++ <https://pabloariasal.github.io/2017/06/10/understanding-virtual-tables/>`_ 


Example why you should know how it works:

.. code-block:: cpp

    #include <iostream>

    class A
    {
        public:
        int data[2];

        A(int x, int y) : data{x, y} {}
        virtual void f() {}
    };

    int main(int argc, char **argv)
    {
        A a(22, 33);

        int *arr = (int *) &a;
        std::cout << arr[0] << std::endl;
        std::cout << arr[1] << std::endl;
        std::cout << arr[2] << std::endl;
        std::cout << arr[3] << std::endl;

        std::cout << sizeof( a ) << '\n';

        return 0;
    }

Output::

    -477577888
    21941
    22
    33
    16

.. code-block:: cpp

    #include <iostream>

    class A
    {
        public:
        int data[2];

        A(int x, int y) : data{x, y} {}
        // virtual void f() {}
    };

    int main(int argc, char **argv)
    {
        A a(22, 33);

        int *arr = (int *) &a;
        std::cout << arr[0] << std::endl;
        std::cout << arr[1] << std::endl;
        std::cout << arr[2] << std::endl;
        std::cout << arr[3] << std::endl;

        std::cout << sizeof( a ) << '\n';

        return 0;
    }

Output::

    22
    33
    661241088
    -981341463
    8

