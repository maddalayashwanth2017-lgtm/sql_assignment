# Given the list [10, 20, 30, 40, 50], write a program using a for loop to print the list elements in reverse order.

num=[10,20,30,40,50]
for i in range (len(num)-1,-1,-1):
   print(num[i],end=" ")
