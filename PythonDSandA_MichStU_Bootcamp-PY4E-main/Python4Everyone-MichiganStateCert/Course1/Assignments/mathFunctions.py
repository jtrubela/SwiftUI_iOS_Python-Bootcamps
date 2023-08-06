import math
import random

#Math

#Check if one number is divisible by another
def divisionCheck():
    userNumX = input('Enter a number: -->')
    userNumY = input('Enter a number to see if it is divisible by the first: -->')

    try:
        x = int(userNumX)
        y = int(userNumY)
    except:
        print('not a valid integer')
        quit()
    

    x % y
    quotient = (x / y)
    remainder = (x % y)
    
    if x % y == 0:
        print('===============================================================')
        print('''                  ''',x, 'is divisible by ',y, ' and equals', int(quotient))
        print('''                                                                 
                   ''', x,'''                                       
                  *******     =''',int(quotient),'remainder of ', remainder,'            ')
        print('''                   ''', y,'                                       ')
        print('\n         The remainder of ', x,' divided by ', y, 'is 0                     ')
        print('===============================================================')
        
    else:
        print('Number x:', x,'is not divisible by number y:', y)
        print('The remainder to ', x,' divided by ', y, 'does not equal 0')
        

divisionCheck()

