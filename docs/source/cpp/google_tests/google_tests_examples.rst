GoogleTest Framework Examples
=============================


GTest main
~~~~~~~~~~

.. code-block:: cpp

    #include <gtest/gtest.h>
    #include <gmock/gmock.h>


    int main (int argc, char **argv )
    {
        // testing::FLAGS_gtest_filter = "*push_back*";
        testing::InitGoogleTest(&argc, argv);

        return RUN_ALL_TESTS();
    }


Basic GTest Test case
~~~~~~~~~~~~~~~~~~~~~

Production code

.. code-block:: cpp

    class A
    {
        int x;
        int y;

        public:
        A() : x{1}, y{2} {}
        A(const int aX, const int aY) : x{aX}, y{aY} {}



        int GetX() const { return x; }
        int GetY() const { return y; }
    };

Test cases

::

    TEST(BasicTest, GetXDefault )
    {
        A a;
        
        ASSERT_EQ( 1, a.GetX() );
    }

    TEST(BasicTest, GetXSet)
    {
        A a{10,20};

        EXPECT_EQ( 10, a.GetX() );
    }

Basic GTest ASSERT_TRUE or ASSERT_False
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

::

    TEST( BasicTest, TRUE)
    {
        ASSERT_TRUE( true );
    }


GTest Fixture
~~~~~~~~~~~~~

::

    class TestVector : public testing::Test
    {
        protected:
            std::vector<int> vec;

        public:
        TestVector() 
        {
            std::cout << "Fixture constructor\n";
            constexpr int size{5};
            vec.reserve(size);
            for(int i = 0; i < size; ++i )
            {
                vec.emplace_back(i);
            }
        }
        ~TestVector() override
        {

        }

        void SetUp() override
        {
            std::cout << "SetUp()\n";
            for( int i = 0; i < 5; ++i )
            {
                vec[i] = 1;
            }
        }

        void TearDown() override
        {

        }
    };

    TEST_F( TestVector, TestingVector )
    {
        constexpr int expected[5] = { 0, 1, 2, 3, 4 };

        for(int i = 0; i < 5; ++i )
        {
            EXPECT_EQ(expected[i], vec[i]) << "index: " << i;
        }
    }

GTest Sharing Resources Between Tests in the Same Test Suite
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Static constructor has to be ``SetUpTestCase()`` and destructor ``TearDownTestSuite()``::

    class SharedArrayTests : public testing::Test
    {
        protected:
        static std::vector<int> vec;

        static void SetUpTestCase()
        {
            std::cout << "Inside static fixxture constructor\n";
            constexpr int size{5};
            vec.reserve(size);
            for( int i = 0; i < size; ++i )
            {
                std::cout << "Emplace: " << i << '\n';
                vec.emplace_back(i);
            }
        }
    };


    std::vector<int> SharedArrayTests::vec;

    TEST_F( SharedArrayTests, ArrayTestFirst )
    {
        EXPECT_EQ( vec[0], 0 );
    }

GTest exceptions
~~~~~~~~~~~~~~~~
::

    void simple_crash()
    {
        throw std::runtime_error("ERRRRR");
    }

    TEST(ExceptionTest, SimpleCrashThrowsException )
    {
        EXPECT_THROW( simple_crash(), std::runtime_error );
    }

    TEST(ExceptionTest, AnyThrow )
    {
        EXPECT_ANY_THROW( simple_crash() );
    }

    TEST(ExceptionTest, NoThrow )
    {
        EXPECT_NO_THROW( no_throw() );
    }

GTest floats
~~~~~~~~~~~~
::

    TEST( FloatEquality, Float )
    {
        constexpr float a = 1.0;
        constexpr float b = 1.0 + 1e-7;
        EXPECT_FLOAT_EQ( a, b);
    }

    TEST( FloatEquality, Near )
    {
        constexpr float a = 1.0, b = 1.1;
        EXPECT_NEAR( a, b, 0.2 );
    }

GTest Death tests
~~~~~~~~~~~~~~~~~
::

    bool is_prime(long n)
    {
        if (n > 0)
        {
            // some implementation
        }
        else
        {
            std::cerr << "Error: Negative or zero input\n";
            exit(-1);
        }
    }

    TEST(PrimeTest, PrimesForPositiveNumbers)
    {
        ASSERT_EXIT(
            is_prime(-1), ::testing::ExitedWithCode(-1),
            "Error: Negative or zero input"
        );
    }

Direct invoking SUCCESS, FAIL, ADD_FAILURE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    TEST( SwitchTest, Succeed )
    {
        int i {1};
        switch(i)
        {
            case 1:
                SUCCEED();
                break;
            case 2:
                break;
            default:
                FAIL() << "Nie powinno nas tu byc";
        }
    }

Value-parametrized GTests
~~~~~~~~~~~~~~~~~~~~~~~~~
4 steps::

    struct SumTestParams
    {
        int a, b, expected;

        SumTestParams( int a, int b, int expected ) : a{a}, b{b}, expected{expected} {}
    };

    struct ParametrizedTest : public testing::TestWithParam<SumTestParams>
    {

    };

    TEST_P(ParametrizedTest, AddingTwoNumbers )
    {
        SumTestParams params = GetParam();
        ASSERT_EQ(sum(params.a, params.b), params.expected);
    }

    SumTestParams params[] = { {1, 2, 3}, {5, 6, 11}, {665, 1, 666} };
    INSTANTIATE_TEST_CASE_P(PackOfTests, ParametrizedTest, testing::ValuesIn(params));


Typed tests
~~~~~~~~~~~
::

    template <typename T >
    class VectorTest : public testing::Test
    {
        public:
            using VectorType = std::vector<T>;
            inline static T value_{};

            VectorType vec_{ T{}, T{}, value_ };
    };

    using MyListOfTypes = testing::Types<char, int, uint64_t>;
    TYPED_TEST_SUITE(VectorTest, MyListOfTypes );

    TYPED_TEST( VectorTest, push_back_test )
    {
        TypeParam default_value = TestFixture::value_;

        auto size_before = TestFixture::vec_.size();
        TestFixture::vec_.push_back( default_value );

        ASSERT_EQ(size_before + 1, TestFixture::vec_.size() );
    }
