#include <iostream>
#include <cstdio>
#include <cstdlib>

using namespace std;

const int MAXN = 200;
char code[MAXN] = "VIKYNOTCLKYRJQETIRECVUZLNOJTUYDIMHRCFITQ";
char ans[MAXN];
int length;
int count = 0;
int getNum(char letter)
{
    return (letter - 'A' + 1) % 26;
}

char getLetter(int num)
{
    if(num == 0) return 'Z';
    return 'A' + num - 1;
}

void printCode(int c1, int c2)
{
    int a1, a2, b1, b2;
    int d1 = (1 + 6 * c1) % 26;
    int d2 = (17 + 6 * c2) % 26;
    for(int i = 0; i < length; i += 2)
    {
        b1 = getNum(code[i]);
        b2 = getNum(code[i + 1]);

        a1 = (c1 * b1 + d1 * b2) % 26;
        a2 = (c2 * b1 + d2 * b2) % 26;

        ans[i] = getLetter(a1);
        ans[i + 1] = getLetter(a2);
        if(code[i] == 'T' && code[i+1] == 'C')
        {
            if(ans[i] != 'M' || ans[i+1] != 'A') return;
            //to see the out file, I can see ans[4] and ans[5] must be 'O' and 'U', so
            //guess ans[3~9] is "you make", so try it and final success!!
        }
        //printf("%c%c", getLetter(a1), getLetter(a2));
    }
    ans[length] = '\0';
    ++count;
    printf("%d\n", count);
    printf(ans);
    printf("\n");
}
int main()
{
    freopen("in.txt", "w", stdout);
    for(length = 0; code[length] != '\0'; ++length);

    for(int i = 0; i < 26; ++i)
        for(int j = 0; j < 26; ++j)
            printCode(i, j);

    return 0;
}
