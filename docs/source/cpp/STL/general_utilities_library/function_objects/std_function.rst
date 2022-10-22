std::function
=============

`Cpp reference - std::function <https://en.cppreference.com/w/cpp/utility/functional/function>`_ 

Header: ``<functional>``

It is a general purpose polymorphic function wrapper

std::function cppreference example
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: cpp

    #include <functional>
    #include <iostream>
    
    struct Foo {
        Foo(int num) : num_(num) {}
        void print_add(int i) const { std::cout << num_+i << '\n'; }
        int num_;
    };
    
    void print_num(int i)
    {
        std::cout << i << '\n';
    }
    
    struct PrintNum {
        void operator()(int i) const
        {
            std::cout << i << '\n';
        }
    };
    
    int main()
    {
        // store a free function
        std::function<void(int)> f_display = print_num;
        f_display(-9);
    
        // store a lambda
        std::function<void()> f_display_42 = []() { print_num(42); };
        f_display_42();
    
        // store the result of a call to std::bind
        std::function<void()> f_display_31337 = std::bind(print_num, 31337);
        f_display_31337();
    
        // store a call to a member function
        std::function<void(const Foo&, int)> f_add_display = &Foo::print_add;
        const Foo foo(314159);
        f_add_display(foo, 1);
        f_add_display(314159, 1);
    
        // store a call to a data member accessor
        std::function<int(Foo const&)> f_num = &Foo::num_;
        std::cout << "num_: " << f_num(foo) << '\n';
    
        // store a call to a member function and object
        using std::placeholders::_1;
        std::function<void(int)> f_add_display2 = std::bind( &Foo::print_add, foo, _1 );
        f_add_display2(2);
    
        // store a call to a member function and object ptr
        std::function<void(int)> f_add_display3 = std::bind( &Foo::print_add, &foo, _1 );
        f_add_display3(3);
    
        // store a call to a function object
        std::function<void(int)> f_display_obj = PrintNum();
        f_display_obj(18);
    
        auto factorial = [](int n) {
            // store a lambda object to emulate "recursive lambda"; aware of extra overhead
            std::function<int(int)> fac = [&](int n){ return (n < 2) ? 1 : n*fac(n-1); };
            // note that "auto fac = [&](int n){...};" does not work in recursive calls
            return fac(n);
        };
        for (int i{5}; i != 8; ++i) { std::cout << i << "! = " << factorial(i) << ";  "; }
    }

Possible output::

    -9
    42
    31337
    314160
    314160
    num_: 314159
    314161
    314162
    18
    5! = 120;  6! = 720;  7! = 5040;

void function without argument
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: cpp

    #include <iostream>
    #include <functional>

    class Class
    {
    private:
        /* data */
    public:
        Class(/* args */);
        ~Class();
        void Foo() { std::cout<< "Printing..."<<std::endl; };
    };

    Class::Class()
    {

    }

    Class::~Class()
    {
        
    }

    class Class2
    {
    private:
        /* data */
    public:
        Class2(/* args */);
        ~Class2();
        void Foo2( std::function<void()> aFunction )
        { 
        aFunction(); 
        
        };
    };

    Class2::Class2()
    {

    }

    Class2::~Class2()
    {
        
    }


    int main()
    {

        Class a;
        Class2 b;
        b.Foo2( std::bind( &Class::Foo, a) );

        return 0;
    }


non-void function without arguments
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: cpp

    #include <iostream>
    #include <functional>

    class Class
    {
    private:
        /* data */
    public:
        Class(/* args */);
        ~Class();
        int Foo() {  return 2;};
    };



    class Class2
    {
    private:
        /* data */
    public:
        Class2(/* args */);
        ~Class2();
        void Foo2( std::function<int()> aFunction )
        { 
            aFunction(); 
        };
    };


    int main()
    {

        Class a;
        Class2 b;
        b.Foo2( std::bind( &Class::Foo, a) );

        return 0;
    }



void function with argument and with std::placeholder
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: cpp

    #include <iostream>
    #include <functional>

    using namespace std::placeholders;

    class Class
    {
    private:
        /* data */
    public:
        Class(/* args */);
        ~Class();
        void Foo( int x ) { std::cout<< x <<std::endl; };
    };

    Class::Class()
    {

    }

    Class::~Class()
    {
        
    }

    class Class2
    {
    private:
        /* data */
    public:
        Class2(/* args */);
        ~Class2();
        void Foo2( std::function<void(int x)> aFunction )
        { 
        aFunction( 2 ); 
        
        };
    };

    Class2::Class2()
    {

    }

    Class2::~Class2()
    {
        
    }


    int main()
    {

        Class a;
        Class2 b;
        b.Foo2( std::bind( &Class::Foo, a, _1) );

        return 0;
    }



non-void function with arguments 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: cpp

    #include <iostream>
    #include <functional>

    using namespace std::placeholders;

    class Class
    {
    private:
        /* data */
    public:
        Class(/* args */);
        ~Class();
        int Foo( int x ) { return x; };
    };

    Class::Class()
    {

    }

    Class::~Class()
    {
        
    }

    class Class2
    {
    private:
        /* data */
    public:
        Class2(/* args */);
        ~Class2();
        int Foo2( std::function<int(int x)> aFunction )
        { 
        return aFunction( 2 ); 
        };
    };

    Class2::Class2()
    {

    }

    Class2::~Class2()
    {
        
    }


    int main()
    {

        Class a;
        Class2 b;
        int y = b.Foo2( std::bind( &Class::Foo, a, _1) );
        std::cout << y << std::endl;
        return 0;
    }

