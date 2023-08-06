#4.6 Write a program to prompt the user for hours and rate per hour using input to compute gross pay.
#Put the logic to do the computation of pay in a function called computepay() and use the function to do the computation.

#Use 45 hours and a rate of 10.50 per hour to test the program (the pay should be 498.75).
def computepay(h,r):
	return 42.37
p = computepay(10,20)

#ASK THE USER HOW MANY HOURS THEY WORKED
hrs = input('Enter Hours: ')
p = input('Enter Rate Per Hour: ')

try:
	pRate = float(pInp)
	h = float(hrs)
except:
	print('Error, please enter numeric input')
	quit()
	
#IF STATEMENT DETERMINING HOW MUCH TO PAY/HOUR
if h > 40 :                       #if hours exceed 40
	otHrs = h - 40                #determine overtime hours
#pay total = (10.50 * 40) + (1.5    * otHrs *  10.5)
	pTotal = (pRate * 40) + (1.5 * otHrs * pRate)
#PRINT PAY TOTAL
	p = pTotal
	print('pay',p)
	
#IF THERE ARE 40 OR LESS HOURS
else:
#pay total = 10.5  * hours
	pTotal = pRate * h
#PRINT PAY TOTAL
	print(pTotal)
	
	quit()

