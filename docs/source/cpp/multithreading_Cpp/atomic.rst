std::atomic
===========

`Atomic theoretical knowledge <https://infotraining.bitbucket.io/cpp-thd/atomic.html>`_ 

`std::atomic cppreference <https://en.cppreference.com/w/cpp/atomic/atomic>`_ 

.. important:: Add flag ``-latomic`` when you compile 



.. warning:: 1. There is no atomic multiplicaiton like ``x*=2``
    2. ``x = x + 1`` and ``x = x * 2`` is not atomic!!



std::atomic<T>
~~~~~~~~~~~~~~

- ``bool is_lock_free()`` - check if the atomic object is lock-free 
- ``void store( T desired, std::memory_order = std::memory_order_seq_cst )`` - atomically replaces the value of the atomic object with a non-atomic argument
- ``T load ( std::memory_order order = std::memory_order_seq_cst )`` - atomically replaces the value of the atomic object with a non-atomic argument
- ``T exchange( T desired, std::memory_order order = std::memory_order_seq_cst )`` - atomically replaces the value of the atomic object and obtains the value held previously
- ``bool compare_exchange_week/strong(T& expected, T desired, std::memory_order success, std::memory_order failure)`` - atomically compares the value of the atomic object with non-atomic argument and performs atomic exchange if equal or atmoic load if not
- ``T fetch_add( T arg, std::memory_order order = std::memory_order_seq_cst)`` - atomically adds the argument to the value stored in the atomic object and obtains the value held previously
- ``T fetch_sub(...)``
- ``T fetch_and(...)``
- ``T fetch_or(...)``
- ``T fetch_xor(...)``
