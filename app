class Fuzzy:

    a1 = 0
    m1 = 0
    m2 = 0
    a2 = 0

    def __init__(self, a1, m1, a2, m2):
        """Constructor"""
        self.a1 = a1
        self.m1 = m1
        self.m2 = m2
        self.a2 = a2

    def print(self):
        print(self.a1," ",self.m1, " ", self.m2, " ", self.a2)

    def isNull(self):
        return (self.a1 == 0) and (self.a2 == 0) and (self.m1 == 0) and (self.m2 == 0)

f = open('file.txt')
strMass = f.readlines()
f.close()

fuzzyArray = []

for i in range(len(strMass)):
    fuzzyArray.append([])
    str = strMass[i].split()
    for s in str:
        values = s.split(',')
        fuzzy = Fuzzy(int(values[0]), int(values[1]), int(values[2]), int(values[3]))
        fuzzyArray[i].append(fuzzy)

for list in fuzzyArray:
    for fuz in list:
        fuz.print()
        print(fuz.isNull())