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

Setting the Default Value for a Return Type
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    Bar default_bar;
    // Sets the default return value for type Bar.
    DefaultValue<Bar>::Set(default_bar);

    MockFoo foo;

    // We don't need to specify an action here, as the default
    // return value works for us.
    EXPECT_CALL(foo, CalculateBar());

    foo.CalculateBar();  // This should return default_bar.

    // Unsets the default return value.
    DefaultValue<Bar>::Clear();

Setting the Default Actions for a Mock Method
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Actions Gmock
~~~~~~~~~~~~~

Return Values GMock
-------------------

- ``Return()`` -  return ``void``
- ``Return(value)`` - return ``value``
- ``ReturnArg<N>()`` - return N-th argument ( 0-index base )
- ``ReturnNew<T>(a1, ..., ak)`` - return ``new T(a1, ..., ak)``
- ``ReturnNull()`` - return ``nullptr``
- ``ReturnPointee(ptr)`` - return ``ptr`` pointer value 
- ``ReturnRed(variable)`` - return reference to ``variable``
- ``ReturnRefOfCopy(value)`` - return reference to ``variable`` copy

Define different behaviours depend from arguments
-------------------------------------------------
::

    EXPECT_CALL(mock, my_method(100)).WillOnce(Return(true));
    EXPECT_CALL(mock, my_method(200)).WillOnce(Return(false));

    EXPECT_CALL(mock, my_method(_)).WillRepeatedly(Return(false));
    EXPECT_CALL(mock, my_method(100)).WillRepeatedly(Return(true));


Side effect in gmock
--------------------
::

    class Bar
    {
    public:
        virtual void some_method( bool, int* ) = 0;
    };

    class MockBar : public Bar
    {
    public:
        MOCK_METHOD(void, some_method, (bool, int*), (override));
    };

    TEST( MockBar, SideEffect )
    {
        MockBar mock;
        EXPECT_CALL( mock, some_method(true, testing::_)).WillOnce( testing::SetArgPointee<1>(10));

        int x{0};
        mock.some_method(true, &x); // change x -> 10
        ASSERT_EQ(x, 10 );
    }


Set multiple side effects gmock
-------------------------------
::

    EXPECT_CALL(mock, some_method(true, _)).WillOnce(DoAll(SetArgPointee<1>(10), Return(true)));


Invoke function, functor or lambda gmock
----------------------------------------

``f`` is function, std::function, functor or lambda

You can use:
    - ``f``
    - ``Invoke(f)``
    - ``Invoke(object_pointer, &class::method)``
    - ``InvokeWithoutArgs(f)``
    - ``InvokeWithoutArgs(object_pointer, &class::method )``

::

    EXPECT_CALL(mock, some_method(_, _))
        .WillOnce(InvokeWithoutArgs(other_function));

    EXPECT_CALL(mock, some_method(_, _))
        .WillOnce(InvokeWithoutArgs(IgnoreResult(another_function)));

    EXPECT_CALL(mock, some_method_with_many_args(_, _, _, _))
        .WillOnce(WithArgs<0, 2, 3>(callback_function));

Throw configuration in gmock
----------------------------

::

    InvalidArgumentException my_exception("Error #13");

    EXPECT_CALL(mock, some_method(13)).WillOnce(Throw(my_exception));


Times() in gmock
----------------
::

    class Mock
    {
        MOCK_METHOD(int, my_function, ());
    };

    Mock mock;

    // setting expectation that my_function is called exactly 3 times returning default value
    EXPECT_CALL(mock, my_function()).Times(3);
    EXPECT_CALL(mock, my_function()).Times(Exactly(3));

    // setting expectation that my function is called exactly 3 times returning 10, 0, 0
    EXPECT_CALL(mock, my_function()).Times(3).WillOnce(Return(10));

    ASSERT_EQ(mock.my_function(), 10);
    ASSERT_EQ(mock.my_function(), 0);
    ASSERT_EQ(mock.my_function(), 0);

    // other examples of Times options
    EXPECT_CALL(mock, my_function()).Times(AtLeast(1));
    EXPECT_CALL(mock, my_function()).Times(AtMost(3));
    EXPECT_CALL(mock, my_function()).Times(Between(1, 5));
    EXPECT_CALL(mock, my_function()).Times(AnyNumber());

Assert takes ``EXPECT__CALL()`` from last to first (LIFO) like this::

    TEST(OverridingExpectations, WhenLastConfigurationFitsRestIsInvisible)
    {
        Mock mock;

        EXPECT_CALL(mock, is_saturated())
            .WillOnce(Return(true)):

        EXPECT_CALL(mock, is_saturated())
            .Times(1)
            .WillOnce(Return(false));

        ASSERT_FALSE(mock.is_saturated());
        ASSERT_TRUE(mock.is_saturated()); // error - is_saturated() ivoked twice
    }

To limit such behaviours we can use ``RetiresOnSaturation()``::

    TEST(OverridingExpectations, CanBeManagedWithRetiresOnSaturation)
    {
        Mock mock;

        EXPECT_CALL(mock, is_saturated())
            .WillOnce(Return(true)):

        EXPECT_CALL(mock, is_saturated())
            .Times(1)
            .WillOnce(Return(false))
            .RetiresOnSaturation();

        ASSERT_FALSE(mock.is_saturated());
        ASSERT_TRUE(mock.is_saturated()); // ok
    }

Order of executing methods in gmock
-----------------------------------

``After()``::

    Expectation setup = EXPECT_CALL(mock, setup());
    Expectation validate = EXPECT_CALL(mock, validate());

    EXPECT_CALL(mock, run()).After(setup, validate);

``ExpectationSet()``::

    ExpectationSet all_inits;

    for(int i = 0; i < devs_no; ++i)
        all_inits += EXPECT_CALL(mock, init_dev(i));

    EXPECT_CALL(mock, run()).After(all_inits);

``Sequence()``::

    TEST(SequencedCalls, AllCallAreInSequence)
    {
        Sequence s1, s2;

        EXPECT_CALL(mock, my_method(1)).InSequence(s1, s2);
        EXPECT_CALL(mock, my_method(2)).InSequence(s1);
        EXPECT_CALL(mock, other_method(_)).InSequence(s2);
    }


Matchers gmock
~~~~~~~~~~~~~~

Placeholder values in gmock match
---------------------------------
::

    EXPECT_CALL(mock, some_method(_));
    EXPECT_CALL(mock, some_method(A<int>())); // usable for overloaded functions
    EXPECT_CALL(mock, some_method(An<int>()));

Comparison gmock match
----------------------
::

    EXPECT_CALL(mock, some_method(Eq(100)));
    EXPECT_CALL(mock, some_method(Ne(100)));
    EXPECT_CALL(mock, some_method(Lt(100)));
    EXPECT_CALL(mock, some_method(Gt(100)));

    EXPECT_CALL(mock, print(IsNull()));
    EXPECT_CALL(mock, print(NotNull()));

C-string and std::string gmock match
------------------------------------
    
- ContainsRegex(string)
- EndsWith(suffix)
- HasSubstr(string)
- MatchesRegex(string)
- StartsWith(prefix)
- StrCaseEq(string)
- StrCaseNe(string)
- StrEq(string)
- StrNe(string)

Combining gmock matches
-----------------------

- AllOf(m1, m2, ...)
- AnyOf(m1, m2, ...)
- Not(m)

::

    EXPECT_CALL(mock, some_method(AllOf(NotNull(), Not(StrEq("")), 5)));


class members and getters gmock match
-------------------------------------

- Field(&class::field, m)
- Property(&class::property, m)
- Key(v/m) - EXPECT_CALL(my_map, Contains(Key(42)))
- Pair(m1, m2)

::

    struct Gadget
    {
        int id;
    };

    struct MockUser
    {
        MOCK_METHOD(void, use, (Gadget&));
    };

    MockUser user;

    EXPECT_CALL(user, use(Field(&Gadget::id, Gt(0))).Times(2));

    Gadget g1{10};
    user.use(g1); // ok

    Gadget g2{-1};
    user.use(g2); // report error


Container match gmock
---------------------
Whole container

- ContainerEq(other)
- IsEmpty()
- Size(m)
- Contains(e)
- Each(e)

Rest

- ElementsAre(e0, e1, ...)
- ElementsAreArray({...})
- Pointwise(m, container)
- UnorderedElementsAre(...)
- WhenSorted(m)
- WhenSortedBy(comparator, m)

Example::

    MOCK_METHOD1(save_data, void(const vector<int>& numbers));

    EXPECT_CALL(mock, save_data(UnorderedElementsAre(1, Gt(0), _, 5)));

    vector<int> data = { 1, 10, -100, 5 };
    mock.save_data(data); // ok

Multiple argument match
-----------------------
::

    EXPECT_CALL(mock, some_method(_, _)).With(Eq());
    EXPECT_CALL(mock, some_method(_, _, _)).With(AllArgs(Eq())); // the same as above
    EXPECT_CALL(mock, some_method(_, _, _)).With(Args<0, 3>(Eq()));


Creating custom match objects
-----------------------------

1. ``Truly(predicate)``::
   
    int is_even(int n) { return (n % 2) == 0 ? 1 : 0; }

    // some_method() must be called with an even number.
    EXPECT_CALL(mock, some_method(Truly(is_even)));

2. macro ``MATCHER()``::

    MATCHER(IsEven, std::string(negation ? "isn't" : "is") + " even") { return arg % 2 == 0; }

    MATCHER_P(IsDivisible, value, std::string(negation ? "isn't" : "is")
        + " divisible by " + std::to_string(value)) { return arg % value == 0; }

    MATCHER_P(InCloseRange, low, high, std::to_string(arg)
        + std::string(negation ? " isn not" : " is")
        + " in range [" + std::to_string(low) + ", "
        + std::to_string(high) + "]") {
        return low <= arg && arg >= high;
    }
3. Own class derived from ``MatcherInterface`` 


Matchers in assertions
----------------------
::

    ASSERT_THAT(result, AllOf(NotNull(), StrNe("")));

    EXPECT_THAT(result, AnyOf(Gt(100), Le(-100)));

Mocking non virtual methods
~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    // A simple logger class.  None of its members is virtual.
    class Logger
    {
    public:
        void log(const std::string& message);
        void warn(const std::string& warning);
        void error(const std::string& error_msg, std::error_code err_code);
    };

Mock logger class::

    class MockLogger
    {
    public:
        MOCK_METHOD(void, log, (const std::string& message));
        MOCK_METHOD(void, warn, (const std::string& warning));
        MOCK_METHOD(void, error, (const std::string& error_msg, std::error_code err_code));
    };

::

    template <class LoggerImpl>
    Connection create_connection(const std::string& connection_str, LoggerImpl* logger)
    {
        // ...

        if (logger)
            logger->log("Established connection to " + connection_str);

        // ...
    }

    template <class LoggerImpl>
    class DataReader
    {
        LoggerImpl* logger_;
    public:
        explicit DataReader(LoggerImpl* logger) : logger_{logger}
        {}

        void read_data(const std::string& cmd)
        {
            //...
            if (logger_)
                logger_->log("Command "s + cmd + " has been executed");
        }
    };

::

    FileLogger logger{"log.dat"};

    auto conn = create_connection("http://localhost:8000", &logger);

    DataReader<FileLogger> reader{&logger};
    reader.read_data("select * from table");

::

    MockLogger mock_logger;
    EXPECT_CALL(mock_logger, /*...*/);
    // set more expectations on mock_logger...

    DataReader<MockLogger> reader(&mock_logger);
    // exercise reader...