#include "NumClass.h"


int isPalindrome(int num){
    int reversed = reverse(num);
    return reversed == num ? 1 : 0;
    
}

int isArmstrong(int num){
    int len,sum,temp;

    if(num < 0) num *= -1;

    len = lenghtRec(num);
    sum = ArmstrongRec(num,len);
    
    return sum == num ? 1 : 0;
}

int ArmstrongRec(int num,int len){
    int temp;
    if(num == 0) return 0;
    temp = num%10;
    temp = powRec(temp,len);
    return temp + ArmstrongRec(num/10,len);
}

int powRec(int num1,int num2){
    if(num2 == 0) return 1;
    return num1 * powRec(num1,num2-1);
}

int lenghtRec(int num){
    if(num == 0) return 0;
    return 1 + lenghtRec(num/10);
}
int reverse(int num){
    return reverseRec(num,0);
}
int reverseRec(int num,int revNum){
    int temp;
    if(num <= 0) return revNum;
    temp = num%10;
    return reverseRec(num/10,revNum * 10 + temp);
}