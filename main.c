#include <stdio.h>
#include "NumClass.h"

int main(){
    int num1,num2,i;

    printf("Enter first number: ");
    scanf("%d",&num1);
    printf("Enter second number: ");
    scanf("%d",&num2);

    printf("Prime nums are: ");
    for(i = num1;i <= num2;i++){
        if(isPrime(i)) printf("%d, ",i);
    }
    printf("\n");

    printf("Armstrong nums are: ");
    for(i = num1;i <= num2;i++){
        if(isArmstrong(i)) printf("%d, ",i);
    }
    printf("\n");

    printf("Strong nums are: ");
    for(i = num1;i <= num2;i++){
        if(isStrong(i)) printf("%d, ",i);
    }
    printf("\n");

    printf("Palindrome nums are: ");
    for(i = num1;i <= num2;i++){
        if(isPalindrome(i)) printf("%d, ",i);
    }
    printf("\n");
  

};
