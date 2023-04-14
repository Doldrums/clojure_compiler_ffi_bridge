#include <unordered_map>
#include <sstream>
#include <iostream>

#include "core.h"
#include "types.h"
#include "printer.h"

using namespace std;

// Define numeric functions
Token *fn_add(vector<Token *> args)
{
    double result = 0.0;
    for (auto arg : args)
    {
        if (TokenNumber *num = dynamic_cast<TokenNumber *>(arg))
        {
            result += num->value;
        }
        else
        {
            throw runtime_error("Invalid argument to +");
        }
    }
    return new TokenNumber(result);
}

Token *fn_sub(vector<Token *> args)
{
    double result = 0.0;
    if (args.size() > 0)
    {
        if (TokenNumber *num = dynamic_cast<TokenNumber *>(args[0]))
        {
            result = num->value;
        }
        else
        {
            throw runtime_error("Invalid argument to -");
        }
    }
    for (int i = 1; i < args.size(); i++)
    {
        if (TokenNumber *num = dynamic_cast<TokenNumber *>(args[i]))
        {
            result -= num->value;
        }
        else
        {
            throw runtime_error("Invalid argument to -");
        }
    }
    return new TokenNumber(result);
}

Token *fn_mul(vector<Token *> args)
{
    double result = 1.0;
    for (auto arg : args)
    {
        if (TokenNumber *num = dynamic_cast<TokenNumber *>(arg))
        {
            result *= num->value;
        }
        else
        {
            throw runtime_error("Invalid argument to *");
        }
    }
    return new TokenNumber(result);
}

Token *fn_div(vector<Token *> args)
{
    double result = 0.0;
    if (args.size() > 0)
    {
        if (TokenNumber *num = dynamic_cast<TokenNumber *>(args[0]))
        {
            result = num->value;
        }
        else
        {
            throw runtime_error("Invalid argument to /");
        }
    }
    for (int i = 1; i < args.size(); i++)
    {
        if (TokenNumber *num = dynamic_cast<TokenNumber *>(args[i]))
        {
            if (num->value == 0.0)
            {
                throw runtime_error("Division by zero");
            }
            result /= num->value;
        }
        else
        {
            throw runtime_error("Invalid argument to /");
        }
    }
    return new TokenNumber(result);
}

bool equals(Token *a, Token *b)
{
    if (a == b)
    {
        return true;
    }

    TokenList *listA = dynamic_cast<TokenList *>(a);
    TokenList *listB = dynamic_cast<TokenList *>(b);
    if (listA && listB)
    {
        if (listA->list.size() != listB->list.size())
        {
            return false;
        }
        for (size_t i = 0; i < listA->list.size(); i++)
        {
            if (!equals(listA->list[i], listB->list[i]))
            {
                return false;
            }
        }
        return true;
    }

    TokenSymbol *symA = dynamic_cast<TokenSymbol *>(a);
    TokenSymbol *symB = dynamic_cast<TokenSymbol *>(b);
    if (symA && symB)
    {
        return symA->name == symB->name;
    }

    TokenKeyword *kwA = dynamic_cast<TokenKeyword *>(a);
    TokenKeyword *kwB = dynamic_cast<TokenKeyword *>(b);
    if (kwA && kwB)
    {
        return kwA->value == kwB->value;
    }

    TokenString *strA = dynamic_cast<TokenString *>(a);
    TokenString *strB = dynamic_cast<TokenString *>(b);
    if (strA && strB)
    {
        return strA->value == strB->value;
    }

    TokenNumber *numA = dynamic_cast<TokenNumber *>(a);
    TokenNumber *numB = dynamic_cast<TokenNumber *>(b);
    if (numA && numB)
    {
        return numA->value == numB->value;
    }

    TokenNil *nilA = dynamic_cast<TokenNil *>(a);
    TokenNil *nilB = dynamic_cast<TokenNil *>(b);
    if (nilA && nilB)
    {
        return true;
    }

    TokenTrue *trueA = dynamic_cast<TokenTrue *>(a);
    TokenTrue *trueB = dynamic_cast<TokenTrue *>(b);
    if (trueA && trueB)
    {
        return true;
    }

    TokenFalse *falseA = dynamic_cast<TokenFalse *>(a);
    TokenFalse *falseB = dynamic_cast<TokenFalse *>(b);
    if (falseA && falseB)
    {
        return true;
    }

    return false;
}

Token *fn_equals(vector<Token *> args)
{
    if (args.size() != 2)
    {
        throw runtime_error("Invalid number of arguments for =");
    }

    Token *t1 = args[0];
    Token *t2 = args[1];

    if (equals(t1, t2))
    {
        return new TokenTrue();
    }
    else
    {
        return new TokenFalse();
    }
}

Token *fn_list(vector<Token *> args)
{
    auto list = new TokenList('(', ')');
    list->list = args;

    return list;
}

Token *fn_is_list(vector<Token *> args)
{
    if (args.size() != 1)
    {
        throw runtime_error("Invalid number of arguments for list?");
    }

    TokenList *list = dynamic_cast<TokenList *>(args[0]);
    if (list && list->startSymbol == '(')
    {
        return new TokenTrue();
    }

    return new TokenFalse();
}

Token *fn_count(vector<Token *> args)
{
    if (args.size() != 1)
    {
        throw runtime_error("Invalid number of arguments for count");
    }

    if (TokenList *list = dynamic_cast<TokenList *>(args[0]))
    {
        return new TokenNumber(list->list.size());
    }
    else if (TokenNil *nil = dynamic_cast<TokenNil *>(args[0]))
    {
        return new TokenNumber(0);
    }

    throw runtime_error("Invalid argument to count");
}

Token *fn_empty(vector<Token *> args)
{
    if (args.size() != 1)
    {
        throw runtime_error("Invalid number of arguments for empty");
    }

    TokenList *list = dynamic_cast<TokenList *>(args[0]);
    if (!list)
    {
        throw runtime_error("Invalid argument to count");
    }

    if (list->list.size() == 0)
    {
        return new TokenTrue();
    }

    return new TokenFalse();
}

Token *fn_less(vector<Token *> args)
{
    if (args.size() != 2)
    {
        throw runtime_error("Invalid number of arguments for <");
    }

    Token *a = args[0];
    Token *b = args[1];

    TokenNumber *numA = dynamic_cast<TokenNumber *>(a);
    TokenNumber *numB = dynamic_cast<TokenNumber *>(b);
    if (!numA || !numB)
    {
        throw runtime_error("Invalid arguments for <");
    }

    if (numA->value < numB->value)
    {
        return new TokenTrue();
    }

    return new TokenFalse();
}

Token *fn_less_or_equal(vector<Token *> args)
{
    if (args.size() != 2)
    {
        throw runtime_error("Invalid number of arguments for <");
    }

    Token *a = args[0];
    Token *b = args[1];

    TokenNumber *numA = dynamic_cast<TokenNumber *>(a);
    TokenNumber *numB = dynamic_cast<TokenNumber *>(b);
    if (!numA || !numB)
    {
        throw runtime_error("Invalid arguments for <");
    }

    if (numA->value <= numB->value)
    {
        return new TokenTrue();
    }

    return new TokenFalse();
}

Token *fn_greater(vector<Token *> args)
{
    if (args.size() != 2)
    {
        throw runtime_error("Invalid number of arguments for <");
    }

    Token *a = args[0];
    Token *b = args[1];

    TokenNumber *numA = dynamic_cast<TokenNumber *>(a);
    TokenNumber *numB = dynamic_cast<TokenNumber *>(b);
    if (!numA || !numB)
    {
        throw runtime_error("Invalid arguments for <");
    }

    if (numA->value > numB->value)
    {
        return new TokenTrue();
    }

    return new TokenFalse();
}

Token *fn_greater_or_equal(vector<Token *> args)
{
    if (args.size() != 2)
    {
        throw runtime_error("Invalid number of arguments for <");
    }

    Token *a = args[0];
    Token *b = args[1];

    TokenNumber *numA = dynamic_cast<TokenNumber *>(a);
    TokenNumber *numB = dynamic_cast<TokenNumber *>(b);
    if (!numA || !numB)
    {
        throw runtime_error("Invalid arguments for <");
    }

    if (numA->value >= numB->value)
    {
        return new TokenTrue();
    }

    return new TokenFalse();
}

Token *fn_prn(vector<Token *> args)
{
    stringstream ss;
    for (size_t i = 0; i < args.size(); i++)
    {
        ss << pr_str(args[i], true);
        if (i != args.size() - 1)
        {
            ss << " ";
        }
    }

    string output = ss.str();
    cout << output << endl;

    return new TokenNil();
}

Token *fn_println(vector<Token *> args)
{
    stringstream ss;
    for (size_t i = 0; i < args.size(); i++)
    {
        ss << pr_str(args[i], false);
        if (i != args.size() - 1)
        {
            ss << " ";
        }
    }

    string output = ss.str();
    cout << output << endl;

    return new TokenNil();
}

Token *fn_pr_str(vector<Token *> args)
{
    stringstream ss;
    for (size_t i = 0; i < args.size(); i++)
    {
        ss << pr_str(args[i], true);
        if (i != args.size() - 1)
        {
            ss << " ";
        }
    }

    string output = ss.str();

    return new TokenString(output);
}

Token *fn_str(vector<Token *> args)
{
    stringstream ss;
    for (size_t i = 0; i < args.size(); i++)
    {
        ss << pr_str(args[i], false);
    }

    string output = ss.str();

    return new TokenString(output);
}

unordered_map<string, Token *> core::ns = {
    {"+", new TokenFunction(fn_add)},
    {"-", new TokenFunction(fn_sub)},
    {"*", new TokenFunction(fn_mul)},
    {"/", new TokenFunction(fn_div)},
    {"=", new TokenFunction(fn_equals)},
    {"list", new TokenFunction(fn_list)},
    {"list?", new TokenFunction(fn_is_list)},
    {"empty?", new TokenFunction(fn_empty)},
    {"count", new TokenFunction(fn_count)},
    {"<", new TokenFunction(fn_less)},
    {"<=", new TokenFunction(fn_less_or_equal)},
    {">", new TokenFunction(fn_greater)},
    {">=", new TokenFunction(fn_greater_or_equal)},
    {"prn", new TokenFunction(fn_prn)},
    {"pr-str", new TokenFunction(fn_pr_str)},
    {"str", new TokenFunction(fn_str)},
    {"println", new TokenFunction(fn_println)},
};
