a = int(input("Input base: "))
m = int(input("Input modulo: "))
n = int(input("Input exponent: "))
p = 1

a = a % m


for i in range(n):
	p *= a
	p = p % m
print(p)	


