#Write a program to prompt for a file name, and then read through the file and look for lines of the form: X-DSPAM-Confidence:0.8475
#When you encounter a line that starts with "X-DSPAM-Confidence:" pull apart the line to extract the floating-point number on the line. Count these lines and them compute the total of the spam confidence calues from these lines. When you reach the end of the file, print out the average spam confidence

import os

file = input("Enter a file name:")
if len(file) < 1:
    file = "mbox-short.txt"
handle = open(file)

confList = list()

for line in handle:
    if not line.startswith("X-DSPAM-Confidence:"): continue
    
    else:
        findConf = line.find(':')
        confNum = float(line[findConf+1:])
        confList.append(confNum)
        average = round((sum(confList)/len(confList)), 10)
print("Average spam confidence:", average)
