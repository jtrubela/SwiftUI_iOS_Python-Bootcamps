#501 Dart Score Averages
import os
time_Completed = input("Enter time: ")

number_of_Darts = int(input("Enter number of darts used: "))
checkout = int(input("Enter number of checkout(enter 0 for L): "))
outAttempts = int(input("Enter out attempts: "))

three_Dart_Avg = float(input("Enter 3 dart average number: "))
one_Dart_Avg = float(input("Enter 1 dart average number: "))


numRounds = int(input("Enter number of rounds: "))
sixtyTO100 = int(input("Enter number of scores 60+ to 99: "))
tonTO140 = int(input("Enter number of scores 100+ to 139: "))
tonfortyTO180 = int(input("Enter number of scores 140+ to 179: "))
ton80 = int(input("Enter number of 180's tallied this match: "))

fhandle = open("dartStats.txt", "a+")
fhandle.write("\n\nTime completed: " + str(time_Completed) + "\nNumber of darts used: " + str(number_of_Darts) + "\nCheckout: " + str(checkout) + "\nNumber of out attempts: " + str(outAttempts) + "\n3 dart average number: " + str(three_Dart_Avg) + "\n1 dart average: " + str(one_Dart_Avg) + "\nNumber of rounds: " + str(numRounds) + "\nNumber of scores 60+ to 99: " + str(sixtyTO100) + "\nNumber of scores 100+ to 139: " + str(tonTO140) + "\nNumber of scores 140+ to 179: " +str(tonfortyTO180) + "\nNumber of 180's tallied this match: " + str(ton80))
