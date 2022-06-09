Tutorial#2
==========

It is possible to write more than one assertion statement in test cases. If one of them fail, all test will be failed. One test work till first fail. You should set one assertion per one test case

TEST consist of arrange, act, assert
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. image:: img/test_consist_of.png
    :alt:   Test consist of


.. code-block:: cpp

    #include <iostream>
    #include <gtest/gtest.h>

    TEST( TestName, Subtest_1 )
    {
        // Arrange 
        int value = 100;
        int increment = 5;

        // Act 
        value = value + increment;

        // Assert
        ASSERT_EQ( value, 105 );
    }


    int main (int argc, char **argv )
    {
        testing::InitGoogleTest(&argc, argv);

        return RUN_ALL_TESTS();
    }

Unit tests should:
~~~~~~~~~~~~~~~~~~

1. Run extremely fast (within Milliseconds)
2. Must be able to run independently
3. Does not depend upon any external input


Independet 2 unit tests:
~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: cpp

    #include <iostream>
    #include <gtest/gtest.h>

    TEST( TestName, increment_by_5 )
    {
        // Arrange 
        int value = 100;
        int increment = 5;

        // Act 
        value = value + increment;

        // Assert
        ASSERT_EQ( value, 105 );
    }

    TEST( TestName, increment_by_10 )
    {
        // Arrange 
        int value = 100;
        int increment = 10;

        // Act 
        value = value + increment;

        // Assert
        ASSERT_EQ( value, 110 );
    }


    int main (int argc, char **argv )
    {
        testing::InitGoogleTest(&argc, argv);

        return RUN_ALL_TESTS();
    }

String comparing
~~~~~~~~~~~~~~~~


.. code-block:: cpp

    #include <iostream>
    #include <gtest/gtest.h>

    class MyClass{
        std::string id;

        public:

        MyClass(std::string _id) : id(_id) {}
        std::string GetId() { return id; }
    };

    TEST( TestName, increment_by_5 )
    {
        // Arrange 
        MyClass mc ("root");

        // Act 
        std::string value = mc.GetId();

        // Assert
        ASSERT_EQ( value.c_str(), "root" );
    }



    int main (int argc, char **argv )
    {
        testing::InitGoogleTest(&argc, argv);

        return RUN_ALL_TESTS();
    }

**Even if string are equal it will fail. To compare use ASSERT_STREQ instead of ASSERT_EQ!!!!**
Like here:

.. code-block:: cpp

    #include <iostream>
    #include <gtest/gtest.h>

    class MyClass{
        std::string id;

        public:

        MyClass(std::string _id) : id(_id) {}
        std::string GetId() { return id; }
    };

    TEST( TestName, increment_by_5 )
    {
        // Arrange 
        MyClass mc ("root");

        // Act 
        std::string value = mc.GetId();

        // Assert
        ASSERT_STREQ( value.c_str(), "root" );
    }



    int main (int argc, char **argv )
    {
        testing::InitGoogleTest(&argc, argv);

        return RUN_ALL_TESTS();
    }


.. image:: img/string_asserts.png
    :alt: string asserts
