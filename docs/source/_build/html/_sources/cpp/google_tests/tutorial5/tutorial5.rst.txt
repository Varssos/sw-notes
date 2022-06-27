Tutorial#5
==========

Invoking original and other implemetations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: cpp

    #include <iostream>
    #include <gtest/gtest.h>
    #include <gmock/gmock.h>

    using ::testing::AtLeast;
    using ::testing::Return;
    using ::testing::_;
    using ::testing::Invoke;

    class DataBaseConnect
    {
        public:
            virtual bool login(std::string username, std::string password) { std::cout <<"original login" <<std::endl; return true; }
            virtual bool login2(std::string username, std::string password) { return true; }
            virtual bool logout(std::string) { return true;}
    };

    class MockDB : public DataBaseConnect
    {
        public:
            MOCK_METHOD1(logout, bool(std::string username));
            MOCK_METHOD2(login, bool (std::string username, std::string password));
            MOCK_METHOD2(login2, bool (std::string username, std::string password));
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
        DataBaseConnect dbTest;

        EXPECT_CALL(mdb, login("Terminator", "I'm Back"))
        .Times(AtLeast(1))
        .WillOnce(Invoke(&dbTest, &DataBaseConnect::login));
        
        // .WillRepeatedly(Return(true));
        // ON_CALL(mdb, login(_,_)).WillByDefault(Return(true));

        int retValue = db.Init("Terminator", "I'm Back");

        EXPECT_EQ(retValue, 1);
    }


    int main (int argc, char **argv )
    {
        testing::InitGoogleTest(&argc, argv);

        return RUN_ALL_TESTS();
    }

Using Invoke, it run code inside a invoked function


Setting default actions
~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: cpp

    #include <iostream>
    #include <gtest/gtest.h>
    #include <gmock/gmock.h>

    using ::testing::AtLeast;
    using ::testing::Return;
    using ::testing::_;
    using ::testing::Invoke;
    using ::testing::DoDefault;

    class DataBaseConnect
    {
        public:
            virtual bool login(std::string username, std::string password) { std::cout <<"original login" <<std::endl; return true; }
            virtual bool login2(std::string username, std::string password) { return true; }
            virtual bool logout(std::string) { return true;}
    };

    class MockDB : public DataBaseConnect
    {
        public:
            MOCK_METHOD1(logout, bool(std::string username));
            MOCK_METHOD2(login, bool (std::string username, std::string password));
            MOCK_METHOD2(login2, bool (std::string username, std::string password));
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

    struct testABC{
        bool dummylogin(std::string a, std::string b)
        {
            std::cout << "Dummy login gets called" << std::endl;
            return true;
        }
    };

    TEST (MyDBTest, LoginTest )
    {
        MockDB mdb;
        MyDatabase db (mdb);
        DataBaseConnect dbTest;
        // testABC dbTest;

        ON_CALL(mdb, login(_, _)).WillByDefault(Invoke(&dbTest, &DataBaseConnect::login));

        EXPECT_CALL(mdb, login("Terminator", "I'm Back"))
        .Times(AtLeast(1))
        .WillOnce(DoDefault());

        // .WillOnce(Invoke(&dbTest, &DataBaseConnect::login));
        
        // .WillRepeatedly(Return(true));
        // ON_CALL(mdb, login(_,_)).WillByDefault(Return(true));

        int retValue = db.Init("Terminator", "I'm Back");

        EXPECT_EQ(retValue, 1);
    }


    int main (int argc, char **argv )
    {
        testing::InitGoogleTest(&argc, argv);

        return RUN_ALL_TESTS();
    }


Performing multiple actions
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: cpp

    #include <iostream>
    #include <gtest/gtest.h>
    #include <gmock/gmock.h>

    using ::testing::AtLeast;
    using ::testing::Return;
    using ::testing::_;
    using ::testing::Invoke;
    using ::testing::DoDefault;
    using ::testing::DoAll;

    class DataBaseConnect
    {
        public:
            virtual bool login(std::string username, std::string password) { std::cout <<"original login" <<std::endl; return true; }
            virtual bool login2(std::string username, std::string password) { return true; }
            virtual bool logout(std::string) { return true;}
    };

    class MockDB : public DataBaseConnect
    {
        public:
            MOCK_METHOD1(logout, bool(std::string username));
            MOCK_METHOD2(login, bool (std::string username, std::string password));
            MOCK_METHOD2(login2, bool (std::string username, std::string password));
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
        DataBaseConnect dbTest;
        // testABC dbTest;

        // ON_CALL(mdb, login(_, _)).WillByDefault(Invoke(&dbTest, &DataBaseConnect::login));

        EXPECT_CALL(mdb, login("Terminator", "I'm Back"))
        .Times(AtLeast(1))
        // .WillOnce(DoAll(Invoke(&dbTest, &test)))
        .WillOnce(DoAll(Invoke(&dbTest, &DataBaseConnect::login), 
                    Invoke(&dbTest, &DataBaseConnect::login), Return(true) ));
        
        // .WillRepeatedly(Return(true));
        // ON_CALL(mdb, login(_,_)).WillByDefault(Return(true));

        int retValue = db.Init("Terminator", "I'm Back");

        EXPECT_EQ(retValue, 1);
    }


    int main (int argc, char **argv )
    {
        testing::InitGoogleTest(&argc, argv);

        return RUN_ALL_TESTS();
    }
