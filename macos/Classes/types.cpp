#include "types.h"

Token::~Token() {}

TokenList::TokenList(char start, char end) : startSymbol(start), endSymbol(end) {}

TokenSymbol::TokenSymbol(string v) : name(v) {}

TokenKeyword::TokenKeyword(string v) : value(v) {}

TokenString::TokenString(string v) : value(v) {}

TokenNumber::TokenNumber(double v) : value(v) {}

TokenFunction::TokenFunction(function<Token* (vector<Token*>)> f) : fn(f) {}
