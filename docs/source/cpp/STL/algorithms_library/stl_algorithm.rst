<algorithm>
===========

`cpp reference <algorithm> <https://en.cppreference.com/w/cpp/header/algorithm>`_ 

Non-modyfying sequence operations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- ``bool all_of(InpIt first, InpIt last, UnaryPredicate func)``
- ``bool any_of(InpIt first, InpIt last, UnaryPredicate func)``
- ``bool none_of(InpIt first, InpIt last, UnaryPredicate func)``
- ``for_each(InpIt first, InpIt last, Func func)``
- ``for_each_n(InpIt first, Size n, Func func)``
- ``count(InpIt first, InpIt last, const T &val)``
- ``count_if(InpIt first, InpIt last, Pred pred)``

Search operations
~~~~~~~~~~~~~~~~~

- ``std::pair<InputIt1,InputIt2> mismatch( InputIt1 first1, InputIt1 last1,InputIt2 first2 )``
- ``InpIt find(InpIt first, InpIt last, const T &val)``
- ``InpIt find_if(InpIt first, InpIt last, Pred pred)``
- ``InpIt find_if_not( InputIt first, InputIt last, UnaryPredicate q )``
- ``FwdIt find_end(FwdIt1 first1, FwdIt1 last1, FwdIt2 first2, FwdIt2 last2)``
- ``FwdIt find_first_of(FwdIt1 first1, FwdIt1 last1, FwdIt2 first2, FwdIt2 last2)``
- ``FwdIt adjacent_find(FwdIt first, FwdIt last)``
- ``FwdIt adjacent_find(FwdIt first, FwdIt last, BinPred pred)``
- ``FwdIt1 search(FwdIt1 first1, FwdIt1 last1, FwdIt2 first2, FwdIt2 last2)``
- ``FwdIt search_n(FwdIt first, FwdIt last, Size count, const T &val)``
- ``FwdIt search_n(FwdIt first, FwdIt last, Size count, const T &val, BinPred pred)``


Modyfying sequence operations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- ``OutIt copy(InpIt first, InpIt last, OutIt result)``
- ``OutIt copy_if(InpIt first, InpIt last, OutIt result, UnaryPred pred)``
- ``OutIt copy_n(InpIt first, Size n, OutIt result)``
- ``BidirIt2 copy_backward( BidirIt1 first, BidirIt1 last, BidirIt2 d_last )``
- ``OutputIt move( InputIt first, InputIt last, OutputIt d_first )``
- ``BidirIt2 move_backward( BidirIt1 first, BidirIt1 last, BidirIt2 d_last )``
- ``void fill(FwdIt first, FwdIt last, const T &val)``
- ``void fill_n(OutIt first, Size n, const T &val)``
- ``void generate(FwdIt first, FwdIt last, Gen gen)``
- ``void generate_n(OutIt first, Size n, Gen gen)``
- ``FwdIt remove(FwdIt first, FwdIt last, const T &val)``
- ``OutIt remove_if(FwdIt first, FwdIt last, Pred pred)``
- ``OutIt remove_copy(InpIt first, InpIt last, OutIt result, const T &val)``
- ``OutIt remove_copy_if(InpIt first, InpIt last, OutIt result, Pred pred)``
- ``void replace(FwdIt first, FwdIt last, const T &old_val, const T &new_val)``
- ``void replace_if(FwdIt first, FwdIt last, Pred pred, const T &new_val)``
- ``OutputIt replace_copy( InputIt first, InputIt last, OutputIt d_first, const T& old_value, const T& new_value )``
- ``OutputIt replace_copy_if( InputIt first, InputIt last, OutputIt d_first, UnaryPredicate p, const T& new_value )``
- ``void reverse(BidirectIt first, BidirectIt last)``
- ``OutIt reverse_copy(BidirectIt first, BidirectIt last, OutIt result)``
- ``void rotate(FwdIt first, FwdIt middle, FwdIt last)``
- ``OutputIt rotate_copy( ForwardIt first, ForwardIt n_first, ForwardIt last, OutputIt d_first )``
- ``void random_shuffle( RandomIt first, RandomIt last )``
- ``void shuffle(RndIt first, RndIt last, URBG &&g)``
- ``SampleIterator sample( PopulationIterator first, PopulationIterator last, SampleIterator out, Distance n, URBG&& g )``
- ``OutIt transform(InpIt first, InpIt last, OutIt result, UnOp unop)``
- ``OutIt transform(InpIt first1, InpIt last1, InpIt2 first2, OutIt result, BinOp binop)``
- ``FwdIt unique(FwdIt first, FwdIt last)``
- ``FwdIt unique(FwdIt first, FwdIt last, Binpred pred)``
- ``OutIt unique_copy(InpIt first, InpIt last, OutIt result)``

.. important:: For ``remove()`` and ``unique()`` you have to erase elements on the back of containter!!
    ::

        vector<int> coll = { 1, 7, 3, 4, 5, 6, 7, 7, 7, 8, 7 };

        auto new_end = remove(coll.begin(), coll.end(), 7);

        // after remove 7 still can be in a container
        coll.erase(new_end, coll.end()); // erasing garbage

Partitioning operations
~~~~~~~~~~~~~~~~~~~~~~~

- ``bool is_partitioned(InpIt first, InpIt last, UnaryPred pred)``
- ``BidirectIt partition(BidirectIt first, BidirectIt last, Pred pred)``
- ``pair<OutIt1, OutIt2> partition_copy(InpIt first, InpIt last, OutIt1 result1, OutIt2 result2, UnaryPred pred)``
- ``BidirectIt stable_partition(BidirectIt first, BidirectIt last, Pred pred)``
- ``ForwardIt partition_point( ForwardIt first, ForwardIt last, UnaryPredicate p )``

.. important:: ``stable_partition()`` keeps order of input element in order to  ``partition()``

Sorting operations
~~~~~~~~~~~~~~~~~~

- ``bool is_sorted(FwdIt first, FwdIt last)``
- ``bool is_sorted(FwdIt first, FwdIt last, Cmp comp)``
- ``ForwardIt is_sorted_until( ForwardIt first, ForwardIt last )``
- ``void sort(RndIt first, RndIt last)``
- ``void sort(RndIt first, RndIt last, Cmp comp)``
- ``void partial_sort(RndIt first, RndIt middle, RndIt last)``
- ``void partial_sort(RndIt first, RndIt middle, RndIt last, Cmp comp)``
- ``RndIt partial_sort_copy(InpIt first, InpIt last, RndIt result_first, RndIt result_last)``
- ``RndIt partial_sort_copy(InpIt first, InpIt last, RndIt result_first, RndIt result_last, Cmp comp)``
- ``RandomIt partial_sort_copy(InpIt first, InpIt last, RndIt d_first, RndIt d_last)``
- ``RandomIt partial_sort_copy(InpIt first, InpIt last, RndIt d_first, RndIt d_last, Cmp comp)``
- ``void stable_sort(RndIt first, RndIt last)``
- ``void stable_sort(RndIt first, RndIt last, Cmp comp)``
- ``void nth_element(RndIt first, RndIt nth, RndIt last)``
- ``void nth_element(RndIt first, RndIt nth, RndIt last, Cmp comp)``

Binary search operations (on sorted ranges)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. important:: [first, last) range has to be sorted with less operator lub with comparison function

- ``FwdIt lower_bound(FwdIt first, FwdIt last, const T &val)``
- ``FwdIt lower_bound(FwdIt first, FwdIt last, const T &val, Cmp comp)``
- ``FwdIt upper_bound(FwdIt first, FwdIt last, const T &val)``
- ``FwdIt upper_bound(FwdIt first, FwdIt last, const T &val, Cmp comp)``
- ``bool binary_search(FwdIt first, FwdIt last, const T &val)``
- ``bool binary_search(FwdIt first, FwdIt last, const T &val, Cmp comp)``
- ``pair<FwdIt, FwdIt> equal_range(FwdIt first, FwdIt last, const T &val)``
- ``pair<FwdIt, FwdIt> equal_range(FwdIt first, FwdIt last, const T &val, Cmp comp)``


Merge operations
~~~~~~~~~~~~~~~~

- ``OutIt merge(InpIt1 first1, InpIt1 last1, InpIt2 first2, InpIt2 last2, OutIt result)``
- ``OutIt merge(InpIt1 first1, InpIt1 last1, InpIt2 first2, InpIt2 last2, OutIt result, Cmp comp)``
- ``void inplace_merge(BidirectIt first, BidirectIt mid, BidirectIt last)``
- ``void inplace_merge(BidirectIt first, BidirectIt mid, BidirectIt last, Cmp comp)``

Set operations (on sorted ranges)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


- ``bool includes(InpIt1 first1, InpIt1 last1, InpIt2 first2, InpIt2 last2)``
- ``bool includes(InpIt1 first1, InpIt1 last1, InpIt2 first2, InpIt2 last2, Cmp comp)``

- ``OutIt set_difference(InpIt1 first1, InpIt1 last1, InpIt2 first2, InpIt2 last2, OutIt result)``
- ``OutIt set_difference(InpIt1 first1, InpIt1 last1, InpIt2 first2, InpIt2 last2, OutIt result, Cmp comp)``

- ``OutIt set_intersection(InpIt1 first1, InpIt1 last1, InpIt2 first2, InpIt2 last2, OutIt result)``
- ``OutIt set_intersection(InpIt1 first1, InpIt1 last1, InpIt2 first2, InpIt2 last2, OutIt result, Cmp comp)``

- ``OutIt set_symmetric_difference(InpIt1 first1, InpIt1 last1, InpIt2 first2, InpIt2 last2, OutIt result)``
- ``OutIt set_symmetric_difference(InpIt1 first1, InpIt1 last1, InpIt2 first2, InpIt2 last2, OutIt result, Cmp comp)``

- ``OutIt set_union(InpIt1 first1, InpIt1 last1, InpIt2 first2, InpIt2 last2, OutIt result)``
- ``OutIt set_union(InpIt1 first1, InpIt1 last1, InpIt2 first2, InpIt2 last2, OutIt result, Cmp comp)``

Minimum/maximum operations
~~~~~~~~~~~~~~~~~~~~~~~~~~

- ``const T &max(const T &a, const T &b)``
- ``const T &max(const T &a, const T &b, Cmp comp)``::
    
    std::max( -100, -10, [](int x, int y) { return std::abs(x) < std::abs(y); } )
- ``FwdIt max_element(FwdIt first, FwdIt last)``
- ``FwdIt max_element(FwdIt first, FwdIt last, Cmp comp)``
- ``FwdIt min_element(FwdIt first, FwdIt last)``
- ``FwdIt min_element(FwdIt first, FwdIt last, Cmp comp)``
- ``pair<FwdIt, FwdIt> minmax_element(FwdIt first, FwdIt last)``
- ``pair<FwdIt, FwdIt> minmax_element(FwdIt first, FwdIt last, Cmp comp)``
- ``constexpr const T& clamp( const T& v, const T& lo, const T& hi )``

Comparison operations
~~~~~~~~~~~~~~~~~~~~~

- ``bool equal(InpIt first1, InpIt last1, InpIt first2 )``
- ``bool equal(InpIt1 first1, InpIt1 last1, InpIt2 first2)``
- ``bool equal(InpIt1 first1, InpIt1 last1, InpIt2 first2, BinPred pred)``
- ``bool equal(InpIt1 first1, InpIt1 last1, InpIt2 first2, InpIt2 last2)``
- ``bool equal(InpIt1 first1, InpIt1 last1, InpIt2 first2, InpIt2 last2, BinPred pred)``
- ``bool lexicographical_compare(InpIt1 first1, InpIt1 last1, InpIt2 first2, InpIt2 last2)``
- ``bool lexicographical_compare(InpIt1 first1, InpIt1 last1, InpIt2 first2, InpIt2 last2, Cmp comp)``


Permutation operations
~~~~~~~~~~~~~~~~~~~~~~

- ``bool is_permutation( ForwardIt1 first1, ForwardIt1 last1, ForwardIt2 first2 )``
- ``bool next_permutation( BidirIt first, BidirIt last )``
- ``bool prev_permutation( BidirIt first, BidirIt last )``




