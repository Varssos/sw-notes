.. warning::
    This page has been migrated to varssos-mkdocs (docs/cpp/stl/containers_library/std_map.md). This copy is outdated and no longer maintained.

std::map
========

.. warning:: You should remember that if you even print map with key that does not exist. It will add empty pair into map!!!


::

    std::map<int, std::string, std::less<int> > map = {
        {1, "Monday"},
        {2, "Thuesday"},
        {3, "Wednesday"}
    };

    map.insert( std::map<int, std::string>::value_type( 4, "Thursday" ));

    map.insert( std::pair( 6, "Saturday" ));

    std::cout << map[7];

    for( auto &[number, day] : map )
    {
        std::cout << number << ": " << day << '\n';
    }