%module example
%{
#include "A.h"
%}

const A<char, 3> A3(std::array<char, 3>{'A','B','C'});
