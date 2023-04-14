#include <sstream>

#include "utils.h"

string join(const vector<string>& strs, const string& sep) {
    stringstream ss;

    for (int i = 0; i < strs.size(); i++) {
        if (i > 0) {
            ss << sep;
        }
        ss << strs[i];
    }
    return ss.str();
}

string replace_all(string str, const string& from, const string& to) {
    size_t start_pos = 0;
    while((start_pos = str.find(from, start_pos)) != string::npos) {
        str.replace(start_pos, from.length(), to);
        start_pos += to.length();
    }
    return str;
}
