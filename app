# Класс Fuzzy (нечеткое число)
class Fuzzy:

    a = 0
    b = 0
    c = 0
    d = 0

    def __init__(self, a, b, c, d):
        """Constructor"""
        self.a = a
        self.b = b
        self.c = c
        self.d = d

    def print(self):
        print('{:<7.2f}{:<7.2f}{:<7.2f}{:<7.2f}'.format(self.a,self.b,self.c,self.d))

    # Проверка: все ли точки = 0?
    def isNull(self):
        return (self.a == 0) and (self.b == 0) and (self.c == 0) and (self.d == 0)

f = open('file.txt')
strMass = f.readlines()
f.close()

# Матрица Fuzzy-объектов
fuzzyArray = []

for i in range(len(strMass)):
    fuzzyArray.append([])
    str = strMass[i].split()
    for s in str:
        values = s.split(',')
        fuzzy = Fuzzy(int(values[0]), int(values[1]), int(values[2]), int(values[3]))
        fuzzyArray[i].append(fuzzy)

# Составление списка нечетких чисел

fuzzyList = []

for i in range(len(fuzzyArray)):
    sumB = 0
    sumC = 0
    firstEntry = True
    for j in range(len(fuzzyArray[i])):
        if (not fuzzyArray[i][j].isNull()):
            if firstEntry:
                minA = fuzzyArray[i][j].a
                minD = fuzzyArray[i][j].d
            else:
                if fuzzyArray[i][j].a < minA:
                    minA = fuzzyArray[i][j].a
                if fuzzyArray[i][j].d < minD:
                    minD = fuzzyArray[i][j].d
            sumB += fuzzyArray[i][j].b
            sumC += fuzzyArray[i][j].c
    fuzzyList.append(Fuzzy(minA,1/4*sumB,1/4*sumC,minD))

for fuz in fuzzyList:
    fuz.print()