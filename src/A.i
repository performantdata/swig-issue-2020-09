%module example
%{
#include "A.h"
%}

template<typename S, std::size_t size>
class A {
public:
  explicit A(std::array<S, size> x) : x(x) {}
};

const A<char, 3> A3(std::array<char, 3>{'A','B','C'});
