Pseudo-random number generation
===============================

`cppreference random <https://en.cppreference.com/w/cpp/header/random>`_ 

https://stackoverflow.com/questions/13445688/how-to-generate-a-random-number-in-c


::

    std::random_device dev;
    std::mt19937 rng(dev());
    std::uniform_int_distribution<std::mt19937::result_type> dist6(1,6); // distribution in range [1, 6]

    std::cout << dist6(rng) << std::endl;