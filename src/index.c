/******************************************************************************

Welcome to GDB Online.
GDB online is an online compiler and debugger tool for C, C++, Python, PHP, Ruby, 
C#, VB, Perl, Swift, Prolog, Javascript, Pascal, HTML, CSS, JS
Code, Compile, Run and Debug online from anywhere in world.

*******************************************************************************/
#include <stdio.h>

int arr[25] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25};

int arr1[5];
int arr2[5];

int main()
{
    for (int i = 0; i < 5; i ++){
        arr1[i] = arr[i];
        arr2[i] = arr[20 + i];
    }
    for (int i = 0; i < 5; i ++){
        arr[i] = arr2[i];
        arr[20 + i] = arr1[i];
    }
    
    for (int i = 0; i < 25 ; i++)
        printf("%d ", arr[i]);
    return 0;
}
