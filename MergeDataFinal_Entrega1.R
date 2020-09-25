library(rio)
#Importar
Linkdemo="https://raw.githubusercontent.com/AlonsoAbarca/Pruebas/master/Democraciafinal.csv"
democracia=import(Linkdemo)

Linkrique="https://raw.githubusercontent.com/Alisson2406/Trabajo-final-de-estadistica/master/Riqueza.csv"
riqueza=import(Linkrique)

Linkurb="https://github.com/fiorelabarbaran/Trabajo/raw/master/urbano.csv"
urban=import(Linkurb)

LinkEduca="https://raw.githubusercontent.com/Giancarlo-Ramirez/Estad-stica-2---Teor-a/master/EducacionFinal.csv"
educa=import(LinkEduca)
#MergeFinal
datafinal=merge(democracia,educa)
datafinal=merge(datafinal,riqueza)
datafinal=merge(datafinal,urban)
