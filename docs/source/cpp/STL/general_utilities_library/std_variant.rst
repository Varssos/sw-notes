std::variant
============

It was introduced in C++17 as an alternative to unsafe union

`std::variant cppreference <https://en.cppreference.com/w/cpp/utility/variant>`_ 

`Infotraining C++17 variant <https://infotraining.bitbucket.io/cpp-17/variant.html>`_ 

Simple std::variant example::

    std::variant<int, std::string, double> my_variant{"text"};

    std::string s1 = std::get<std::string>(my_variant);  // OK
    std::string s2 = std::get<1>(my_variant); // OK
    std::get<std::string>(my_variant) += "!!!";

    int x = std::get<int>(my_variant); // ERROR - throws std::bad_variant_access

    if (std::string* ptr_str = std::get_if<std::string>(&my_variant); ptr_str != nullptr)
        std::cout << "Stored string: " << *ptr_str << std::endl;


.. important:: In case of no value or bad type it throw ``std::bad_variant_access``


Visit and print variant data::

    std::variant<int, std::string> v1{2};
    std::visit([] (auto&& x) { std::cout << x << ' '; }, v1);

    v1 = "asdf";
    std::visit([] (auto&& x) { std::cout << x << '\n'; }, v1);