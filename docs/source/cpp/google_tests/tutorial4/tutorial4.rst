Tutorial#4
==========

Mocking
~~~~~~~

.. code-block:: cpp

    #include <iostream>
    #include <gtest/gtest.h>
    #include <gmock/gmock.h>

    using ::testing::AtLeast;
    using ::testing::Return;
    using ::testing::_;

    class DataBaseConnect
    {
        public:
            virtual bool login(std::string username, std::string password)
            {
                return true;
            }
            virtual bool logout(std::string) { return true;}
            virtual int fetchRecord() { return -1; }
    };

    class MockDB : public DataBaseConnect
    {
        public:
            MOCK_METHOD0(fetchRecord, int() );
            MOCK_METHOD1(logout, bool(std::string username));
            MOCK_METHOD2(login, bool (std::string username, std::string password));
    };

    class MyDatabase
    {
            DataBaseConnect &dbC;
        public:
            MyDatabase (DataBaseConnect &_dbc) : dbC(_dbc) {}

            int Init( std::string username, std::string password )
            {
                if(dbC.login(username, password) != true )
                {
                    std::cout<<"DB Failure"<< std::endl;
                    return -1;
                }
                
                std::cout << "DB Success" << std::endl;
                return 1;
                
            }
    };

    TEST (MyDBTest, LoginTest )
    {
        MockDB mdb;
        MyDatabase db (mdb);
        EXPECT_CALL(mdb, login("Terminator", "I'm Back"))
        .Times(1)
        .WillOnce(Return(true));

        int retValue = db.Init("Terminator", "I'm Back");

        EXPECT_EQ(retValue, 1);
    }

    int main (int argc, char **argv )
    {
        testing::InitGoogleTest(&argc, argv);

        return RUN_ALL_TESTS();
    }

Response:

::

    [==========] Running 2 tests from 1 test suite.
    [----------] Global test environment set-up.
    [----------] 2 tests from MyDBTest
    [ RUN      ] MyDBTest.LoginTest
    DB Success
    [       OK ] MyDBTest.LoginTest (0 ms)
    [ RUN      ] MyDBTest.LoginFailure
    DB Failure
    [       OK ] MyDBTest.LoginFailure (0 ms)
    [----------] 2 tests from MyDBTest (0 ms total)

    [----------] Global test environment tear-down
    [==========] 2 tests from 1 test suite ran. (0 ms total)
    [  PASSED  ] 2 tests.

In case when you do not know which function will be called like login1() or login2()
Instead of using 
::

    EXPECT_CALL(mdb, login1("Terminator", "I'm Back"))
    .Times(AtLeast(1))
    .WillRepeatedly(Return(true));

We can use ::

    ON_CALL(mdb, login1(_,_)).WillByDefault(Return(true));
    ON_CALL(mdb, login2(_,_)).WillByDefault(Return(true));
