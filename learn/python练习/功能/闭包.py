import json
import re
#最多两个函数
def ExFunc(n):
     sum=n
     def InsFunc(x):
        print(sum+x)
     return InsFunc
for i in range(5):
    xz = i + 10
    yz = i + 20
    myFunc=ExFunc(50)
    myFunc(10)

url = 'www.baidu.com'
print(re.match('www', url).span())