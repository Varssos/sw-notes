Efficiency
==========

`CppCon: Introduction to Hardware Efficiency <https://www.youtube.com/watch?v=Fs_T070H9C8>`_ 

Computationally intensive or memory intensive
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Generally it is better to have code computationally intensive than memory intensive

Your loop will be computationally intensive if:
    - It is processing simple data types (int, char, double) AND
    - The data is stored in an array or vector (just contigious block of memory ) AND
    - Sequential access to values in array ( from 0 to N or from N to 0 )

Otherwise, it is probably memory intensive:
    - Processing (large) classes

Computationally intensive codes are found in domains like:
    - Image, audio and video processing
    - Machine learning
    - Telecommunications
    - Scientific computing

Fixing memory intensive codes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- Use contigious memory like std::vector, std::array
- Instead of using a vector that contains instances of a class, each data member in a struct has its own vector ( ``ArrayOfStructs`` ``(AoS)`` -> ``StructOfArrays`` ``(SOA)`` ). Example: it reduce from original ``194ms`` computation time to ``42 ms``
- ``Loop interchange``. Just avoid jump to memory, it is better to calculate contigious block of memory. Example: ``5.8 sec`` - > ``1.22 sec``
- Use ``vectorization``. ``SIMD`` - single instruction, multiple data. It can run 2-6 times faster. Check autovectorization status with ``-fopt-info-vec-allt`` in gcc


Hardware Efficiency examples
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Finding min and max in (class size 16 bytes, 100M elements ):
    - in the same loop ``207 ms`` 
    - in the separate loop ``368 ms``

Iterating over the same data set twice wastes memory bandwidth!

- Vector of pointers(polymorphism)

You should sort like: child_class1, child_class1, child_class2, child_class_2.... Instead of random order

Ideas for optimizations
~~~~~~~~~~~~~~~~~~~~~~~

- Why is processing of smaller classes faster?
    - The dats is brought to the CPU in blocks (typically 64 bytes)
    - Large classes - > bringing in unused data to the CPU 
    - Move all non-essential data to other
    - Data members that are often accesses together should be declared together in the class definition. This increases the chance that data members in the same data cache block
  
- Random access structures (tree and hash maps) will benefit from improved memory layout
- Flat data structures - > data compact as possible
- For binary trees you can:
    - Use a better memory layout( e.g. van Emde Boas layout)
    - Use n-ary trees instead of binary trees; n-ary trees are more cache friendly
-  For hash maps:
    - Switch to more cache-frienldy implementation, such as hash-map with open addressing
    - Faster implementations of standard data structures, e.g. EA STL  