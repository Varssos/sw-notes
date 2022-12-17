std::numeric_limits
===================

Header ``<limits>``

`std::numeric_limits cppreference <https://en.cppreference.com/w/cpp/types/numeric_limits>`_ 

Useful examples

std::numeric_limits<T>::digits
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    std::cout << std::boolalpha << std::numeric_limits<uint32_t>::is_signed << '\n';
    std::cout << std::boolalpha << std::numeric_limits<int32_t>::is_signed << '\n';
    # Output:
    32
    31


std::numeric_limits<T>::digits10
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    std::cout << std::numeric_limits<uint32_t>::digits10 << '\n';
    std::cout << std::numeric_limits<uint16_t>::digits10 << '\n';
    # Output:
    9   # 4 294967295
    4   # 6 5535


std::numeric_limits<T>::min()
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    std::cout << std::numeric_limits<int32_t>::min() << '\n';
    std::cout << std::numeric_limits<int16_t>::min() << '\n';
    std::cout << std::numeric_limits<uint32_t>::min() << '\n';
    std::cout << std::numeric_limits<uint16_t>::min() << '\n';
    # Output:
    -2147483648
    -32768
    0
    0

std::numeric_limits<T>::max()
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    std::cout << std::numeric_limits<int32_t>::max() << '\n';
    std::cout << std::numeric_limits<int16_t>::max() << '\n';
    std::cout << std::numeric_limits<uint32_t>::max() << '\n';
    std::cout << std::numeric_limits<uint16_t>::max() << '\n';
    # Output:
    2147483647
    32767
    4294967295
    65535