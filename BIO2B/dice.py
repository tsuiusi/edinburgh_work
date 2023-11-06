import random

for _ in range(5):
    n = 0
    diceroll = 0
    while diceroll != 1:
        diceroll = random.randint(1, 6)
        n += 1

    print(n)
print('----------------------------------------------------------------------------------')