import matplotlib.pyplot as mlp
import re

if __name__ == '__main__':
    n, bc, wc = [ ], [ ], [ ]
    with open('data.csv', 'r') as fp:
        for line in fp:
            values = list(map(int, filter(lambda x: len(x), re.split('\W+', line))))
            n.append(values[0])
            bc.append(values[1])
            wc.append(values[2])
    mlp.scatter(n, bc)
    mlp.suptitle('Tamanho do vetor X Número de instruções')
    mlp.savefig('best.png')
    mlp.clf()
    mlp.scatter(n, wc)
    mlp.suptitle('Tamanho do vetor X Número de instruções')
    mlp.savefig('worst.png')
    mlp.clf()
