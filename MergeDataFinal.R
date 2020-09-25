#MergeFinalData
LinkUrbano="https://github.com/fiorelabarbaran/Trabajo/raw/master/urbano.csv"
Urbano=import(LinkUrbano)

LinkRiqueza="https://raw.githubusercontent.com/Alisson2406/Trabajo-final-de-estadistica/master/Riqueza.csv"
Riqueza=import(LinkRiqueza)

DataFinal=merge(democraciafinal,Riqueza)
DataFinal=merge(Prueba1,Urbano)

LinkEducacion="https://raw.githubusercontent.com/Giancarlo-Ramirez/Estad-stica-2---Teor-a/master/EducacionFinal.csv"
Educacion=import(LinkEducacion)

