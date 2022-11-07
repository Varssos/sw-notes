Multithreading in C++
=====================

.. toctree:: 
    :maxdepth: 1

    thread

On this page there will be presented theoretical knowledge about multithreading in C++. In one moment it can be only modified by one thread.





Critial section
~~~~~~~~~~~~~~~

Concurrent accesses to shared resources can lead to unexpected or erroneous behavior, so parts of the program where the shared resource is accessed need to be protected in ways that avoid the concurrent access

Race condition vs Data race
~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Race Condition

    A race condition occurs when the timing or order of events affects the correctness of a piece of code

- Data Race 

    A data race occuts when one thread accesses a mutable object while another thread is writing to it

Basic lockable objects
~~~~~~~~~~~~~~~~~~~~~~

- Mutex ( Mutual Exclusion )
- Semaphore - binary and counting
- Locks readers-writers

Lockable object concepts
~~~~~~~~~~~~~~~~~~~~~~~~

- **BasicLockable** ( lock(), unlock() )
- **Lockable** ( BasicLockable + try_lock() ) - ``std::mutex``,  ``std::recursive_mutex``
- **TimedLockable** ( Lockable + ( try_lock_until( abs_time )/ try_lock_for(rel_time)) ) -  ``std::timed_mutex``, ``std::recursive_timed_mutex``
- **SharedLockable**