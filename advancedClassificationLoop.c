#include <NumClass.h>

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