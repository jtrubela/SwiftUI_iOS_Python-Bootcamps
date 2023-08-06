#exercise 5.10.1
#write a program which:
#repeadedly asks for numbers
#enters a list
#and reads the lists numbers until the user enters "done".
#Once "done" is entered, print out:
    #total       =    
    #count       =    
    #average     =    
    #maximum     =    
    #minimum     =                   of the numbers.

#if the user enters anything other than a number, detect their mistake using a 
#try and except and print an error message
#and skip to the next number



#count of Numbers in the List                           #len()
#sum of Numbers in the List                             #sum()
#average of Numbers in the List                         #sum()/len()
#max value of Numbers in the List                       #max()
#minimum value of Numbers in the List                   #min()




list1 = []                                              

while True:
    inpNum2List = input("enter a number to the list:")
    try:
        num = int(inpNum2List)
        list1.append(num)
  
    except:
        if inpNum2List == "done": break
        else: print("Invalid input")


print('Count of numbers in the list is: ', len(list1))
print('Sum of the numbers in the list is: ', sum(list1))
print('Average of all the numbers in the list is: ', (sum(list1)/len(list1)))
print('Maximum value of all the numbers in the list is: ', max(list1))
print('Minimum value of numbers in the list is: ', min(list1))

