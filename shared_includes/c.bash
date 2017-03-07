#shared includes for c/c++ aliases

#C++
function cppc() { g++ "$1.cpp" -o $1; }

#c
function c_c() { gcc -Wall -std=c99 -o $1 "$1.c"; }