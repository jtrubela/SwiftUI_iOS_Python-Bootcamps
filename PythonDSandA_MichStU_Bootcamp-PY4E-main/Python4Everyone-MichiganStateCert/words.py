fname = input("Enter file name: ")
if len(fname) < 1: fname = "mbox-short.txt"

fh = open(fname)
words = fh.read()

for lines in words:
    words.strip()
    print(words.upper())  
