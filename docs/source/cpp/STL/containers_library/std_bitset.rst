.. warning::
    This page has been migrated to varssos-mkdocs (docs/cpp/stl/containers_library/std_bitset.md). This copy is outdated and no longer maintained.

std::bitset
===========


Examples::

    // uint16_t value = 0x0007;
    // std::bitset<16> set (value );
    std::bitset<8> set ( std::string ( "11110000" ));

    std::cout << set << '\n';

    std::cout << set.count( );