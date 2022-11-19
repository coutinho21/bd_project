# script to remove unwanted stuff from a certain file that has been scraped from
# the web and put in a csv file

def cleanFile(readFile, writeFile, integers):
    read = open(readFile, 'r')
    write = open(writeFile, 'w')
    lines = read.readlines()
    
    for line in lines:
        count = 0
        i = 0
        withoutLinks = ""
        # remove first 2 links that we dont need
        while(count < 2):
            if line[i] == ',':
                count += 1
            i += 1
        withoutLinks = line[i:]

        # step ahead first line 
        if lines.index(line) == 0:
            fields = withoutLinks.split(',')
            fields = fields[:1] + [fields[len(fields)-1][:len(fields[len(fields)-1])-1]] + fields[1:len(fields)-1]
            withoutLinks = ','.join(fields)
            withoutLinks += '\n'
            write.write(withoutLinks)
            continue
        
        count = 0
        # it is necessary to change the indexes of the fields that are integers 
        # from each file that is going to be cleaned
        fields = withoutLinks.split(',')
        outString = ""
        for i in range(len(fields)):
            if i in integers:
                #remove "" from integer fields
                fields[i] = fields[i][1:len(fields[i])-1]
        
        # remove last " in line
        fields[len(fields)-1] = fields[len(fields)-1][:len(fields[len(fields)-1])-1]
        #put classificacao in right place
        fields = fields[:1] + [fields[len(fields)-1]] + fields[1:len(fields)-1]
        # rejoin fields in a string
        outString = ','.join(fields)
        # add a newline
        outString += '\n'
        # write out to the file
        write.write(outString)


cleanFile("equipas.csv","EQUIPA.csv",[1,2,3,4,6])

