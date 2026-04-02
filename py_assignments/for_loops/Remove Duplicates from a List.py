# Remove Duplicates from a List
# Given the list [1, 2, 2, 3, 4, 3, 5], write a Python program to remove duplicate elements and print the new list.

num=[1, 2, 2, 3, 4, 3, 5]
emp=[]
for i in num:
    if i not in emp:
        emp.append(i)
       
print(emp)



