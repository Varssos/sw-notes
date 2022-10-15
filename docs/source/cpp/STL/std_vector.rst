std::vector
===========

.. important:: If possible, try to reserve enough memory with ``vec.reserve(<size>);``. Every time when you push_back element to vector and capability is exceeded. It has to reserve contigous memory with enough memory( it depends, but in most cases n->2n ) and copy all data to new location.  

.. important:: It is prefered to use ``vec.emplace_back( args )`` instead of ``vector::push_back( args )``. It creates an object in place and avoid additional copying. 


Write a function ``filter`` that removes odd numbers and duplicate even numbers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


.. code-block:: cpp

    #include <catch2/catch_test_macros.hpp>
    #include <catch2/matchers/catch_matchers_container_properties.hpp>
    #include <catch2/matchers/catch_matchers_vector.hpp>
    #include <vector>
    #include <iostream>
    #include <set>
    
    void filter ( std::vector<int> &vec )
    {
        std::set<int> duplicated {};

        for( auto  it = vec.begin(); it != vec.end(); )
        {
            if( *it%2 )
            {
                it = vec.erase( it );
            }else
            {
                if( duplicated.count( *it ) > 0 )
                {
                    it = vec.erase( it );
                }else
                {
                    duplicated.insert( *it );
                    ++it;
                }
            }
        }
    }

    TEST_CASE("given an empty vector filter does nothing", "[filter]") {
        std::vector<int> v{};
        filter(v);
        REQUIRE_THAT(v, Catch::Matchers::IsEmpty());
    }

    TEST_CASE("given a filtered vector, filter does nothing", "[filter]") {
        std::vector<int> v{-2, 2};
        filter(v);
        REQUIRE(v == std::vector{-2, 2});
    }

    TEST_CASE(
        "given a vector, filter removes odd numbers and duplicate even numbers",
        "[filter]") {
        std::vector v{-2, 1, 4, 1, -2, 4};
        filter(v);
        REQUIRE_THAT(v, Catch::Matchers::UnorderedEquals(std::vector{-2, 4}));
    }