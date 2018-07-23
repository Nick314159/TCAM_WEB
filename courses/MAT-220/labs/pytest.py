def FindPrimes(start,end):
    x=[]
    for i in range(start,end+1):
        check=True
        for j in range(2,i):
            if i%j==0:
                check=False
                break
        if check==True:
            print(i)
            x=x+[i]
    return x

result = FindPrimes(1,10)
print(result)
