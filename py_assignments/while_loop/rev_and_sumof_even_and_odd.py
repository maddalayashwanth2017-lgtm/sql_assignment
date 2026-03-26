x = int(input("Enter a number: "))
y=x
rev=0
even=0
odd=0
while x!=0:
    rem=x%10
    if rem%2==0:
        even+=rem
    else:
        odd+=rem
    rev=(rev*10) + rem
    x//=10

print("Reverse of " + str(y) + " is: " + str(rev))
print("Sum of evens is: "+str(even))
print("Sum of evens is: "+str(odd))