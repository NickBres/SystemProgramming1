#include "NumClass.h"

int isPrime(int num){
    for(int i = 2; i < num; i++){
        if(num%i == 0) return FALSE;
    }

    return TRUE;
};

int isStrong(int num){
    int sum = 0;
    int n = num;
    int temp;

    while(n > 0){
        temp = n%10;
        sum += factorial(temp);
        n = n/10;
    }

    return sum == num ;
};

int factorial(int num){
    int fact = 1;

    while(num > 0){
        fact *= num--;
    }

    return fact;
};