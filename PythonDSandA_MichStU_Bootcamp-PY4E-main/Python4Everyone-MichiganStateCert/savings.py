#Create a savings program that displays a dictionary of your savings items(keys,values)
#SAVE todays total into a list so that it can be averaged out later to find out the total per week average
#Add a goal progress percentage
#Batch/Patch a text document with all the information
#Writing files to the end of a document
import os
from datetime import datetime
timestamp = datetime.now().strftime('DATE~%m-%d-%Y @ TIME~%H:%M:%S')

# python3 savings.py
print('-------------------------------------------------------------------')
handle = open('savingstotal.txt')
print('\t\t\t   SAVINGSTOTAL.TXT')

print('-------------------------------------------------------------------')
savingsList = []
print('\t\t\t***SAVINGS LIST***\t' + str(savingsList))

#For each line in the handle, add number to the savings list for later use in dictionary
for line in handle:
        print('-------------------------------------------------------------------')
        print('\nIN MONEY.TXT I PULLED THIS LINE: ', line)
        dollars = line.find('$')
        cents = line.find('.')
        if '$' or '.' in line:
                money = line[dollars+1:cents+3]
                try:
                    if money not in savingsList:
                        savingsList.append(float(money))
                        print('***SAVINGS LIST***\t' + str(savingsList))
                except:
                    continue

        else:
            continue
total = {'Total': savingsList[0]}
print('-------------------------------------------------------------------')
print('\n\n***THIS IS THE CURRENT TOTAL SAVINGS DICTIONARY IN SAVINGSTOTAL.TXT')
print(total)

savings = {'Rainy Day': savingsList[1], 'Credit Card Debt': savingsList[2], 'Pay off iPhone': savingsList[3], 'Car' :savingsList[4], 'PS4': savingsList[5]}

print('-------------------------------------------------------------------')
print('***THIS IS THE CURRENT TOTAL SAVINGS DICTIONARY IN SAVINGSTOTAL.TXT')
print(savings)




#------------------------------
#TODAYS SAVINGS PROTOCOLS
#------------------------------
print('-------------------------------------------------------------------')
print('\n\n\n\n\t\t*****START TODAYS SAVINGS PROTOCOLS*****')


#Total savings for the day
print('-------------------------------------------------------------------')
print('\t\t\t    SAVINGSTODAY.TXT')
print('-------------------------------------------------------------------')

today = input('Enter today\'s savings:$')
print('-------------------------------------------------------------------')

total = savingsList[4] + float(today)

for account in savings:
    print("\nFor savings account", account, ":")
    def runItem():
        #addMoney = input("Add money to account? (y/n)")
        if account == 'Rainy Day':
            rainyDay = input("'Rainy Day' account =  $")
            try:
                savings[account] = float(rainyDay)
            except:
                print("**ERROR**\nNot a valid response. Try again")
                return runItem()

        if account == 'Credit Card Debt':
            creditCard = input("'Credit Card Debt' account =  $")
            try:
                savings[account] = float(creditCard)
            except:
                print("**ERROR**\nNot a valid response. Try again")
                return runItem()

        if account == 'Pay off iPhone':
            iPhone = input("''Pay off iPhone' account =  $")
            try:
                savings[account] = float(iPhone)
            except:
                print("**ERROR**\nNot a valid response. Try again")
                return runItem()

        if account == 'Car':
            car = input("'Car' account =  $")
            try:
                savings[account] = float(car)
            except:
                print("**ERROR**\nNot a valid response. Try again")
                return runItem()
        if account == 'PS4':
            ps4= input("'PS4' account =  $")
            try:
                savings[account] = float(ps4)
            except:
                print("**ERROR**\nNot a valid response. Try again")
                return runItem()
    runItem()

totalSavings = savings['Rainy Day'] + savings['Credit Card Debt'] + savings['Pay off iPhone'] + savings['Car'] + savings['PS4']


#The total of savings all together
print('\nIn total for all categories we have saved $', totalSavings, "\n")
print('-------------------------------------------------------------------')



def filePatch():
    file = "savingstoday.txt"
    #fw = open(file, "w+")

    print('\n\n\n\n\n\nTHIS IS WHAT WILL BE WRITTEN IN SAVINGSTODAY.TXT')
    print('-------------------------------------------------------------------')

    filePatch=                                                                           "\nIn total we have saved:$" + str(totalSavings) + "\nRainy Day:$" + str(savings['Rainy Day']) + "\nCredit Card Debt:$" + str(savings['Credit Card Debt']) + "\nPay off iPhone:$" + str(savings['Pay off iPhone']) + "\nCar:$" + str(savings['Car']) + "\nPS4:$" + str(savings['PS4']) + "\n" + str(timestamp)


    print(filePatch)
    print('-------------------------------------------------------------------')
    print(savings)
    #fw.write(filePatch)
    #fw.close()
filePatch()



def exitString():
    print('Congrats, your on your way to wealth & happiness.\n')

exitString()
def guardiancheck():
    print('\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n-------------------------------------------------------------------')
    print('THIS IS THE OUTLINE OF WHATS SAVED SO FAR')
    file = open("savingstotal.txt")
    handle = open("savingstoday.txt")

    print('-------------------------------------------------------------------')

    for line in handle:
        print('SAVINGSTODAY.TXT:', line)

    print('-------------------------------------------------------------------')

    for line in file:
        print('SAVINGSTOTAL.TXT:', line)

    print('-------------------------------------------------------------------')
guardiancheck()
