Multithreading in C++
=====================

Multithreading in C++ can be possible by a ``<thread>`` and ``<mutex>`` libraries

This page describe the most important things from these libraries

Threads
~~~~~~~
There are **5** different types we can create threads in C++11 using callable object:

**1. Function pointer**

.. code-block:: cpp

    #include <iostream>
    #include <thread>

    void print( const std::string &text )
    {
        std::cout << text << std::endl;
    }

    int main()
    {
        std::thread t1 ( print, "thread 1");
        std::thread t2 ( print, "thread 2");

        t1.join();
        t2.join();

        return 0;
    }

**2. Lambda function**

.. code-block:: cpp

    #include <iostream>
    #include <thread>

    int main()
    {
        auto fun = [](int x) {
            while ( x -- > 0 )
            {
                std::cout << x << std::endl;
            }
        };

        std::thread t(fun, 10 );
        t.join();

        return 0;
    }

**3. Functor (Function Object)**

.. code-block:: cpp

    #include <iostream>
    #include <thread>

    class Base 
    {
    public:
        void operator () (int x) 
        {
            while( x-- > 0 )
            {
                std::cout << x << std::endl;
            }
        }
    };

    int main()
    {
        std::thread t((Base()), 10 );
        t.join();

        return 0;
    }

**4. Non-static member function**

.. code-block:: cpp

    #include <iostream>
    #include <thread>

    class Base 
    {
    public:
        void run (int x) 
        {
            while( x-- > 0 )
            {
                std::cout << x << std::endl;
            }
        }
    };

    int main()
    {
        Base b;
        std::thread t(&Base::run, &b, 10);
        t.join();

        return 0;
    }

**5. Static member function**

.. code-block:: cpp

    #include <iostream>
    #include <thread>

    class Base 
    {
    public:
        static void run (int x) 
        {
            while( x-- > 0 )
            {
                std::cout << x << std::endl;
            }
        }
    };

    int main()
    {
        std::thread t(&Base::run, 10);
        t.join();

        return 0;
    }



.. important:: If we create multiple threads at the same time it doesn't guarantee which one will start first


