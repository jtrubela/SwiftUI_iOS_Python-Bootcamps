#Write a function called chop that takes a list and modifies it, removing the first and last elements, and returns None
#Then write a function called middle that takes a list and returns a new list that contains all but the first and last elements.

li = ['A', 'B', 'C', 'D', 'E', 'F']

print(li)

def chop():
    def delete_head():
        del li[0]
        return None
    def delete_end():
        del li[-1]
        return None
    delete_head()
    delete_end()
chop()

print(li)
