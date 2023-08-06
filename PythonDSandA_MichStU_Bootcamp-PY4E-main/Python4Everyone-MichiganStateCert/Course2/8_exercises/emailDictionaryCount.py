file = input("Enter file:")
if len(file) < 1 : file = "mbox-short.txt"

handle = open(file)
counts = dict()

for line in handle:
    if not line.startswith('From '):
        continue
    words = line.split()
    email = words[1]

    if email in counts:
        counts[email] +=1
    else:
        counts[email] = 1

#Maximum loop
largest = 0
email = None
for key,value in counts.items():
    if value > largest:
        largest = value
        email = key
print(email, largest)
