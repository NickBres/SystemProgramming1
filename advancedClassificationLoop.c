#include "NumClass.h"


int isArmstrong(int num){
    int len,n,sum,temp;
    if(num < 0) num *= -1;
    sum = 0;
    n = num;
    len = length(num);

    while(n > 0){
        temp = power(n%10,len);
        sum += temp;
        n = n/10;
    }
    return num == sum ? 1 : 0;
}

int power(int a,int b){
    int res = 1;
    while (b > 0)
    {
        res = res*a;
        b--;
    }
    return res;
}

int length(int num){
    int len = 0;
    while(num>0){
        len++;
        num = num/10;
    }
    return len;
}

int isPalindrome(int num){
    int reversed = reverse(num);
    return reversed == num;
}

int reverse(int num){
    int reversed = 0,temp;
    while(num > 0){
        temp = num%10;
        reversed = reversed * 10 + temp;
        num = num/10;
    }
    return reversed;
}