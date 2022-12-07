GMock Examples
==============


Simple GMock
~~~~~~~~~~~~

1. Define Mock class::

    class Foo
    {
        virtual ~Foo();
        virtual int get_size() const = 0;
        virtual string describe(const char* name) = 0;
        virtual string describe(int type) = 0;
        virtual bool process(Bar elem, int count) = 0;
    };

    class MockFoo : public Foo
    {
        MOCK_METHOD(int, get_size, (), (const, override));
        MOCK_METHOD(string, describe, (const char* name), (override));
        MOCK_METHOD(string, describe, (int type), (override));
        MOCK_METHOD(bool, process, (Bar elem, int count), (override));
    };

2. Define test with mock default behaviour and expects
3. Validate with expect::

    TEST( MockFoo, size )
    {
        # 2
        MockFoo foo;

        ON_CALL( foo, get_size() ).WillByDefault( testing::Return( 1 ));
        EXPECT_CALL(foo, describe(5)).Times(3)
            .WillRepeatedly(testing::Return("Id: 5"));
        # 3
        EXPECT_EQ( "ok", MyProductionFunction( foo ) );
    }
    

Define default mock method behaviour
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    ON_CALL(mock, some_method(_)).WillByDefault(Return(42));


Define mock expectation
~~~~~~~~~~~~~~~~~~~~~~~
::

    EXPECT_CALL(mock, method(matchers) /*?*/)
        .With(multi_argument_matchers) // ?
        .Times(cardinality)            // ?
        .InSequence(S1..., SN)         // *
        .After(expectations)           // *
        .WillOnce(action)              // *
        .WillRepeatedly(action)        // ?
        .RetiresOnSaturation();        // ?

.. important:: By default it is better to use ``ON_CALL`` than ``EXPECT_CALL``


NiceMocks
~~~~~~~~~

If you specify only default mock behaviour with ``ON_CALL`` without ``EXPECT_CALL`` gmock framework will throw warning. You can avoid it with ``NiceMock`` template::


    TEST( MockFoo, size )
    {
        testing::NiceMock<MockFoo> foo;

        ON_CALL( foo, get_size() ).WillByDefault( testing::Return( 1 ));

        EXPECT_EQ( "ok", MyProductionFunction( foo ) );
    }

    TEST(NiceVsStrictMocks, NiceMockWorksInSilentMode)
    {
        MockFoo foo;

        MyProductionFunction(foo); // warnings
    }

    TEST(NiceVsStrictMocks, NiceMockWorksInSilentMode)
    {
        testing::NiceMock<MockFoo> foo;

        MyProductionFunction(foo); // no warnings
    }


StrictMock
~~~~~~~~~~

On the other hand if you want to throw errors if there is no mock defualt behaviours (``ON_CALL``) or mock expectations ( ``EXPECT_CALL`` ) you can use ``StrictMock`` template::

    TEST(NiceVsStrictMocks, StrictMockReportsUnexpectedCallsAsErrors)
    {
        testing::StrictMock< MockFoo > foo;

        MyProductionFunction(foo); // reported as error - unexpected call
    }