#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "m1p2.h"

#define BUF_SIZE 1024

char* read_from_stdin() {
    char buffer[BUF_SIZE];
    size_t contentSize = 1;
    char *content = malloc(sizeof(char) * BUF_SIZE);
    if (content == NULL) {
        exit(1);
    }
    content[0] = '\0';

    while (fgets(buffer, BUF_SIZE, stdin)) {
        char *old = content;
        contentSize += strlen(buffer);
        content = realloc(content, contentSize);
        if (content == NULL) {
            free(old);
            exit(2);
        }
        strcat(content, buffer);
    }

    return content;
}

int convert_to_int(char* str) {
    return atoi(str);
}

int main(int argc, char *argv[]) {
    char *content = read_from_stdin();

    int number = convert_to_int(content);
    m1p2(number);

    free(content);

    return 0;
}