Future types and asynchronic functions
======================================

`Asynchronic functions <https://infotraining.bitbucket.io/cpp-thd/async_future.html>`_ 

Future type classes:
~~~~~~~~~~~~~~~~~~~~

- ``std::future<T>``
- ``std::shared_future<T>``
- ``std::promise<T>``
- ``std::packaged_task<T>``
- function ``std::async()``

std::future
~~~~~~~~~~~

- ``T get()`` - returns the result
- ``bool valid()`` - check if the future has a shared state
- ``void wait()`` - waits for the result to become available
- ``std::future_status wait_for(const std::chrono::duration<Rep, Period> &timeout_duration)`` - waits for the result, returns if it is not available for the specified timeout duration
- ``std::future_status wait_until( const std::chrono::time_point<Clock,Duration>& timeout_time )`` - wait for the result ...

std::future_status:

- ``future_status::deferred``
- ``future_status::ready``
- ``future_status::timeout``




std::future std::promise
~~~~~~~~~~~~~~~~~~~~~~~~

.. note:: 

    1. std::promise
        a. Used to set values or exceptions
    2. std::future 
        a. Used to get values from promise
        b. Ask promise if the value is available
        c. Wait for the promise

**Example:**

.. code-block:: cpp

    #include <iostream>
    #include <thread>
    #include <future>

    void findOdd( std::promise<long int>&& OddSumPromise, long int start, long int end)
    {
        long int OddSum = 0;
        for ( long int i = start; i <= end; ++i)
        {
            if( i & 1 )
            {
                OddSum += i;
            }
        }
        OddSumPromise.set_value(OddSum);
    }

    int main()
    {
        long int start = 0, end = 1900000000;

        std::promise< long int > OddSum;
        std::future< long int > OddFuture = OddSum.get_future();

        std::cout << "Thread Created!!" << std::endl;

        std::thread t1(findOdd, std::move(OddSum), start, end);

        std::cout << " Waiting for result !!" << std::endl;

        std::cout << "OddSum: " << OddFuture.get() << std::endl;

        std::cout << "Completed!!" << std::endl;
        t1.join();


        return 0;
    }


std::async
~~~~~~~~~~

Returns std::future:

- ``auto async(std::launch policy, Function &&f, Args&&... args)``
- ``auto async( Function &&f, Args&&... args)`` (std::launch policy = std::launch::async | std::launch::deferred )

.. note:: 

    1. It runs a function asynchronously ( potentially in a new thread) and returns a std::future that will hold the result
    
    2. There are three launch policies for creating task:
        a. std::launch::async ( different thread)
        b. std::launch::deffered ( the same thread )
        c. std::launch::async | std::launch::deffered


How it works:

1. It automatically creates a thread ( or picks from internal thread pool ) and a promise object for us.
2. Then passes the std::promise object to thread function and returns the associated std::future object.
3. When our passed argument function exits then its value will be set in this promise object, so eventually return value will be available in std::future object


.. code-block:: cpp

    #include <iostream>
    #include <thread>
    #include <future>
    #include <algorithm>

    long int findOdd( long int start, long int end)
    {
        long int OddSum = 0;
        for ( long int i = start; i <= end; ++i)
        {
            if( i & 1 )
            {
                OddSum += i;
            }
        }
        return OddSum;
    }

    int main()
    {
        long int start = 0, end = 1900000000;

        std::cout << "Thread created if policy is std::launch::async!!" << std::endl;
        std::future< long int > OddFuture = std::async(std::launch::deferred, findOdd, start, end);

        std::cout << " Waiting for result !!" << std::endl;

        std::cout << "OddSum: " << OddFuture.get() << std::endl;

        std::cout << "Completed!!" << std::endl;


        return 0;
    }

Producer Consumer Problem
~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: cpp

    #include <iostream>
    #include <thread>
    #include <future>
    #include <algorithm>
    #include <condition_variable>
    #include <deque>

    std::mutex mu;
    std::condition_variable cond;
    std::deque < int> buffer;
    const unsigned int maxBufferSize = 50;

    void producer( int val )
    {
        while ( val )
        {
            std::unique_lock<std::mutex> locker(mu);
            cond.wait(locker, [](){ return buffer.size() < maxBufferSize; });
            buffer.push_back(val);
            std::cout << "Produced: " << val << std::endl;
            val--;
            locker.unlock();
            cond.notify_one();
        }
    }

    void consumer()
    {
        while( true )
        {
            std::unique_lock< std::mutex> locker (mu);
            cond.wait( locker, []() { return buffer.size() > 0;});
            int val = buffer.back();
            buffer.pop_back();
            std::cout << "Consumed: " << val << std::endl;
            locker.unlock();
            cond.notify_one();
        }
    }


    int main()
    {
        std::thread t1( producer, 100);
        std::thread t2( consumer);

        t1.join();
        t2.join();


        return 0;
    }

