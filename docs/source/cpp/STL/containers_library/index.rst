STL Containers library
======================


.. toctree:: 
  :maxdepth: 1

  std_bitset
  std_hash
  std_map
  std_set
  std_vector

`Geeks for geeks STL containers <https://www.geeksforgeeks.org/containers-cpp-stl/>`_ 

Containers in C++ STL:
    - Sequence containers
       - ``array``
       - ``vector``
       - ``deque``
       - ``forward_list``
       - ``list``
    - Associative containers
       - ``set``
       - ``map``
       - ``multiset``
       - ``multimap`` 
    - Unordered associative containers
       - ``unordered_set``
       - ``unordered_map``
       - ``unordered_multiset``
       - ``unordered_multimap`` 
    - Container adaptors
       - ``stack``
       - ``queue``
       - ``priority_queue`` 
       - ``bitset``

STL Sequence Containers
~~~~~~~~~~~~~~~~~~~~~~~

Use sequential containers when you need to access elements by position

Which one sequential containers choose?
---------------------------------------
- Use std:vector as your default sequential container, especially as an alternative to built-in arrays
- If size is known in advance, use std::array instead of a built-in array
- If you add or remove elements frequently at both the front and back of a container, use std::deque
- Use a std::list (not std::deque) if you need to insert/remove elements in the middle of the sequence
- Do not use std::list if you need random access to objects
- Prefer std::vector over std::list if your system uses a cache
- std::string is almost always better than a C-string


std::array
  - fixed size contiguous array
  - nearly complete interface for container
  - fast access for each n-element

std::vector
  - dynamic contiguous array
  - size can be set in a runtime
  - fast inserting and erasing element at the beginning and at the end of the container ( const plus linear complexity )
  - fast acces for each n-element

std::deque
  - allocates memory in chunks (not contigous array)
  - double ended queue
  - fast inserting and erasing element at the beginning and at the end of the container
  - additional step when you get access to n-element. Iterators and access is a little bit slower
  - iterators are smart pointers which navigate in chunks of memory
  - no way to control reallocation

std::list
  - allocates memory by node (not contigous array)
  - fast inserting and erasing element ( const time )
  - linear complexity to find n-element
  - has additional functions like: ``sort()``, ``merge()``, ``reverse()``, ``unique()``, ``remove()``, ``remove_if()``, ``splice()`` 

STL Associative Containers
~~~~~~~~~~~~~~~~~~~~~~~~~~


STL Unordered associative Containers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


STL Container Adaptors
~~~~~~~~~~~~~~~~~~~~~~

.. important:: Adaptors don't have iterators

std::stack:
  - Allow only pushes and pops the element from the back

std::queue:
  - Allow only pushes on the back and pops on the front

std::priority_queue:
  - Order elements in container
  - You can add element to queue and pop element from the front

std::bitset:
  - bit container with fixed size known in compile time
