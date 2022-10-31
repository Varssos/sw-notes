std::any
========

Header: ``<any>`` since C++17

It is a type-safe container for single values of any copy constructible type



Assigning an std::any object
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    std::any a = 1;
    // Or:
    std::any a {1};
    // Or std::make_any<T>():
    auto a0 = std::make_any<std::string>("Hello, std::any!\n");
    auto a1 = std::make_any<std::complex<double>>(0.1, 2.3);
    // Or with emplace. Creating object/variable in place:
    std::any x;
    x.emplace<Star>("Procyon", 2943 );
    // For struct:
        struct Star
        {
            std::string name;
            int id;
        };




Destroy contained object and if has value
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
If not empty, destroys the contained object::

    std::any x{1};
    if(x.has_value())
    {
        std::cout << "X has value\n";
    }else
    {
        std::cout << "X has no value\n";
    }
    x.reset();
    if(x.has_value())
    {
        std::cout << "X has value\n";
    }else
    {
        std::cout << "X has no value\n";
    }

    // Output:
    X has value
    X has no value

Swap std::any objects
~~~~~~~~~~~~~~~~~~~~~
::

    std::any x{1},y{2};
    x.swap(y);
    std::cout<< std::any_cast<int>(x) << ' ' << std::any_cast<int>(y) << '\n';
    // Output:
    2 1

Get std::any value and typeid
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    std::any a {1};
    std::cout << a.type().name() << ": " << std::any_cast<int>(a) << '\n';
    a = 3.14;
    std::cout << a.type().name() << ": " << std::any_cast<double>(a) << '\n';
    a = true;
    std::cout << a.type().name() << ": " << std::any_cast<bool>(a) << '\n';
    // Output:
    i: 1
    d: 3.14
    b: true
