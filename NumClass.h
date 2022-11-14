

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

/*recursion function
get number and its lenght
return Armstrong sum*/
int ArmstrongRec(int,int);

/*recursion power function
get two nubers
returns first number power second*
*/
int powRec(int,int);

/*recursion length function
get number
return its lenght
*/
int lengthRec(int);

/*recursion reverse function
get number and 0
return it reversed
123 -> 321*/
int reverseRec(int,int);

/*get number
return it reversed
123 -> 321*/
int reverse(int);

/*get two nubers
returns first number power second*/
int power(int,int);

/*get number
return its lenght*/
int length(int);

/*get positive number
return its factorial*/
int factorial(int);


#endif