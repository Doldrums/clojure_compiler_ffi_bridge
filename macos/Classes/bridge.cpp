#include "bridge.h"
#include "types.h"
#include "bridge.pb.h"
#include "core.h"
#include "lib.h"
#include "environment.h"
#include <string>

using namespace std;
using namespace google;

bridge::Token *convertToProto(Token *token)
{
    bridge::Token *tokenProto = new bridge::Token();

    if (TokenSymbol *symbolToken = dynamic_cast<TokenSymbol *>(token))
    {
        tokenProto->set_type(bridge::TokenType::TT_SYMBOL);
        bridge::TokenSymbol *symbolProto = new bridge::TokenSymbol();
        symbolProto->set_name(symbolToken->name);
        tokenProto->set_allocated_symbol(symbolProto);
    }
    else if (TokenKeyword *keywordToken = dynamic_cast<TokenKeyword *>(token))
    {
        tokenProto->set_type(bridge::TokenType::TT_KEYWORD);
        bridge::TokenKeyword *keywordProto = new bridge::TokenKeyword();
        keywordProto->set_value(keywordToken->value);
        tokenProto->set_allocated_keyword(keywordProto);
    }
    else if (TokenString *stringToken = dynamic_cast<TokenString *>(token))
    {
        tokenProto->set_type(bridge::TokenType::TT_STRING);
        bridge::TokenString *stringProto = new bridge::TokenString();
        stringProto->set_value(stringToken->value);
    }
    else if (TokenNumber *numberToken = dynamic_cast<TokenNumber *>(token))
    {
        tokenProto->set_type(bridge::TokenType::TT_NUMBER);
        bridge::TokenNumber *numberProto = new bridge::TokenNumber();
        numberProto->set_value(numberToken->value);
        tokenProto->set_allocated_number(numberProto);
    }
    else if (TokenNil *nilToken = dynamic_cast<TokenNil *>(token))
    {
        tokenProto->set_type(bridge::TokenType::TT_NIL);
        bridge::TokenNil *nilProto = new bridge::TokenNil();
        tokenProto->set_allocated_nil(nilProto);
    }
    else if (TokenTrue *trueToken = dynamic_cast<TokenTrue *>(token))
    {
        tokenProto->set_type(bridge::TokenType::TT_TRUE);
        bridge::TokenTrue *trueProto = new bridge::TokenTrue();
        tokenProto->set_allocated_true_(trueProto);
    }
    else if (TokenFalse *falseToken = dynamic_cast<TokenFalse *>(token))
    {
        tokenProto->set_type(bridge::TokenType::TT_FALSE);
        bridge::TokenFalse *falseProto = new bridge::TokenFalse();
        tokenProto->set_allocated_false_(falseProto);
    }
    else if (TokenList *listToken = dynamic_cast<TokenList *>(token))
    {
        tokenProto->set_type(bridge::TokenType::TT_LIST);
        bridge::TokenList *listProto = new bridge::TokenList();
        listProto->set_start_symbol(std::string(1, listToken->startSymbol));
        listProto->set_end_symbol(std::string(1, listToken->endSymbol));
        for (const auto &t : listToken->list)
        {
            *listProto->mutable_list()->Add() = *convertToProto(t);
        }
        tokenProto->set_allocated_list(listProto);
    }

    return tokenProto;
}

#define EXPORT extern "C" __attribute__((visibility("default"))) __attribute__((used))

EXPORT void *init_enviroment()
{
    Environment *env = new Environment();

    for (const auto &pair : core::ns)
    {
        env->set(pair.first, pair.second);
    }
    return env;
}

EXPORT int parse_line(unsigned char **buff, char *line)
{
    string input(line);
    Token *token = READ(input);

    bridge::Token *tokenProto = convertToProto(token);
    long int len = tokenProto->ByteSizeLong();

    *buff = (unsigned char *)malloc(len);
    tokenProto->SerializeToArray(buff, len);

    free(token);
    free(tokenProto);

    return len;
}

EXPORT char *eval_line(char *line, void *env)
{
    string input(line);
    Token *token = READ(input);
    Token *evaluatedToken = EVAL(token, (Environment *)env);
    string result = PRINT(evaluatedToken);

    char *resultCStr = new char[result.length() + 1];
    strcpy(resultCStr, result.c_str());

    free(token);
    free(evaluatedToken);

    return resultCStr;
}
