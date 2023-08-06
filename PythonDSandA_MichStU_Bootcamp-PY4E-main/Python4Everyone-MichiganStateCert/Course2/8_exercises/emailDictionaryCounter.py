file = input("Enter file:")
if len(file) < 1 : file = "mbox-short.txt"

handle = open(file)
dictionary = dict()

for line in handle:
    if not line.startswith('From '):
        continue
    line = line.split()
    for words in line: email = line[1]
            
    dictionary[email] = dictionary.get(email, 0) + 1


#Maximum loop
maxNum = 0
email = None
for key,value in dictionary.items():
    if value > maxNum:
        maxNum = value
        email = key
print(email, maxNum)
