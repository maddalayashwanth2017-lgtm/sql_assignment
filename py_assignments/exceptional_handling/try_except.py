try:
    age=int(input("enter you age: "))
    print("your age is",age)

except:
    print("please enter age in numbers only")

try:
    num=int(input("enter you number: "))
    rev=0
    for i in str(num):
        div=num%10
        rev=rev*10+div
        num=num//10
    print("reverse num: ",rev)



except:
    print("you must give only number")
cls