std::optional
=============

Header: ``<optional>``

A common use case for optional is the return value of a function that may fail. 
In case if you won't initialize any value for variable you can use  ``value_or()`` method instead of creating special constructor etc.


Access the contained std::optional<T> value without checking if initialize
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    std::optional<int> x {12};
    std::cout << *x;

Check whether the std::optional<T> object contains a value
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- ``constexpr explicit operator bool() const noexcept;``
- ``constexpr bool has_value() const noexcept;``


Example::
    
    1st
    if( x )
    {
        std::cout << "Has value\n";
    }

    2nd
    std::cout << x.has_value();

Getting std::optinal value
~~~~~~~~~~~~~~~~~~~~~~~~~~

Getting value if not initialized::

    std::optional<int> o;
    std::cout <<   o.value() << '\n';
    # Output:
    std::bad_optional_access

    std::optional<int> o;
    std::cout <<   o.value_or(2) << '\n';
    # Output: 
    2

Getting value when initialized::

    std::optional<int> o{13};
    // OR: o = 13;
    std::cout <<   o.value_or(2) << '\n';
    # Output:
    13
