#Buying items and who pays for them
import os
handle = open("purchases.txt")

from datetime import datetime
date = datetime.now().strftime('%H:%M:%S %m-%d-%Y')

#python3 purchases.py
def line(): print("_______________________________________________________________________________________")
purchases = {'Toilet Paper': False, 'Hello Fresh': True}

lst = list(purchases.keys())
print(lst)


#Dictionary Patch HISTORY
for purchases in handle:
    if not purchases.startswith("{"):
        continue
        print(purchases)
    for purchase in purchases:
        if purchase not in purchases: continue
        else: purchases
        print(purchases)
    

#PURCHASES DICTIONARY
line()

print('\nChoose from the list of purchase items.')
print("Avaiable items:\n\n", lst, "\n")

#Item Dictionary
def TP():
    itemQuestion()
    itemIfLoop()

def HF():
    itemQuestion()
    itemIfLoop()

#_______________________________________________________________________________
#Which item # QUESTION:
item = input("\nWhat item would you like to know about? ")
line()
#_______________________________________________________________________________

#if loop for bought purchases
def itemQuestion():
    print("\nDid Justin buy", item ,"last?\n")
def itemIfLoop():
    if purchases[item] == True:
        print("\tYes, Justin did buy", item ,"last")
    else:
        print("\tNo, Justin did not buy", item ,"last")


def if_ITEMInList():
    if item == 'Toilet Paper':
        TP()
        line()
    elif item == 'Hello Fresh':
        HF()
        line()
    elif item not in purchases:
        print("\n\t\t**NEW ITEM DETECTED**")
        line()

        newItem = input("\nDid you buy this item last?(y/n):")
        line()

        if newItem == 'y':
            purchases[item] = True
        else: purchases[item] = False

#_______________________________________________________________________________
if_ITEMInList()
print("\nJustin's purchases are as follows:\n\t", purchases)
line()
#_______________________________________________________________________________


tp = (str(purchases["Toilet Paper"]))
hp = (str(purchases["Hello Fresh"]))


fw = open("purchases.txt", "a")
fw.write("\n" + str(purchases) +"\n" + str(date))
fw.close()
