#pragma once

#include <string>
#include <vector>

#include "utils.h"
#include "types.h"

using namespace std;

class Reader {
public:
    Reader(vector<string>& tokens);

    string next();

    string peek();

private:
    vector<string>& tokens_;
    size_t index_;
};


vector<string> tokenize(string str);

Token* read_form(Reader& r);

Token* read_list(Reader& r, char startSymbol, char endSymbol);

Token* read_atom(Reader& r);

Token* read_str(string str);
