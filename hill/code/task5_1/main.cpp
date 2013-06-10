#include <iostream>
#include <cstdio>
#include <cstdlib>

using namespace std;

const int MAXN = 200;
char code[MAXN] = "CKYNOHKQMAXJQBHAZWUHDAOQWXIPQZBKMPUTIPVSWSBYXKKWQHADMBDM";
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

int gcd(int x, int y)
{
    if(x == 0) return y;
    return gcd(y % x, x);
}
bool analysis()
{
    int count_i = 0, count_n = 0, count_g = 0, count_a = 0, count_u = 0;
    if(ans[0] == 'A' || ans[0] == 'E' || ans[0] == 'I' || ans[0] == 'O' || ans[0] == 'U') return false;
    for(int i = 0; i < length; ++i)
    {
        if(ans[i] == 'A') ++count_a;
        else if(ans[i] == 'U') ++count_u;
        else if(ans[i] == 'I') ++count_i;
        else if(ans[i] == 'N') ++count_n;
        else if(ans[i] == 'G') ++count_g;
    }

    if(count_i < 6) return false;
    if(count_n < 5) return false;
    if(count_g < 4) return false;
    if(count_a < 4) return false;
    if(count_u < 4) return false;
    return true;
}

void printCode(int a1, int a2, int a3, int a4)
{
    int det = a1 * a4 - a2 * a3;
    if(det == 0) return;
    if(det > 0 && gcd(det, 26) != 1) return;

    int b1, b2, o1, o2;
    for(int i = 0; i < length; i += 2)
    {
        b1 = getNum(code[i]);
        b2 = getNum(code[i + 1]);

        o1 = (a1 * b1 + a2 * b2) % 26;
        o2 = (a3 * b1 + a4 * b2) % 26;

        ans[i] = getLetter(o1);
        ans[i + 1] = getLetter(o2);


    }
    ans[length] = '\0';
    if(analysis())
    {
        ++count;
        printf("%d\n", count);
        printf(ans);
        printf("\n");
    }
}
int main()
{
    freopen("in.txt", "w", stdout);
    for(length = 0; code[length] != '\0'; ++length);

    for(int i1 = 0; i1 < 26; ++i1)
        for(int i2 = 0; i2 < 26; ++i2)
            for(int i3 = 0; i3 < 26; ++i3)
                for(int i4 = 0; i4 < 26; ++i4)
                    printCode(i1, i2, i3, i4);

    return 0;
}
