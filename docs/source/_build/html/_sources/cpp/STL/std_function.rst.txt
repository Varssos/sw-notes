std::function
=============

`Cpp reference - std::function <https://en.cppreference.com/w/cpp/utility/functional/function>`_ 

It is a great to use when you can't use polimorphism and you have 2 similar function which differ only with invoking different function

To use::
    
    #include <functional>


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

