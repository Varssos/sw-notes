<numeric>
=========

`cpp reference <numeric> <https://en.cppreference.com/w/cpp/header/numeric>`_ 

Numeric functions
~~~~~~~~~~~~~~~~~

- ``void iota( ForwardIt first, ForwardIt last, T value )``::

    std::vector<int> vec(5);
    std::iota(vec.begin(), vec.end(), 1 ); // -> { 1, 2, 3, 4, 5 }

- ``T accumulate( InputIt first, InputIt last, T init )``::

    int sum = std::accumulate( vec.begin(), vec.end(), 0 ); // -> sum = 15
    
- ``T reduce( InputIt first, InputIt last, T init )`` Like accumulate, but out of order. Quicker in paraller execution
- ``T transform_reduce( InputIt1 first1, InputIt1 last1, InputIt2 first2, T init )``
- ``T inner_product( InputIt1 first1, InputIt1 last1, InputIt2 first2, T init, BinaryOperation1 op1, BinaryOperation2 op2 )``::

    std::vector<int> vec { 1, 2, 3, 4 };
    std::vector<int> vec2 { 1, 2, 3, 4 };
    
    std::inner_product( vec.begin(), vec.end(), vec2.begin(), 0, std::plus<>(), std::multiplies<>() ); // -> 30 = 0 + ( 1*1 + 2*2 + 3*3 + 4*4 )

- ``OutputIt adjacent_difference( InputIt first, InputIt last, OutputIt d_first )``::

    std::vector v {4, 6, 9, 13, 18, 19, 19, 15, 10};

    std::adjacent_difference(v.begin(), v.end(), v.begin()); // - > { 4 2 3 4 5 1 0 -4 -5 }

    std::array<int, 10> a {1};
    adjacent_difference(begin(a), std::prev(end(a)), std::next(begin(a)), std::plus<> {}); // -> { 1 1 2 3 5 8 13 21 34 55 }

- ``OutputIt partial_sum( InputIt first, InputIt last, OutputIt d_first )``::

    std::vector<int> v = {2, 2, 2, 2, 2, 2, 2, 2, 2, 2};

    std::partial_sum(v.begin(), v.end(), std::ostream_iterator<int>(std::cout, " ")); // -> 2 4 6 8 10 12 14 16 18 20
    std::partial_sum(v.begin(), v.end(), v.begin(), std::multiplies<int>()); // -> 2 4 8 16 32 64 128 256 512 1024

- ``OutputIt inclusive_scan( InputIt first, InputIt last, OutputIt d_first )``
- ``OutputIt exclusive_scan( InputIt first, InputIt last, OutputIt d_first, T init )``::

    std::vector data {3, 1, 4, 1, 5, 9, 2, 6};
 
    std::exclusive_scan(data.begin(), data.end(), std::ostream_iterator<int>(std::cout, " "), 0);   // 0 3 4 8 9 14 23 25 
    std::inclusive_scan(data.begin(), data.end(), std::ostream_iterator<int>(std::cout, " "));      // 3 4 8 9 14 23 25 31 

- ``OutputIt transform_inclusive_scan( InputIt first, InputIt last, OutputIt d_first, BinaryOperation binary_op, UnaryOperation unary_op )``
- ``OutputIt transform_exclusive_scan( InputIt first, InputIt last, OutputIt d_first, T init, BinaryOperation binary_op, UnaryOperation unary_op )``::

    std::vector data {3, 1, 4, 1, 5, 9, 2, 6};
 
    auto times_10 = [](int x) { return x * 10; };
    
    std::cout << "10 times exclusive sum: ";
    std::transform_exclusive_scan(data.begin(), data.end(),
                    std::ostream_iterator<int>(std::cout, " "),
                    0, std::plus<int>{}, times_10);
    std::cout << "\n10 times inclusive sum: ";
    std::transform_inclusive_scan(data.begin(), data.end(),
                    std::ostream_iterator<int>(std::cout, " "),
                    std::plus<int>{}, times_10);

    Output:
    10 times exclusive sum: 0 30 40 80 90 140 230 250 
    10 times inclusive sum: 30 40 80 90 140 230 250 310

- ``constexpr std::common_type_t<M, N> gcd( M m, N n )`` Greatest Common Divisor::

    constexpr int p {2 * 2 * 3};
    constexpr int q {2 * 3 * 3};
    std::cout << std::gcd(p, q); // 6

- ``constexpr std::common_type_t<M, N> lcm( M m, N n )`` Least Common Multiple::

    constexpr int p {2 * 2 * 3};
    constexpr int q {2 * 3 * 3};
    std::cout << std::lcm( p, q ); // 36

- ``constexpr T midpoint( T a, T b ) noexcept``::

    std::cout << std::midpoint( 2, 6 ); // 4 