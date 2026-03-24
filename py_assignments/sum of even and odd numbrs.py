num=input("enter your number give comma after every number:-- ").split(",")
x=[]
y=[]

for i in num:
    i=int(i)
    if i%2==0:
        x.append(i)
    else:
        y.append(i)

print(f"sum of even num= {sum(x)} , sum of odd number= {sum(y)}")





