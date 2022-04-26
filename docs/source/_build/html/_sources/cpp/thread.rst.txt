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


Thread join
~~~~~~~~~~~

1. std::thread::join() wait till thread is finished
2. If needed it is possible to check if thread is joinable before joining ( ``joinable()`` function )

.. important:: Double join will cause program termination



.. code-block:: cpp

    #include <iostream>
    #include <thread>

    void run( int count )
    {
        while( count -- > 0 )
        {
            std::cout << count << std::endl;
        }  
        std::this_thread::sleep_for(std::chrono::seconds(3));
    }

    int main()
    {
        std::thread t1(run, 10);
        std::cout << "main()" << std::endl;
        t1.join();
        std::cout << "main() after" << std::endl;

        return 0;
    }

Thread detach
~~~~~~~~~~~~~

1. This is used to detach newly created thread from the parent thread
2. Always check before detaching a thread that it is joinable, otherwise we may end up double detaching and double detach() will result into program termination
3. If we have detached thread and main function is returning then the detached thread execution is suspended

.. code-block:: cpp

    #include <iostream>
    #include <thread>

    void run( int count )
    {
        while( count -- > 0 )
        {
            std::cout << count << std::endl;
        }  
        std::this_thread::sleep_for(std::chrono::seconds(3));
        std::cout << "thread finished" << std::endl;
    }

    int main()
    {
        std::thread t1(run, 10);
        std::cout << "main()" << std::endl;

        t1.detach();
        
        std::cout << "main() after" << std::endl;

        return 0;
    }

.. important:: If you do not use ``join()`` or ``detached()`` it will cause ``Aborted (core dumped)``



