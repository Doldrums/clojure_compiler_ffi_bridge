#include <regex>

#include "reader.h"

using namespace std;

Reader::Reader(std::vector<string>& tokens) : tokens_(tokens), index_(0) {}

string Reader::next() {
    if (index_ >= tokens_.size()) {
        throw out_of_range("EOF while Reader::next()");
    }

    return tokens_[index_++];
}

string Reader::peek() {
    if (index_ >= tokens_.size()) {
        throw out_of_range("EOF while Reader::peek()");
    }

    return tokens_[index_];
}

vector<string> tokenize(string str) {
    vector<string> matches;

    regex reg("[\\s,]*(~@|[\\[\\]{}()'`~^@]|\"(?:\\\\.|[^\\\\\"])*\"?|;.*|[^\\s\\[\\]{}('\"`,;)]*)");
    auto words_begin = sregex_iterator(str.begin(), str.end(), reg);
    auto words_end = sregex_iterator();

    for (sregex_iterator i = words_begin; i != words_end; ++i) {
        smatch match = *i;
        for (int i = 1; i < match.size(); i++) {
            if (match.str(i) != "") {
                matches.push_back(match.str(i));
            }
        }
    }

    return matches;
}

Token* read_list(Reader& r, char startSymbol, char endSymbol) {
    TokenList* list = new TokenList(startSymbol, endSymbol);
    r.next(); // consume the '('
    while (r.peek()[0] != endSymbol) {
        list->list.push_back(read_form(r));
    }
    r.next(); // consume the ')'
    return list;
}

Token* read_atom(Reader& r) {
    string token = r.next();
    if (token[0] == ':') {
        // keyword
        string str = token.substr(1, token.length() - 1);

        return new TokenKeyword(str);
    } else if (token[0] == '"') {
        // string
        string str = token.substr(1, token.length() - 2);
        str = replace_all(str, "\\\\", "\u029e");
        str = replace_all(str, "\\\"", "\"");
        str = replace_all(str, "\\n", "\n");
        str = replace_all(str, "\u029e", "\\");

        if (token[token.length() - 1] != '"' || token.length() == 1) {
            throw std::runtime_error("unbalanced string");
        }
        
        return new TokenString(str);
    } else if (token == "nil") {
        // nil
        return new TokenNil();
    } else if (token == "true") {
        // true
        return new TokenTrue();
    } else if (token == "false") {
        // false
        return new TokenFalse();
    } else {
        try {
            // try parsing as double
            double num = stod(token);
            return new TokenNumber(num);
        } catch (invalid_argument&) {
            if (isdigit(token[0])) {
                throw std::runtime_error("symbol cant start with a digit");
            }
            return new TokenSymbol(token);
        }
    }
}

Token* read_form(Reader& r) {
    string token = r.peek();
    if (token[0] == '(') {
        return read_list(r, '(', ')');
    } else if (token[0] == '{') {
        return read_list(r, '{', '}');
    } else if (token[0] == '[') {
        return read_list(r, '[', ']');
    } else {
        return read_atom(r);
    }
}

Token* read_str(string str) {
    auto tokens = tokenize(str);
    auto reader = Reader(tokens);

    return read_form(reader);
}
