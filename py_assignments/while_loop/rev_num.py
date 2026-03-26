num=int(input("enter your num: "))
x=num
rev=0

while num!=0:
    rem=num%10
    rev=(rev*10)+rem
    num=num//10


print(f"reverse order of your num {x} is: {rev}")

