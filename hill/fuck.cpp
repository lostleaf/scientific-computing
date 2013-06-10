#include <cstdio>
#include <cstdlib>
#include <cmath>
#include <cstring>
#include <string>
#include <algorithm>
using namespace std;
const int DICT_SIZE = 1050;
const int STR_LEN = 60;
char dict[DICT_SIZE][30],s[STR_LEN];
int f[STR_LEN],length[DICT_SIZE];
char *str = "CKYNOHKQMAXJQBHAZWUHDAOQWXIPQZBKMPUTIPVSWSBYXKKWQHADMBDM";
int gcd(int a,int b)
{
    return b ? gcd(b,a%b) : a;
}
int match(char *a, char *b)
{
    for(;*a && *b; a++, b++)
        if(*a != *b)
            return 0;
    return !*b;
}
void check(int a, int b, int c, int d)
{
    int det = ((a*d-b*c)%26+26)%26;
    if(gcd(det,26) > 1) return;
    memset(f,0,sizeof(f));
    int len = strlen(str);
    for(int i = 0; i < len; i += 2)
    {
        s[i]   = (a * (str[i] - 64) + b * (str[i+1] - 64)) % 26 + 96;
        s[i+1] = (c * (str[i] - 64) + d * (str[i+1] - 64)) % 26 + 96;
        if(s[i]  ==96) s[i] = 'z';
        if(s[i+1]==96) s[i+1]  = 'z';
    }
    for(int i = 0; i < len; i++)
    {
        f[i] = f[i-1];
        for(int j = 0; j <= 1000; j++)
            if (i+1 >= length[j] && match(s+i-length[j], dict[j]))
                f[i] = max(f[i], (i-length[j]>0 ? f[i-length[j]] : 0)+length[j]);
    }
    if(f[len-1]>30)
        printf("%s %d\n", s, f[len-1]);
}
int main()
{
    FILE *fdict = fopen("dict1.txt", "r");
    for (int i = 0; i < 1000; ++i)
    {
        fscanf(fdict, "%s", dict[i]);
        length[i] = strlen(dict[i]);
    }
    printf("%s", dict[0]);
    for (int i = 0; i < 25; ++i)
        for (int j = 0; j < 25 ; ++j)
            for (int k = 0; k < 25; ++k)
                for (int l = 0; l < 25; ++l)
                    check(i,j,k,l);
    return 0;
}