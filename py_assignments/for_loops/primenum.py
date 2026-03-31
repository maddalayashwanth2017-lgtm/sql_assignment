num=int(input("enter your number"))
if num>1:
    for i in range(2,num):
        if num%i == 0:
            print("non pime")
            break
    
    print("prime")
         
else:
    print("enter num larger than 1")