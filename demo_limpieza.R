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
names(paises)=c("País","Continente")
paises[,c(1,3,4,6,7,8)] = NULL
#Merge Región+democracia
democraciafinal=merge(democracia,paises,by.x='País', by.y='País')

write.csv(democracia,"Democraciafinal.csv", row.names = F)
