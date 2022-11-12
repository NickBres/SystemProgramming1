
int factorial(int);

int isPrime(int num){
    for(int i = 2; i < num; i++){
        if(num%i == 0) return 0;
    }
    return 1;
};

int isStrong(int num){
    int sum = 0;
    int n = num;
    int temp;

    while(n>0){
        temp = n%10;
        sum += factorial(temp);
        n = n/10;
    }

    return sum == num ? 1 :0 ;
};
/*get positive number
eturn its factorial*/
int factorial(int num){
    int fact = 1;
    while(num > 0){
        fact *= num--;
    }
    return fact;
};