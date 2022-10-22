def get_b(a):
    last_pos_ind = -1 
    for ind, elem in enumerate(a):
        if elem > 0:
            last_pos_ind = ind
        else:
            break
    return a[last_pos_ind + 1:]

from random import randint
for i in range(1, 101):
    a = [randint(-10, 10) for _ in range(10)]
    b = get_b(a)
    with open(f"tests/{i}.in", 'w') as infile:
        infile.write(' '.join(str(x) for x in a))
    with open(f"tests/{i}.out", 'w') as outfile:
        outfile.write(' '.join(str(x) for x in b))

