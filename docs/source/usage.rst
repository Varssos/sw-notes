Usage
=====

Environment setup on windows
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. Git clone
::

   git clone https://github.com/sebastianwach/sw-notes.git

2. Install python modules
::

   pip install sphinx-rtd-theme
   pip install importlib-metadata

3. Add reStructuredText extension with extra pack from LeXstudi Inc. in VS code

4. Now it should be buildable :D 
5. Right now on windows I have live Preview but it is very poor 




.. _installation:

Installation
------------

To use Lumache, first install it using pip:

.. code-block:: console

   (.venv) $ pip install lumache

Creating recipes
----------------

To retrieve a list of random ingredients,
you can use the ``lumache.get_random_ingredients()`` function:

.. autofunction:: lumache.get_random_ingredients

The ``kind`` parameter should be either ``"meat"``, ``"fish"``,
or ``"veggies"``. Otherwise, :py:func:`lumache.get_random_ingredients`
will raise an exception.

.. autoexception:: lumache.InvalidKindError

For example:

>>> import lumache
>>> lumache.get_random_ingredients()
['shells', 'gorgonzola', 'parsley']

