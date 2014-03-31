#include <stdio.h>
#include <string.h>
/* isSubstring? This was posted to reddit, which made me curious
 * as to how to write a simple method, isSubstring, that tests if
 * one value is a substring of the other.
 */

int issubstring_p(const char *, const char *);

int
main()
{
    char *f = "foo", *t = "fooseball", *h = "handfoot", *j = "no match here", *k = "near match: fo";

    if(!issubstring_p((const char *)f, (const char *)f)){
        printf("something went wrong; it's not a substring of itself?\n");
    } else {
        printf("%s is a substring of %s\n", f, f);
    }

    if(!issubstring_p((const char *)t, (const char *)f)){
        printf("something went wrong; it's not a substring?\n");
    } else {
        printf("%s is a substring of %s\n", f, t);
    }

    if(!issubstring_p((const char *)h, (const char *)f)){
        printf("something went wrong; it's not a substring?\n");
    } else {
        printf("%s is a substring of %s\n", f, h);
    }

    if(!issubstring_p((const char *)j, (const char *)f)){
        printf("correct; %s is *not* a substring of %s\n", f, j);
    } else {
        printf("what? it shouldn't match here...\n");
    }

    if(!issubstring_p((const char *)k, (const char *)f)){
        printf("correct; %s is *not* a substring of %s\n", f, k);
    } else {
        printf("what? it shouldn't match here...\n");
    }
}

int
issubstring_p(const char *str, const char *sub){
    int str_idx = 0, sub_idx = 0, str_len = strlen(str), sub_len = strlen(sub);
    while(str_idx < str_len){
        if(str[str_idx] == sub[sub_idx]){
            sub_idx++;
        } else {
            sub_idx == 0;
        }
        if(sub_idx == sub_len){
            return 1;
        }
        str_idx++;
    }
    return 0;
}
