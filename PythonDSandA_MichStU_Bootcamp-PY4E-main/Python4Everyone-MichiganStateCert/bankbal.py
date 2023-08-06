import os

from datetime import datetime
timestamp = datetime.now().strftime('DATE~%m-%d-%Y @ TIME~%H:%M:%S')

fhandle = open("bankbal.txt")

#Largest current batch number variable
batchLg = None
#Largest Batch Number to date and the balance associated
for batch in fhandle:
    #Latest Batch Finder
    batchStart = batch.find("#")
    batchEnd = batch.find("-")
    batchNum = batch[batchStart+1:batchEnd]
    
    if batchLg is None or batchNum > batchLg:
        batchLg = batchNum
        #Latest Balance Finder
        findBal = batch.find("$")
        findCents = batch.find(".")
        balB4 = batch[findBal+1:findCents+3]

#original balance is
print("Your existing balance is $", balB4)

#Inputs the user to change his/her old balance
balNow = input("\nWhat is your new balance? $")

try:
    balance = float(balNow)
    batchNum = int(batchNum)
except:
    print("Not a valid input")
    quit()

print("Your new balance is: $", balance)

#Increment previous balance batch number for new batch
batchNum = batchNum + 1


filePatch = "\n\nBATCH #" + str(batchNum) + " - Bank Account Balance:$" + str(balance) + " - as of " + timestamp
print(filePatch)

#Implement the File Patch
fw = open("bankbal.txt", "a")
fw.write(filePatch)
fw.close()
