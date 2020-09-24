#ifndef A_H_
#define A_H_

#include <array>

template<typename S, std::size_t size>
class A {
public:
  explicit A(std::array<S, size> x) : x(x) {}

private:
  const std::array<S, size> x;
};

const A<char, 3> A3(std::array<char, 3>{'A','B','C'});

#endif // A_H_
