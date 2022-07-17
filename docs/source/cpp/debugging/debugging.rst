Debugging and problems solving
==============================

1. Module build with no problems but occur segmentation fault while 
   
   **solution:**
   Check module with ``ld {module_name}`` 

   Output::

        ld: warning: cannot find entry symbol _start; not setting start address
        ld: {module_name}.so: undefined reference to `uuid_unparse'

    There should be defined problem which did not occur on build phase
