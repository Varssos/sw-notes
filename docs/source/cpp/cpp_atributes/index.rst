C++ Attributes
==============

`C++ attributes geekforgeeks <https://www.geeksforgeeks.org/attributes-in-c/>`_ 

The most important are:


[[noreturn]] ( C++11 )
~~~~~~~~~~~~~~~~~~~~~~

Indicate that the function does not return a value (Even void!!!)::

    [[noreturn]] void f();

.. code-block:: cpp

    #include <iostream>
    #include <thread>  

    [[noreturn]] void f()
    {
        // without it infinite loop, compiler will throw  a warning and potentialy segmentation fault
        while( 1 )
        {
            std::cout << "123\n";
            std::this_thread::sleep_for(std::chrono::seconds(1));
        }
        // Some code that does not return
        // back the control to the caller
        // In this case the function returns
        // back to the caller without a value
        // This is the reason why the
        // warning "noreturn' function does return' arises
    }
    
    void g()
    {
        std::cout << "Code is intented to reach here";
    }
    
    int main()
    {
        f();
        g();
    }

[[deprecated]] ( C++14 )
~~~~~~~~~~~~~~~~~~~~~~~~

Indicates that the name or entity declared with this attribute has become obsolete and must not be used for some specific reason. This attribute can be applied to namespaces, functions, classes structures or variables.::

    [[deprecated("Reason for deprecation")]]

    // For Class/Struct/Union
    struct [[deprecated]] S;

    // For Functions
    [[deprecated]] void f();

    // For namespaces
    namespace [[deprecated]] ns{}

    // For variables (including static data members)
    [[deprecated]] int x;

[[nodiscard]] ( C++17 )
~~~~~~~~~~~~~~~~~~~~~~~

If you call function with such attribute and you will use it without assigining somewhere value it will throw warining in compilation time::
        
    [[ nodiscard ]]
    int multiply ( int x, int y )
    {
        return x*y;
    }

    class[[nodiscard]] my_class{};
    
    // Automatically becomes nodiscard marked
    my_class fun()
    {
        return my_class();
    }

    int main()
    {
        int value = multiply( 2, 4);
        std::cout << multiply( 3, 4) << '\n';
        multiply( 3, 2);

        fun();
        
        return 0;
    }


[[maybe_unused]] ( C++17 )
~~~~~~~~~~~~~~~~~~~~~~~~~~

Used to suppress warnings on any unused entities (For eg: An unused variable or an unused argument to a function)::

    //Variables
    [[maybe_used]] bool log_var = true;

    //Functions
    [[maybe_unused]] void log_without_warning();

    //Function arguments 
    void f([[maybe_unused]] int a, int b);

No warnings with ``-Wall``:

.. code-block:: cpp

    int main()
    {
        [[maybe_unused]] int a = 2;
    }


[[fallthrough]] ( C++17 )
~~~~~~~~~~~~~~~~~~~~~~~~~

[[fallthrough]] indicates that a fallthrough in a switch statement is intentional. Missing a break or return in a switch statement is usually considered a programmer’s error but in some cases fallthrough can result in some very terse code and hence it is used.
Note: Unlike other attributes a fallthrough requires a semicolon after it is declared.::

    void process_alert(Alert alert)
    {
        switch (alert) {
        case Alert::Red:
            evacuate();
        // Compiler emits a warning here
        // thinking it is done by mistake
    
        case Alert::Orange:
            trigger_alarm();
    
            // this attribute needs semicolon
            [[fallthrough]];
        // Warning suppressed by [[fallthrough]]
    
        case Alert::Yellow:
            record_alert();
            return;
    
        case Alert::Green:
            return;
        }
    }

[[likely]] ( C++20 )
~~~~~~~~~~~~~~~~~~~~

For optimisation of certain statements that have more probability to execute than others. Likely is now available in latest version of GCC compiler for experimentation purposes::

    int f(int i)
    {
        switch (i) {
        case 1:
            [[fallthrough]];
            [[likely]] case 2 : return 1;
        }
        return 2;
    }

[[no_unique_address]] ( C++20 )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Indicates that this data member need not have an address distinct from all other non-static data members of its class. This means that if the class consist of an empty type then the compiler can perform empty base optimisation on it::

    // empty class ( No state!)
    struct Empty {
    };
    
    struct X {
        int i;
        Empty e;
    };
    
    struct Y {
        int i;
        [[no_unique_address]] Empty e;
    };
    
    int main()
    {
        // the size of any object of
        // empty class type is at least 1
        static_assert(sizeof(Empty) >= 1);
    
        // at least one more byte is needed
        // to give e a unique address
        static_assert(sizeof(X) >= sizeof(int) + 1);
    
        // empty base optimization applied
        static_assert(sizeof(Y) == sizeof(int));
    }

[[expects]] ( C++20 )
~~~~~~~~~~~~~~~~~~~~~

It specifies the conditions (in form of contract) that the arguments must meet for a particular function to be executed::

    return_type func ( args...) [[expects : precondition]]

    Example:
    void list(node* n)[[expects:n != nullptr]]