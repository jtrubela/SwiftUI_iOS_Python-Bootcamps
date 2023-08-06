#8.4 Open the file romeo.txt and read it line by line.

#The program should build a list of words.
#For each word on each line check to see if the word is already in the list
#and if not append it to the list. When the program completes,


fname = input("Enter file name: ")
if len(fname) < 1:
    fname = "romeo.txt"

fh = open(fname)
lst = list()

#For each line, split the line into a list of words using the split() method.
for line in fh:
    line = line.split()
    for word in line:
        if word not in lst: lst.append(word)
lst.sort()


#sort and print the resulting words in alphabetical order.
print(lst)
