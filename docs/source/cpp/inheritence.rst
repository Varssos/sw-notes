Inheritence
===========

:download:`Class test templates <class-test.tar>` 

Rules
~~~~~

1. When base class is pure virtual, member functions has to be signed as virtual too like this
``virtual void HandleResponse () = 0;``

If function is not implemented in cpp it will throw segmentation fault. That is why it has ``= 0"`` 

1. It is impossible to create ``template`` abstract class member functions
2. Virtual functions can't have different parameter types. In this situation 
3. It is impossible to create an object of pure virtual class
4. Use ``std::dynamic_pointer_cast<Derived>(obj)->`` for up/down casting

Upcasting and downcasting with classes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

`Upcasting/Downcastring <https://www.bogotobogo.com/cplusplus/upcasting_downcasting.php>`_ 

**Downcasting to pass its smart pointer as an argument** 

.. code-block:: cpp

    #include <iostream>
    #include <memory>

    class Base
    {
    public:
        int x;
        virtual void f() = 0;
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

**How to access function which is only in derived class, when we have only a pointer to base class** 

.. code-block:: cpp

    #include <iostream>
    #include <memory>

    class Base
    {
    public:
        int x;
        uint16_t y;
        uint32_t z;
        
        virtual ~Base() = default;
    };

    class Derived: public Base
    {
        public: 
        Derived() {};
        virtual ~Derived() {};

        void Write( uint16_t lReg) { y = lReg; }
    };

    class Derived2: public Derived
    {
        public:
        void Write( uint32_t lReg) { z = lReg; }
        
    };


    int main()
    {
        std::shared_ptr<Base> obj = std::make_shared<Derived>();

        // Write is invisible when try to call obj directly for base object;
        // To avoid this problem just use dynamic cast to desired class
        std::dynamic_pointer_cast<Derived>(obj)->Write((uint16_t) 3 );
        std::cout << obj->y << std::endl;

        return 0;
    }
