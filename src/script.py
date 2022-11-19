# script to remove unwanted stuff from a certain file that has been scraped from
# the web and put in a csv file

def cleanFile(readFile, writeFile, integers):
    read = open(readFile, 'r')
    write = open(writeFile, 'w')
    lines = read.readlines()
    aid = 0

    for line in lines:
        i = 0
        count = 0
        outString  = ""
        aid += 1
        fields = line.split(',')

        equipaCasa = fields[1]
        equipaVisitante = fields[2]
        equipasFile = open("EQUIPA.csv", 'r')
        equipas = equipasFile.readlines()
        idEquipaCasa, idEquipaVisitante = 0,0

        for e in equipas:
            if equipas.index(e) == 0:
                continue

            fields_equipas = e.split(',')
            if fields_equipas[1] == equipaVisitante:
                idEquipaVisitante = fields_equipas[0]
            elif fields_equipas[1] == equipaCasa:
                idEquipaCasa = fields_equipas[0]

        outString = fields[0] + ",1," + str(idEquipaCasa) + ',' + str(idEquipaVisitante) + '\n'
        # step ahead first line 
        if lines.index(line) == 0:
            outString = "idJogo,idEpoca,idEquipaCasa,idEquipaVisitante\n"
            write.write(outString)
            continue
        
        # count = 0
        # outString = ""
        # for i in range(len(fields)):
        #     if i in integers:
        #         #remove "" from integer fields
        #         fields[i] = fields[i][2:len(fields[i])-1]
        
        # # remove last " in line
        # fields[len(fields)-1] = fields[len(fields)-1][:len(fields[len(fields)-1])-1]
        # rejoin fields in a string

        # add a newline
        # outString += '\n'
        # write out to the file
        write.write(outString)


# it is necessary to change the file names and the 
# indexes of the fields that are integers 
# from each file that is going to be cleaned
cleanFile("JOGOEquipaEpocas.csv","JOGOEQUIPAEPOCA.csv",[4])

