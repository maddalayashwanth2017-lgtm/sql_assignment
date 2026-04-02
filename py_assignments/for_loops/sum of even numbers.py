x = input("Enter a number: ")
y=x
rev=0
even=0
odd=0
for i in x:
    # rem = int(i)

    if i%2==0:
        even+=i
    else:
        odd+=i
   
print(f"sum ofeven num are: {even}")
print(f"sum ofeven num are: {odd}")

