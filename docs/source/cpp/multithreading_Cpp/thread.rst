Threads and mutex
=================

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

Race condition
~~~~~~~~~~~~~~

1. Race condition is a situation where two or more threads/process are trying to change common data at the same time
2. If there is a race condition then we have to protect it and the protected section is called critical section/region


Mutex
~~~~~

**Mutex: Mutual Exclusion**

1. Mutex is used to avoid race condition
2. The simpliest way to avoid race condition with mutex is use ``lock()`` and ``unlock()`` functions

.. code-block:: cpp

    #include <iostream>
    #include <thread>
    #include <mutex>

    int myAmount = 0;
    std::mutex m;

    void addMoney()
    {
        m.lock();
        ++myAmount;
        m.unlock();
    }


    int main()
    {
        std::thread t1(addMoney);
        std::thread t2(addMoney);

        t1.join();
        t2.join();

        return 0;
    }



std::mutex::try_lock()
~~~~~~~~~~~~~~~~~~~~~~

1. try_lock() tries to lock the mutex. Returns immediately. On success lock acquisition returns true otherwise returns false
2. If try_lock() is not able to lock mutex, then it doesn't get blocked that's why it is called non-blocking
3. If try_lock() is called again by the same thread which owns the mutex, the behaviour is undefined. It is a dead lock situation with undefined behaviour ( if you want to be able to lock the same mutex by same thread more than one time the go for recursive_mutex )

.. code-block:: cpp

    #include <iostream>
    #include <thread>
    #include <mutex>

    int counter = 0;
    std::mutex m;

    void increaseTheCounterFor100000Time()
    {
        for( int i = 0; i < 100000; ++i )
        {
            m.try_lock();
            ++counter;
            m.unlock();
        }
    }


    int main()
    {
        std::thread t1(increaseTheCounterFor100000Time);
        std::thread t2(increaseTheCounterFor100000Time);

        t1.join();
        t2.join();

        std::cout << "counter: " << counter << std::endl;

        return 0;
    }

std::try_lock()
~~~~~~~~~~~~~~~

Syntax: std::try_lock(m1, m2, m3, m4,...,mn);

1. std::try_lock() tries to lock all the lockable objects passed in it one by one in given order
2. On success this funciton returns -1  otherwise it will return 0-based mutex index number which it could not lock
3. If it fails to lock and if the mutex then it will release all the mutex it locked before
4. If a call to try_lock results in an exception, unlock is called for and locked objects before rethrowing

std::timed_mutex
~~~~~~~~~~~~~~~~

1. std::timed_mutex is blocked till timeout_time or the lock is aquired and returns true on success
2. Member functions
    a. lock()
    b. try_lock()
    c. try_lock_for()
    d. try_lock_until()
    e. unlock()

**try_lock_for()**

.. code-block:: cpp

    #include <iostream>
    #include <thread>
    #include <mutex>

    int myAmount = 0;
    std::timed_mutex m;

    void increment(int i )
    {
        if(m.try_lock_for(std::chrono::seconds(1)))
        {
            ++myAmount;
            std::this_thread::sleep_for ( std::chrono::seconds(2) );
            std::cout <<"thread " << i << " entered " << std::endl;
            m.unlock();
        }else
        {
            std::cout << "thread " << i << " couldn't enter" << std::endl;
        }
    }


    int main()
    {
        std::thread t1(increment, 1 );
        std::thread t2(increment, 2 );

        t1.join();
        t2.join();

        std::cout << myAmount << std::endl;

        return 0;
    }

Output::
    
    thread 2 couldn't enter
    thread 1 entered 
    1

Timeout for mutex is shorter than execution of function, so only one thread will be executed

**try_lock_until()** 

.. code-block:: cpp

    #include <iostream>
    #include <thread>
    #include <mutex>

    int myAmount = 0;
    std::timed_mutex m;

    void increment(int i )
    {
        auto now = std::chrono::steady_clock::now();

        if(m.try_lock_until(now + std::chrono::seconds(1) ))
        {
            ++myAmount;
            std::this_thread::sleep_for ( std::chrono::seconds(2) );
            std::cout <<"thread " << i << " entered " << std::endl;
            m.unlock();
        }else
        {
            std::cout << "thread " << i << " couldn't enter" << std::endl;
        }
    }


    int main()
    {
        std::thread t1(increment, 1 );
        std::thread t2(increment, 2 );

        t1.join();
        t2.join();

        std::cout << myAmount << std::endl;

        return 0;
    }

std::recursive_mutex
~~~~~~~~~~~~~~~~~~~~

1. It is same as mutex but, same thread can lock one mutex multiple times using recursive_mutex
2. If thread t1 first call lock/try_lock on recursive_mutex m1, then m1 is locked by t1, now as t1 is running in recursion t1 can call lock/try_lock and number of times there is no issue
3. But if t1 have acquired 10 time lock/try_lock on mutex m1 then thread t1 will have to unlock it 10 times otherwise no other thread will be able to lock mutex m1. It means that recursive_mutex keeps count how many times it was locked so that many times it should be unlocked
4. How many time we can lock recursive_mutex is not defined but when that number reaches and if we were calling lock() it will return std::system_error or if we were calling try_lock() then it will return false

.. code-block:: cpp

    #include <iostream>
    #include <thread>
    #include <mutex>

    std::recursive_mutex m1;
    int buffer = 0;

    void recursion( char c, int loopFor )
    {
        if ( loopFor < 0 )
            return;

        m1.lock();
        std::cout << " " << buffer++ << std::endl;
        recursion(c, --loopFor );
        m1.unlock();
    }

    int main()
    {
        std::thread t1(recursion, '1' , 10 );
        std::thread t2(recursion, '2', 10 );

        t1.join();
        t2.join();

        return 0;
    }


std::lock_guard
~~~~~~~~~~~~~~~

1. It is very light weight wrapper for owning mutex on scoped basis
2. It aquires mutex lock the moment you create the object of lock_guard
3. It automatically removes the lock while goes out of scope
4. You can explicitly unlock the lock_guard
5. You can copy lock_guard

.. code-block:: cpp

    #include <iostream>
    #include <thread>
    #include <mutex>

    std::mutex m1;
    int buffer = 0;

    void task(const char* threadNumber, int loopFor)
    {
        std::lock_guard<std::mutex> lock(m1);
        for( int i = 0; i < loopFor; ++i )
        {
            buffer++;
            std::cout << threadNumber << " " << buffer << std::endl;
        }
    }

    int main()
    {
        std::thread t1(task, "T1" , 10 );
        std::thread t2(task, "T2" , 10 );

        t1.join();
        t2.join();

        return 0;
    }

std::unique_lock
~~~~~~~~~~~~~~~~

1. The class unique_lock is a mutex ownership wrapper
2. It allows:
    a. Can Have Different Locking Strategies
    b. time-constrained attempts at locking (try_lock_for, try_lock_until )
    c. recursive locking
    d. transfer of lock ownership ( move not copy )
    e. condition variables

Locking strategies:
1. defer_lock
2. try_to_lock
3. adopt_lock

**Simple lock like lock_guard**

.. code-block:: cpp

    #include <iostream>
    #include <thread>
    #include <mutex>

    std::mutex m1;
    int buffer = 0;

    void task( char c, int loopFor )
    {
        std::unique_lock<std::mutex> lock(m1);
        for( int i=0; i < loopFor; ++i )
        {
            buffer++;
            std::cout << c << " " << buffer << std::endl;
        }
    }

    int main()
    {
        std::thread t1(task, '1' , 10 );
        std::thread t2(task, '2', 10 );

        t1.join();
        t2.join();

        return 0;
    }

**Defer lock**

.. code-block:: cpp

    #include <iostream>
    #include <thread>
    #include <mutex>

    std::mutex m1;
    int buffer = 0;

    void task( char c, int loopFor )
    {
        std::unique_lock<std::mutex> lock(m1, std::defer_lock);
        lock.lock();
        for( int i=0; i < loopFor; ++i )
        {
            buffer++;
            std::cout << c << " " << buffer << std::endl;
        }
    }

    int main()
    {
        std::thread t1(task, '1' , 10 );
        std::thread t2(task, '2', 10 );

        t1.join();
        t2.join();

        return 0;
    }

Condition Variable
~~~~~~~~~~~~~~~~~~

.. important:: Condition Variable are used for two purposes: 
    
    1. Notify other threads
    2. Waiting for some conditions

1. Condition variable allows running threads to wait on some conditions and once those conditions are met the waiting thread is notified using:
    a. notify_one()
    b. notify_all()
2. You need mutex to use condition variable
3. If some thread want to wait on some condition then it has to do these things:
    a. Acquire the mutex lock using std::unique_lock<std::mutex> lock(m);
    b. Execute wait, wait_for, or wait_until. The wait operations atomically release the mutex and suspend the execution of the thread
    c. When the condition variable is notified, the thread is awakened, and the mutex is atomically reacquired. The thread should then check the condition and resume waiting if the wake up was spurious



.. code-block:: cpp

    #include <iostream>
    #include <thread>
    #include <mutex>
    #include <condition_variable>

    std::condition_variable cv;
    std::mutex m;
    long balance = 0;

    void addMoney( int money )
    {
        std::lock_guard<std::mutex> lg(m);
        balance += money;
        std::cout << "Amount added. Current balance: " << balance << std::endl;
        cv.notify_one();
    }

    void withdrawMoney( int money )
    {
        std::unique_lock<std::mutex> ul(m);
        cv.wait(ul, [] { return (balance != 0 ) ? true : false; });
        if( balance >= money )
        {
            balance -=money;
            std::cout << "Amount deducted: " << money << std::endl;
        }else
        {
            std::cout << " Amount cant be deducted, current balance is less than " << money << std::endl;
        }
        std::cout << "Current balance is: " << balance << std::endl;
    }

    int main()
    {
        std::thread t1(withdrawMoney, 500 );
        std::thread t2(addMoney, 500 );

        t1.join();
        t2.join();

        return 0;
    }

Output::

    Amount added. Current balance: 500
    Amount deducted: 500
    Current balance is: 0

First will be executed addMoney then withdrawMoney()

DeadLock example
~~~~~~~~~~~~~~~~

Dead lock example. It lock first mutex and try to lock second which is locked by other thread. So all threads wait for releasing/unlocking thread but it will not occur

.. code-block:: cpp

    #include <iostream>
    #include <thread>
    #include <mutex>
    #include <condition_variable>

    std::mutex m1, m2;

    void thread1 ()
    {
        m1.lock();
        std::this_thread::sleep_for(std::chrono::seconds(1));
        m2.lock();
        std::cout << "Thread1" << std::endl;
        m1.unlock();
        m2.unlock();
    }

    void thread2 ()
    {
        m2.lock();
        std::this_thread::sleep_for(std::chrono::seconds(1));
        m1.lock();
        std::cout << "Thread2" << std::endl;
        m2.unlock();
        m1.unlock();
    }

    int main()
    {
        std::thread t1 ( thread1 );
        std::thread t2 ( thread2 );

        t1.join();
        t2.join();

        return 0;
    }

Thread synchronization
~~~~~~~~~~~~~~~~~~~~~~

To solve problem with race condition we use a mutex to cover critical sections

std::lock()
~~~~~~~~~~~

It is used to lock multiple mutex at the same time. 

.. important:: 
    1. All arguments are locked via a sequence of calls to lock(), try_lock(), or unlock() on each argument
    
    2. Order of locking is not defined ( it will try to lock provided mutex in any order and ensure that there is no dead lock)
    
    3. It is a blocking call  

**No deadlock examples:**

1. :: 

    Thread 1: 
    std::lock(m1, m2);   
    
    Thread 2: 
    std::lock(m1, m2); 

2. ::

    Thread 1: 
    std::lock(m1, m2);
    
    Thread 2: 
    std::lock(m2, m1);

3. ::

    Thread 1: 
    std::lock(m1, m2, m3, m4);

    Thread 2: 
    std::lock(m3,m4);
    std::lock(m1, m2);

**Ad.1**

.. code-block:: cpp

    #include <iostream>
    #include <thread>
    #include <mutex>
    #include <condition_variable>

    std::mutex m1, m2;

    void thread1 ()
    {
        while ( 1 )
        {
            std::lock( m1, m2);
            std::cout << "Thread1" << std::endl;
            m1.unlock();
            m2.unlock();
        }
    }

    void thread2 ()
    {
        while ( 1 )
        {
            std::lock(m1, m2);
            std::cout << "Thread2" << std::endl;
            m2.unlock();
            m1.unlock();
        }
        
    }

    int main()
    {
        std::thread t1 ( thread1 );
        std::thread t2 ( thread2 );

        t1.join();
        t2.join();

        return 0;
    }


**Examples with dead lock:**

1. ::

    Thread 1: 
    std::lock(m1, m2); 
    std::lock(m3, m4);

    Thread 2:
    std::lock(m3, m4);
    std::lock(m1, m2);

