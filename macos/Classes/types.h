#pragma once

#include <string>
#include <vector>

using namespace std;

class Token {
public:
    virtual ~Token();
};

class TokenList : public Token {
public:
    TokenList(char start, char end);

    vector<Token*> list;
    char startSymbol;
    char endSymbol;
};

class TokenSymbol : public Token {
public:
    TokenSymbol(string v);

    string name;
};

class TokenKeyword : public Token {
public:
    TokenKeyword(string v);

    string value;
};

class TokenString : public Token {
public:
    TokenString(string v);

    string value;
};

class TokenNumber : public Token {
public:
    TokenNumber(double v);

    double value;
};

class TokenNil : public Token {};
class TokenTrue : public Token {};
class TokenFalse : public Token {};

class TokenFunction : public Token {
public:
    TokenFunction(function<Token* (vector<Token*>)> fn);

    function<Token* (vector<Token*>)> fn;
};
