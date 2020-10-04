# Computer Architecture Task 2
### Variant 11

Assembler program does:
1.  Fills an array from console input (amount of elements should be > 1 and < 100)
2.  Generates new array
3.  Copies all the elements except for the first positive number

Let's see some of the tests:
1.  Size of array is less than 1, so the program stops
![size of vector? -1 \n Incorrect size of vector](https://raw.githubusercontent.com/OlegStanKoptev/ComArchSeminars/master/task02/images/1.png)

2.  Size of array is grater than 100, so the program stops
![size of vector? 101 \n Incorrect size of vector](https://raw.githubusercontent.com/OlegStanKoptev/ComArchSeminars/master/task02/images/2.png)

3.  Input data is correct, so the first positive gets deleted (which is the very first one)
![user is to enter the value of the first element](https://raw.githubusercontent.com/OlegStanKoptev/ComArchSeminars/master/task02/images/3.png)
![first number is deleted from the second array (value is 1)](https://raw.githubusercontent.com/OlegStanKoptev/ComArchSeminars/master/task02/images/4.png)

4.  Input data is correct once again, the third number is removed
![third number is deleted from the second array (value is 1) ](https://raw.githubusercontent.com/OlegStanKoptev/ComArchSeminars/master/task02/images/5.png)

5. User entered only negative numbers, so there are no changes applied here
![elements from -1 to -10](https://raw.githubusercontent.com/OlegStanKoptev/ComArchSeminars/master/task02/images/6.png)
