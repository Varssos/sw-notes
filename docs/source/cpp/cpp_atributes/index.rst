C++ attributes
==============

`C++ attributes geekforgeeks <https://www.geeksforgeeks.org/attributes-in-c/>`_ 

The most important are:
    - ``[[nodiscard]]``, if you call function with such attribute and you will use it without assigining somewhere value it will throw warining in compilation time::
        
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