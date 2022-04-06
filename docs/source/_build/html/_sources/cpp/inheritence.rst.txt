Inheritence
===========



Upcasting and downcasting with classes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

`Upcasting/Downcastring <https://www.bogotobogo.com/cplusplus/upcasting_downcasting.php>`_ 

.. code-block:: cpp

    #include <iostream>
    #include <memory>

    class Base
    {
    public:
        int x;
        virtual void f() = 0 ;
        virtual ~Base() {};
    };

    class Derived: public Base
    {
        
        void f() override { std::cout << "Derived::f()" << std::endl;}
    public: 
        int y;
    };

    void smart_pointer_function( std::shared_ptr<Derived> aPointer )
    {
        aPointer->x = 1;
        aPointer->y = 2;
    }

    void print_derived_y( std::shared_ptr<Derived> aPointer )
    {
        std::cout << "y: " << aPointer->y;
    }



    int main()
    {
        std::shared_ptr<Base> obj;

        obj = std::make_shared<Derived>();

        smart_pointer_function( std::dynamic_pointer_cast<Derived>(obj) );
        print_derived_y(std::dynamic_pointer_cast<Derived>(obj));

        return 0;
    }
