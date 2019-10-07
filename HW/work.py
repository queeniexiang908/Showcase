'''
Karina Ionkina and Queenie Xiang
SoftDev02 pd8
K18 -- Reductio ad Absurdum PY version 
2018-04-30
'''

from functools import reduce

'''
list comp + reduce to 
- find frequency of a single word
- total frequency of a group of words
- most frequently occuring word
'''

f = open('LOCD.txt', 'rU')
file = f.read().split()

#print r[:20]

test = "this is a file that I will use to test my code and this is a file code code file.".split()


def frequency(word, the_file):
    arr = [1 for x in the_file if x == word]
#    print arr
    if arr == []:
        return 0
    return reduce( (lambda x,y: x+y), arr)
    

print frequency("code", test)

def group_frequency(list_of_words, the_file):
    arr = [frequency(x, the_file) for x in list_of_words]
    return reduce( (lambda x,y: x+y), arr)

print group_frequency(["I", "code"], test) 


def most_freq(the_file):
    arr = [frequency(x, the_file) for x in the_file]
    return max(arr)

print most_freq(test)

