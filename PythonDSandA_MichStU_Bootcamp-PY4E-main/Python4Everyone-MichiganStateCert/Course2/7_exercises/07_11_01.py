#Write a program to read through a file and print the contents of the file (line by line) all in upper case

#python shout.property
#Enter a file name: mbox-short.txt
#FROM STEPHEN.MARQUARD@UCT.AC.ZA SAT JAM 5 09:14:16 2008
#RETURN-PATH: <POSTMASTER@COLLAB.SKAIPROJECT.ORG>
#RECIEVED: FROM MURDER (MAIL.UMUCH.EDU [CYRUS V2.3.8])
    #BY FRANKENSTEIN.MAIL.UMUCH.EDU (CYRUS V2.3.8) WITH LMTPA;
    #SAT, 05 JAN 2008 09:14:16 -0500


import os

file = input("Enter a file name:")

if len(file) < 1:
    file = "mbox-short.txt"
    print("length of file was less than 1 character. \nChoosing for you:", file)

handle = open(file)
inp = handle.read()

segment = inp[:256]
segment = segment.upper()
print(segment.strip())
