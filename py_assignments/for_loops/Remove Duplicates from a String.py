# Remove Duplicates from a String
# Given the string "programming", write a program to remove duplicate characters and print the new string.

a="programming"
b=""
for i in a:
    if i not in b:
        b=b+i

print(b)
        



        
