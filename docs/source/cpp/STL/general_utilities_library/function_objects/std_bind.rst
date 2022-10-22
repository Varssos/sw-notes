std::bind
=========

`Cpp reference - std::bind <https://en.cppreference.com/w/cpp/utility/functional/bind>`_ 

The function template bind generates a forwarding call wrapper for f. Calling this wrapper is equivalent to invoking f with some of its arguments bound to args

Cppreference example
::

    #include <random>
    #include <iostream>
    #include <memory>
    #include <functional>
    
    void f(int n1, int n2, int n3, const int& n4, int n5)
    {
        std::cout << n1 << ' ' << n2 << ' ' << n3 << ' ' << n4 << ' ' << n5 << '\n';
    }
    
    int g(int n1)
    {
        return n1;
    }
    
    struct Foo {
        void print_sum(int n1, int n2)
        {
            std::cout << n1+n2 << '\n';
        }
        int data = 10;
    };
    
    int main()
    {
        using namespace std::placeholders;  // for _1, _2, _3...
    
        std::cout << "1) argument reordering and pass-by-reference: ";
        int n = 7;
        // (_1 and _2 are from std::placeholders, and represent future
        // arguments that will be passed to f1)
        auto f1 = std::bind(f, _2, 42, _1, std::cref(n), n);
        n = 10;
        f1(1, 2, 1001); // 1 is bound by _1, 2 is bound by _2, 1001 is unused
                        // makes a call to f(2, 42, 1, n, 7)
    
        std::cout << "2) achieving the same effect using a lambda: ";
        n = 7;
        auto lambda = [&ncref=n, n](auto a, auto b, auto /*unused*/) {
            f(b, 42, a, ncref, n);
        };
        n = 10;
        lambda(1, 2, 1001); // same as a call to f1(1, 2, 1001)
    
        std::cout << "3) nested bind subexpressions share the placeholders: ";
        auto f2 = std::bind(f, _3, std::bind(g, _3), _3, 4, 5);
        f2(10, 11, 12); // makes a call to f(12, g(12), 12, 4, 5);
    
        std::cout << "4) bind a RNG with a distribution: ";
        std::default_random_engine e;
        std::uniform_int_distribution<> d(0, 10);
        auto rnd = std::bind(d, e); // a copy of e is stored in rnd
        for(int n=0; n<10; ++n)
            std::cout << rnd() << ' ';
        std::cout << '\n';
    
        std::cout << "5) bind to a pointer to member function: ";
        Foo foo;
        auto f3 = std::bind(&Foo::print_sum, &foo, 95, _1);
        f3(5);
    
        std::cout << "6) bind to a mem_fn that is a pointer to member function: ";
        auto ptr_to_print_sum = std::mem_fn(&Foo::print_sum);
        auto f4 = std::bind(ptr_to_print_sum, &foo, 95, _1);
        f4(5);
    
        std::cout << "7) bind to a pointer to data member: ";
        auto f5 = std::bind(&Foo::data, _1);
        std::cout << f5(foo) << '\n';
    
        std::cout << "8) bind to a mem_fn that is a pointer to data member: ";
        auto ptr_to_data = std::mem_fn(&Foo::data);
        auto f6 = std::bind(ptr_to_data, _1);
        std::cout << f6(foo) << '\n';
    
        std::cout << "9) use smart pointers to call members of the referenced objects: ";
        std::cout << f6(std::make_shared<Foo>(foo)) << ' '
                << f6(std::make_unique<Foo>(foo)) << '\n';
    }

Possible output::

    1) argument reordering and pass-by-reference: 2 42 1 10 7
    1) achieving the same effect using a lambda: 2 42 1 10 7
    2) nested bind subexpressions share the placeholders: 12 12 12 4 5
    3) bind a RNG with a distribution: 0 1 8 5 5 2 0 7 7 10 
    4) bind to a pointer to member function: 100
    5) bind to a mem_fn that is a pointer to member function: 100
    6) bind to a pointer to data member: 10
    7) bind to a mem_fn that is a pointer to data member: 10
    8) use smart pointers to call members of the referenced objects: 10 10