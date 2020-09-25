#Importando
library(rio)
Linkdemo="https://raw.githubusercontent.com/AlonsoAbarca/Pruebas/master/demo.csv"
democracia=import(Linkdemo)
#Eliminando columnas
democracia[,c(1,9)] = NULL
#Borrando espacios
democracia$País=trimws(democracia$País,whitespace = "[\\h\\v]")
#Convertir numéricas 
democracia[,c(2:7)]=lapply(democracia[,c(2:7)],as.numeric)
#Importando 2
Linkpaises="https://raw.githubusercontent.com/AlonsoAbarca/Pruebas/master/paises.csv"
paises=import(Linkpaises)
#Eliminando columnas y cambiando nombre
paises[,c(1,3,4,6,7,8)] = NULL
names(paises)=c("País","Continente")
#Merge Región+democracia
democraciafinal=merge(democracia,paises,by.x='País', by.y='País')
write.csv(democracia,"Democraciafinal.csv", row.names = F)

#MergeFinalData
LinkUrbano="https://github.com/fiorelabarbaran/Trabajo/raw/master/urbano.csv"
Urbano=import(LinkUrbano)

LinkRiqueza="https://raw.githubusercontent.com/Alisson2406/Trabajo-final-de-estadistica/master/Riqueza.csv"
Riqueza=import(LinkRiqueza)

DataFinal=merge(democraciafinal,Riqueza)
DataFinal=merge(democraciafinal,Urbano)

LinkEducacion="https://raw.githubusercontent.com/Giancarlo-Ramirez/Estad-stica-2---Teor-a/master/EducacionFinal.csv"
Educacion=import(LinkEducacion)

write.csv(DataFinal,"Datafinal.csv", row.names = F)
