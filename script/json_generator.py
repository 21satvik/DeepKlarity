import json
import csv
import random
from lorem_text import lorem
from string import ascii_lowercase
import itertools


def iter_all_strings():
    for size in itertools.count(1):
        for s in itertools.product(ascii_lowercase, repeat=size):
            yield "".join(s)


gen = iter_all_strings()


def productName():
    for l in gen:
        return l.upper()


file = open('./assets/train.csv')
csvreader = csv.reader(file)
next(csvreader)
responseData = []
for url in csvreader:
    data = {}
    data["productName"] = "Product " + productName()
    data["productURL"] = url[0]
    data["productRating"] = random.randint(1, 5)
    data["productDescription"] = lorem.words(10)
    responseData.append(data)
responseJson = json.dumps(responseData)

f = open("./assets/product.json", "w")
f.write(responseJson)
f.close()
