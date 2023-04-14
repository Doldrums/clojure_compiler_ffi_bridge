#include "lib.h"
#include "reader.h"
#include "printer.h"

using namespace std;

Token *READ(const string &input)
{
    return read_str(input);
}

Token *eval_ast(Token *ast, Environment *env)
{
    if (auto symbol = dynamic_cast<TokenSymbol *>(ast))
    {
        auto name = symbol->name;
        return env->get(name);
    }
    else if (auto list = dynamic_cast<TokenList *>(ast))
    {
        TokenList *result = new TokenList(list->startSymbol, list->endSymbol);
        for (auto &elem : list->list)
        {
            result->list.push_back(EVAL(elem, env));
        }
        return result;
    }
    else
    {
        return ast;
    }
}

Token *EVAL(Token *ast, Environment *env)
{
    if (TokenList *list = dynamic_cast<TokenList *>(ast))
    {
        if (list->list.empty())
        {
            return ast;
        }

        if (list->startSymbol == '[')
        {
            TokenList *result = new TokenList('[', ']');
            for (auto &elem : list->list)
            {
                result->list.push_back(EVAL(elem, env));
            }
            return result;
        }
        else if (list->startSymbol == '{')
        {
            TokenList *result = new TokenList('{', '}');
            for (int i = 0; i < list->list.size(); i += 2)
            {
                auto key = list->list[i];
                auto value = list->list[i + 1];
                auto evaluated_key = EVAL(key, env);
                auto evaluated_value = EVAL(value, env);
                result->list.push_back(evaluated_key);
                result->list.push_back(evaluated_value);
            }
            return result;
        }

        if (TokenSymbol *sym = dynamic_cast<TokenSymbol *>(list->list[0]))
        {
            if (sym->name == "def!")
            {
                auto args = vector<Token *>(list->list.begin() + 1, list->list.end());
                if (args.size() != 2)
                {
                    throw runtime_error("Invalid number of arguments for def!");
                }
                TokenSymbol *key = dynamic_cast<TokenSymbol *>(args[0]);
                if (!key)
                {
                    throw runtime_error("First argument for def! should be a symbol");
                }
                Token *value = EVAL(args[1], env);
                env->set(key->name, value);
                return value;
            }
            else if (sym->name == "let*")
            {
                auto args = vector<Token *>(list->list.begin() + 1, list->list.end());
                if (args.size() < 2)
                {
                    throw runtime_error("Invalid number of arguments for let*");
                }
                TokenList *bindings = dynamic_cast<TokenList *>(args[0]);
                if (!bindings)
                {
                    throw runtime_error("Second argument for let* should be a bindings list");
                }
                Environment letEnv(env);
                for (size_t i = 0; i < bindings->list.size(); i += 2)
                {
                    TokenSymbol *key = dynamic_cast<TokenSymbol *>(bindings->list[i]);
                    if (!key)
                    {
                        throw runtime_error("First argument in bindings pair should be a symbol");
                    }
                    Token *value = EVAL(bindings->list[i + 1], &letEnv);
                    letEnv.set(key->name, value);
                }
                return EVAL(args[1], &letEnv);
            }
            else if (sym->name == "fn*")
            {
                auto args = vector<Token *>(list->list.begin() + 1, list->list.end());
                if (args.size() != 2)
                {
                    throw runtime_error("Invalid number of arguments for fn*");
                }
                TokenList *bindings = dynamic_cast<TokenList *>(args[0]);
                if (!bindings)
                {
                    throw runtime_error("First argument for fn* should be a bindings list");
                }
                Token *expr = args[1];
                return new TokenFunction([bindings, env, expr](vector<Token *> args) -> Token *
                                         {
                    Environment* fnEnv = new Environment(env, bindings->list, args);

                    return EVAL(expr, fnEnv); });
            }
            else if (sym->name == "if")
            {
                auto args = vector<Token *>(list->list.begin() + 1, list->list.end());
                if (args.size() < 2 || args.size() > 3)
                {
                    throw runtime_error("Invalid number of arguments for if");
                }

                Token *condition = EVAL(args[0], env);
                TokenNil *is_nil = dynamic_cast<TokenNil *>(condition);
                TokenFalse *is_false = dynamic_cast<TokenFalse *>(condition);

                if (!is_nil && !is_false)
                {
                    return EVAL(args[1], env);
                }
                else if (args.size() == 3)
                {
                    return EVAL(args[2], env);
                }
                else
                {
                    return new TokenNil();
                }
            }
            else if (sym->name == "do")
            {
                auto args = vector<Token *>(list->list.begin() + 1, list->list.end());

                TokenList *ast = new TokenList('(', ')');
                ast->list = args;
                TokenList *result = dynamic_cast<TokenList *>(eval_ast(ast, env));

                if (!result)
                {
                    throw runtime_error("Invalid arguments for do");
                }

                return result->list.back();
            }
        }

        TokenList *evaledList = dynamic_cast<TokenList *>(eval_ast(ast, env));
        auto fn = evaledList->list[0];
        auto args = vector<Token *>(evaledList->list.begin() + 1, evaledList->list.end());
        if (TokenFunction *func = dynamic_cast<TokenFunction *>(fn))
        {
            return func->fn(args);
        }

        throw runtime_error("Expected function, got " + pr_str(fn, true));
    }
    else
    {
        return eval_ast(ast, env);
    }
}

string PRINT(Token *ast)
{
    return pr_str(ast, true);
}
