Templates in C++
================

`Infotraining C++ templates <https://infotraining.bitbucket.io/cpp-templates/index.html>`_ 


Different implementation for string and different for other parameters
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.hpp::

    class A
    {
        template < typename T>
        void Print(const std::string &aPropertyName, T aValue );
        void Print(const std::string &aPropertyName, const std::string& aValue );
    
    };

.cpp::

    template < typename T > 
    void A::Print( const std::string &aPropertyName, T aValue )
    {
        std::string lLog = "`" + aPropertyName + "`: " + std::to_string( aValue ) + '\n';
        std::cout << lLog;
    }

    void A::Print( const std::string &aPropertyName, const std::string& aValue )
    {
        std::string lLog = "`" + aPropertyName + "`: " + aValue + '\n';
        std::cout << lLog;
    }



    int main()
    {
        A a;

        std::string lProperty{ "Alarm" };
        double lValue {0.1};
        a.Print( lProperty, lValue );

        std::string lStrValue{ "No Alarm" };
        a.Print( lProperty, lStrValue );

        return 0;
    }

    template void A::Print<int32_t>( const std::string &aPropertyName, int32_t aValue );
