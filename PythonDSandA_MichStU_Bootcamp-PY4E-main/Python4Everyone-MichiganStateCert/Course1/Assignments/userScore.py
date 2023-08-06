#3.3 Write a program to prompt for a score between 0.0 and 1.0. 
score = input('Enter Score:')
x = float(score)
#print a grade using the following table:
#Score Grade
#A >= 0.9, B >= 0.8, C >= 0.7, D >= 0.6, F < 0.6
if x >= 0.9:
	print('A')
elif x >= 0.8:
	print('B')
elif x >= 0.7:
	print('C')
elif x >= 0.6:
	print('D')
elif x <= 0.6:
	print('E')
elif x > 1:
        print('choose a decimal number')
#If the score is out of range, print an error. 
else :
	print('Error: score entered is out of range')

#If the user enters a value out of range, print a suitable error message and exit. For the test, enter a score of 0.85.
