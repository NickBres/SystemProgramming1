int ArmstrongRec(int,int);
int powRec(int,int);
int lengthRec(int);
int reverseRec(int,int);
int reverse(int);


int isPalindrome(int num){
    int reversed = reverse(num);
    return reversed == num ? 1 : 0;
    
};

int isArmstrong(int num){
    int len,sum;

    if(num < 0) num *= -1;

    len = lengthRec(num);
    sum = ArmstrongRec(num,len);
    
    return sum == num ? 1 : 0;
};

/*recursion function
get number and its lenght
return Armstrong sum*/
int ArmstrongRec(int num,int len){
    int temp;
    if(num == 0) return 0;
    temp = num%10;
    temp = powRec(temp,len);
    return temp + ArmstrongRec(num/10,len);
};

/*recursion power function
get two nubers
returns first number power second*
*/
int powRec(int num1,int num2){
    if(num2 == 0) return 1;
    return num1 * powRec(num1,num2-1);
};


/*recursion length function
get number
return its lenght
*/
int lengthRec(int num){
    if(num == 0) return 0;
    return 1 + lengthRec(num/10);
};

int reverse(int num){
    return reverseRec(num,0);
};

/*recursion reverse function
get number and 0
return it reversed
123 -> 321*/
int reverseRec(int num,int revNum){
    int temp;
    if(num <= 0) return revNum;
    temp = num%10;
    return reverseRec(num/10,revNum * 10 + temp);
};