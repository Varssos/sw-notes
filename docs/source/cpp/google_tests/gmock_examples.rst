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
    
2. a 