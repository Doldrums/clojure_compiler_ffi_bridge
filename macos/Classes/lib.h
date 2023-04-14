#pragma once

#include <string>
#include "types.h"
#include "environment.h"

Token *READ(const string &input);
Token *EVAL(Token *ast, Environment *env);
string PRINT(Token *ast);
