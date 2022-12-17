Endianness
==========

https://www.techtarget.com/searchnetworking/definition/big-endian-and-little-endian

https://www.section.io/engineering-education/what-is-little-endian-and-big-endian/


In big endian MSB is first. For people who read from left to right it is natural way to think of storing bytes. 

In little endian LSB is first. In this endianess operations can be simpler and faster to perform.

Examples:

**Value:** 0x4F52:
    - Big endian:   address 0x100: 4F,   0x101: 52
    - Litle endian: address 0x100: 52,   0x101: 4F


Little endian architectures:
    - x86
    - ARM
    - C-SKy
    - RISC-V

Big endian architectures:
    - SPARC
    - Motorola 68000 ( 68K )
    - PowerPC
    - HP Intel Itanium
    - IBM System/360
    - Siemens SIMATIC S7

bi-endian( you can switch endianess):
    - ARM   
    - MIPS
    - PowerPC from( PowerPC G4)
    - from SPARC V9
