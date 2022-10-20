<execution>
===========

`cppreference <execution> <https://en.cppreference.com/w/cpp/header/execution>`_ 

Parallel algorithms execution
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To use algorithms from ``<execution>`` you have to install::

    sudo apt update
    sudo apt install libtbb-dev

and link to your project: ``-ltbb``


Types of concurrency algorithms
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- ``std::seq``          -> Sequenced policy
   - one thread, all instructions executed sequentially
   - mode should be used in testing and debugging
- ``std::par``          -> Parallel policy
   - many threads, multithreading
   - in each thread instructions are executed sequentially
   - all instructions have to be thread safe
   - you should user ``std::mutex``, ``std::atomic<T>`` 
- ``std::par_unseq``    -> Parallel unsequenced policy
   - parallel algorithm's execution may be parallelized, vectorized, or migrated across threads
   -  
- ``std::unseq``        -> Unsequenced policy
   - multithreading and parallel algorithm's execution may be vectorized
   - instructions may be executed in different order in different threads
   - you can't use ``std::mutex::lock()`` becasue of ``interleaved``. It can cause deadlock.
   - dynamic allocation and deallocation is forbidden

New concurrency algorithms
~~~~~~~~~~~~~~~~~~~~~~~~~~

- ``std::reduce``
- ``std::transform_reduce``
- ``std::exclusive_scan``
- ``std::inclusive_scan``
- ``std::transform_inclusive_scan`` and ``transform_exclusive_scan``