#pragma once

#include <vector>
#include <functional>
#include <unordered_map>

#include "types.h"

using namespace std;

class Environment {
public:
    Environment(const Environment* outer = nullptr);
    Environment(const Environment* outer, vector<Token*> binds, vector<Token*> exprs);

    const Environment* find(const string& key) const;
    void set(const string& key, Token* value);
    Token* get(const string& key);

private:
    string repr() const;
    unordered_map<string, Token*> data;
    const Environment* outer;
};
