#include <unordered_map>
#include <iostream>
#include <sstream>

#include "environment.h"
#include "printer.h"
#include "types.h"

using namespace std;

Environment::Environment(const Environment* outer) : outer(outer) {}

string Environment::repr() const {
    ostringstream out;
    for (const auto& pair : data) {
        out << pair.first << ": " << pr_str(pair.second, true) << "\n";
    }
    return out.str();
}

Environment::Environment(const Environment* outer, vector<Token*> binds, vector<Token*> exprs) : outer(outer) {
    for (int i = 0; i < binds.size(); i++) {
        TokenSymbol* sym = dynamic_cast<TokenSymbol*>(binds[i]);
        if (!sym) {
            throw runtime_error("expected symbol in binding list");
        }

        if (sym->name == "&") {
            vector<Token*> rest_exprs(exprs.begin() + i, exprs.end());

            if (i != binds.size() - 2) {
                throw runtime_error("invalid use of variadic binding");
            }

            TokenSymbol* sym = dynamic_cast<TokenSymbol*>(binds[i + 1]);
            if (!sym) {
                throw runtime_error("expected symbol in binding list");
            }

            TokenList* list = new TokenList('(', ')');
            list->list = rest_exprs;
            data[sym->name] = list;
            return;
        }

        data[sym->name] = exprs[i];
    }

    if (binds.size() != exprs.size()) {
        throw runtime_error("Invalid argument count for #<function>");
    }
}

void Environment::set(const string& key, Token* value) {
    data[key] = value;
}

const Environment* Environment::find(const string& key) const {
    if (data.count(key) > 0) {
        return this;
    } else if (outer != nullptr) {
        return outer->find(key);
    } else {
        return nullptr;
    }
}

Token* Environment::get(const string& key) {
    const Environment* env = find(key);
    if (env == nullptr) {
        throw runtime_error(key + " not found");
    } else {
        return env->data.at(key);
    }
}
