std::hash
=========

It returns a hash for passed key. For the same key it returns the same hash.

::

    std::hash< const char * > hashCharPointer;

    std::cout << ( hashCharPointer( "1234" )) << '\n';
    std::cout << ( std::hash< const char*>{} ( "1234" )) << '\n';
    std::cout << ( hashCharPointer( "123" )) << '\n';
    # Output:
    94843382493192
    94843382493192
    94843382493197