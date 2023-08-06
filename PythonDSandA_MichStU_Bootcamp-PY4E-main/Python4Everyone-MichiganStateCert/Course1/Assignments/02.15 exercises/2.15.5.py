#Write a program which prompts the user for a Celcius temperature
#convert the temperature to Fahrenheit
                                            #formula = (°F − 32) × 5/9 = °C
#and print out the converted temperature


#Choose a conversion
def choice_Prompt_Choice():
    choicePrompt = input("What kind of temperature would you like to convert? \n(type f for fahrenheit OR c for celcius):")
    choice = choicePrompt
    try:
        if choice == 'c':
            def celcius2Fahrenheit():
                    c_User_Num = input("Enter Celcius temperature to be converted to Fahrenheit:")
                    try:
                       cTemp = int(c_User_Num)
                    except:
                       print("This is an invalid input.")
                       return celcius2Fahrenheit()
                    #formula = (°C × 9/5) + 32 = °F
                    fTemp = (cTemp * (9/5)) + 32
                    print(cTemp, "degrees Celcius is equal to", fTemp, "degrees Fahrentheit.")

            celcius2Fahrenheit()

        elif choice == 'f':
            def fahrenheit2Celcius():
                    f_User_Num = input("Enter Celcius temperature to be converted to Fahrenheit:")
                    try:
                        fTemp = int(f_User_Num)
                    except:
                        print("This is an invalid input.")
                        return fahrenheit2Celcius()
                    #formula = (°F − 32) × 5/9 = °C
                    cTemp = (fTemp - 32) * 5/9
                    print(fTemp, "degrees Fahrentheit is equal to", cTemp, "degrees Celcius.")
            fahrenheit2Celcius()
        else:
            print("This is an invalid input.\nTry again.")
            return choice_Prompt_Choice()
    except:
        print("This is an invalid input.\nTry again.")
        return choice_Prompt_Choice()
choice_Prompt_Choice()


