Pointer vs reference
====================

https://www.geeksforgeeks.org/pointers-vs-references-cpp/

Pointer vs reference differences
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
1. Initialization:
   
   - Reference should be declare and initialize in a single step
   - Pointer can be declare and initialize in two steps
2. Reassignment:
   
   - Pointer can be re-assigned
   - Reference cannot be re-assigned

3. Memory address. A pointer has its own memory address and size on the stack, whereas a reference shares the same memory address with the original variable but also takes up some space on the stack.
4. A pointer can be assigned NULL directly. 
5. You can have a pointer to pointer, whereas references only offer one level of indirection.