

#ifndef MAIN_H
#define MAIN_H

#define TRUE 1
#define FALSE 0

/*
An armstrong number is an n-digit number that is equal
to the sum of the nth powers of its digits
407 = 4^3 + 0^3 + 7^3
*/
int isArmstrong(int);

/*Plaindrome is number that reads tha smae from left to right*/
int isPalindrome(int);

int isPrime(int);

/*
Strong number is a special number whose sum of the factorial of digits
is equeal to the original number. 145 = 1!+4!+5!
*/
int isStrong(int);


#endif