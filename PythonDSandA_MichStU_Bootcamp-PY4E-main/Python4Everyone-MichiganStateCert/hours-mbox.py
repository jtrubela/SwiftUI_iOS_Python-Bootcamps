file = 'python3 hours-mbox.py'

name = input("Enter file:")
if len(name) < 1 : name = "mbox-short.txt"
handle = open(name)

timestamps = list()
for line in handle:
    if not line.startswith('From '):
        continue
    else:
        linesSplit = line.split()
        timestamps.append(linesSplit[5])

hourList = list()
for timestamp in timestamps:
    timestamp = timestamp.split(':')
    hour = timestamp[0]
    hourList.append(hour)

hours = {}
for hour in hourList:
    hours[hour] = hours.get(hour, 0) + 1


for k,v in sorted(hours.items()):
    print(k,v)
