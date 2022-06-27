Tutorial#3
==========

Test fixtures
~~~~~~~~~~~~~

.. code-block:: cpp

    #include <iostream>
    #include <gtest/gtest.h>

    class MyClass{
        int baseValue;

        public:

        MyClass(int _bv) : baseValue( _bv ) {}
        void Increment ( int byValue )
        {
            baseValue += byValue;
        }
        int getValue () { return baseValue; }
    };

    TEST( ClassTest, increment_by_5 )
    {
        MyClass mc(100);

        mc.Increment(5);

        ASSERT_EQ(mc.getValue(), 105 );
    }

    TEST( ClassTest, increment_by_10 )
    {
        MyClass mc(100);

        mc.Increment(10);

        ASSERT_EQ(mc.getValue(), 110 );
    }


    int main (int argc, char **argv )
    {
        testing::InitGoogleTest(&argc, argv);

        return RUN_ALL_TESTS();
    }


For multiple tests cases you have to repeat arrange every time in function. To reduce code, use test fixtures this way:


.. code-block:: cpp

    #include <iostream>
    #include <gtest/gtest.h>

    class MyClass{
        int baseValue;

        public:

        MyClass(int _bv) : baseValue( _bv ) {}
        void Increment ( int byValue )
        {
            baseValue += byValue;
        }
        int getValue () { return baseValue; }
    };

    struct MyClassTest : public testing::Test {
        MyClass *mc;
        void SetUp() { mc = new MyClass(100); }
        void TearDown() { delete mc; }
    };


    TEST_F( MyClassTest, increment_by_5 )
    {
        mc->Increment(5);

        ASSERT_EQ(mc->getValue(), 105 );
    }

    TEST_F( MyClassTest, increment_by_10 )
    {

        mc->Increment(10);

        ASSERT_EQ(mc->getValue(), 110 );
    }


    int main (int argc, char **argv )
    {
        testing::InitGoogleTest(&argc, argv);

        return RUN_ALL_TESTS();
    }


Example test fixture for stack class
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: cpp

    #include <iostream>
    #include <vector>
    #include <gtest/gtest.h>

    class Stack {
        std::vector<int> vstack = {};

        public:
        void push ( int value) { vstack.push_back(value);}
        int pop()
        {
            if(vstack.size() > 0 )
            {
                int value = vstack.back();
                vstack.pop_back();
                return value;
            }else
            {
                return -1;
            }
        }
        int size() { return vstack.size(); }
    };

    struct stackTest : public testing::Test
    {
        Stack s1;
        void SetUp() 
        {
            int values[] = {1,2,3,4,5,6,7,8,9};
            for( auto &val : values )
            {
                s1.push(val); 
            }

        }
        void TearDown() {}
    };


    TEST_F( stackTest, PopTest )
    {
        int lastPoppedValue = 9;
        while(lastPoppedValue != 1 )
        {
            EXPECT_EQ(s1.pop(), lastPoppedValue--);
        }
    }

    TEST_F( stackTest, SizeValidity )
    {
        int size = s1.size();
        for( size; size > 0; size--)
        {
            ASSERT_NE(s1.pop(), -1);
        }
    }

    int main (int argc, char **argv )
    {
        testing::InitGoogleTest(&argc, argv);

        return RUN_ALL_TESTS();
    }
