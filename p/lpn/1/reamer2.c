#include <stdio.h>

#define nil NULL
#define nul '\0'

char adjust_nybble(char);

int
main(int ac, char **al)
{
    char c[2] = {0}, byte = 0;
    FILE *fdin = nil, *fdout = nil;

    if(ac == 1){
        fdin = stdin;
        fdout = stdout;
    } else if(ac >= 2) {
        if((fdin = fopen(al[1], "r")) == nil){
            printf("[-] fopen failed!\n");
            return 1;
        }

        if(ac >= 3){
            if((fdout = fopen(al[2], "w")) == nil){
                printf("[-] fopen failed!\n");
                return 1;
            }
        } else {
            fdout = stdout;
        }
    } 

    while(get_byte_pair(c, fdin) == 2){
        byte = (adjust_nybble(c[0]) << 4 | adjust_nybble(c[1]));
        fprintf(fdout, "%c", byte);
    }

    fclose(fdin);
}

char
adjust_nybble(char c)
{
    if(c >= '0' && c <= '9'){
        // 48 is ASCII '0'
        return c - 48;
    } else {
        // 87 is 10 less than 'a', and makes 0x0A work as 10
        return c - 87;
    }
}

int
get_byte_pair(char c[2], FILE *fdin)
{
    char ch = 0;
    int idx = 0;

    while(idx < 2){
        ch = fgetc(fdin);
        if(feof(fdin)){
            return -1;
        } else if(ch == ' ' || ch == '\n' || ch == '\r' || ch == '\t'){
            continue; // keep eating white space chars
        } else if((ch >= '0' && ch <= '9') || (ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z')){
            c[idx] = ch;
            idx++;
        } 
    }
    return idx;
}
