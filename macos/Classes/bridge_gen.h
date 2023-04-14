void *init_enviroment();

int parse_line(unsigned char **buff, char *line);

char *eval_line(char *line, void *env);
