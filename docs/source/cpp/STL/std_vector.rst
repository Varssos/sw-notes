std::vector
===========

.. important:: If possible, try to reserve enough memory with ``vec.reserve(<size>);``. Every time when you push_back element to vector and capability is exceeded. It has to reserve contigous memory with enough memory( it depends, but in most cases n->2n ) and copy all data to new location.  

.. important:: It is prefered to use ``vec.emplace_back( args )`` instead of ``vector::push_back( args )``. It creates an object in place and avoid additional copying. 


