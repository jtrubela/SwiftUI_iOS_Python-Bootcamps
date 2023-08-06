

credit = {'Merrick Bank': 35, 'Capital One Bank': 25, 'Credit One Bank': 44, 'Premier Bank': 76}
bills = {'Coursera': 49, 'Juul Pods': 50, 'MSU Tuition': 200, 'Phone Bill': 100, 'iCloud': .99}
groceries = {'Hello Fresh': 160}


totalPerMonth = sum(credit.values()) + sum(bills.values()) + sum(groceries.values())

line = '\n-----------------------------------------------------------------------------------------'



print(line, "\n\t\t\t\tMINIMUM CREDIT CARD PAYMENTS PER MONTH", line,"\n", credit)
print(line)
print("\t\t\t\tOTHER BILLS PAYMENTS PER MONTH", line,"\n", bills)
print(line)
print("\t\t\t\tGROCERIES PAYMENTS PER MONTH", line,"\n", groceries)
print(line)

print("\n\n\t\tYour monthly amount needed for your bills is $", totalPerMonth, "\n")
