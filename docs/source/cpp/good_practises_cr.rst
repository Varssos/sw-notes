Good practises and CR checklist
===============================

.. |check| raw:: html

    <input checked=""  type="checkbox">

.. |uncheck| raw:: html

    <input type="checkbox">



#. **Complete |** Verify that the code implements the complete design |uncheck|

#. **#Include |** Verify that #includes are complete |uncheck| 

#. **Initialization |** Check variable and parameter Initialization:

   - at program initiation |uncheck|
   - at start of every loop |uncheck|
   - at function/procedure entry |uncheck|

#. **Calls |** Check function call formats:

   - pass by value/reference |uncheck|
   - parameters |uncheck|
   - use of "const" |uncheck|
   - no return of reference to local object |uncheck|

#. **Names |** Check name spelling and use:

   - is it consistent? |uncheck|
   - is it within declared scope? |uncheck|
   - do all structures and classes use '.' reference? |uncheck|

#. **Strings |** Check that all strings:

   - use std::string class |uncheck|
   - have valid and appropriate subscripts |uncheck|
   - use correct member functions and operatiors |uncheck|
  
#. **Pointers |** Check that:

   - pointers are initialized null (0 or NULL) |uncheck|
   - pointers are deleted only after new |uncheck|
   - new pointers are alwats deleted after use |uncheck|

#. **Output Format |** Check the output format:

   - pass by value/reference |uncheck|
   - parameters |uncheck|
   - use of "const" |uncheck|
   - no return of reference to local object |uncheck|

#. **{} Pairs |** Ensure that the {} are proper and matched |uncheck|

#. **Logic Operators |** Verify the proper user of ==, =, ||, every logic function and so on |uncheck| 

#. **Line by line check |** Check every LoC for:

   - instruction syntax |uncheck|
   - proper punctuation |uncheck|
    
#. **Standards |** Ensure that the code conforms to the coding standards

#. **File usage |** Verify that all files are:

   - properly declared |uncheck|
   - opened (normally at declaration) |uncheck|
   - closed (oftern automatic at destruction) |uncheck|
   - correctly tested for end-of-file, where necessary |uncheck|


#. Replace magic numbers with enums/ const class members |uncheck|
#. Do not use/ try to avoid global variables |uncheck|
#. Try to avoid #define  |uncheck|
#. override for virtual methods |uncheck|
#. ``static const`` should be replaced by ``constexpr`` 