#importar
library(rio)
Link="https://raw.githubusercontent.com/AlonsoAbarca/TrabajoFinal_Estadistica2/master/datafinalav5.csv"
datafinal=import(Link)
datafinal$`Años Obligatorios de Educacion`=as.numeric(datafinal$`Años Obligatorios de Educacion`)
#data operacionable
dataop=datafinal
dataop$País=NULL


#EFA
#paso 1: crear gráfico de matríz de correlación
library(polycor)
library(ggcorrplot)
corMatrix=polycor::hetcor(dataop)$correlations
ggcorrplot(corMatrix,
           p.mat = cor_pmat(corMatrix),
           insig = "blank")
psych::KMO(corMatrix) 

#paso2: pruebas 
#prueba de matriz identidad
cortest.bartlett(corMatrix,n=nrow(dataop))$p.value>0.05
library(matrixcalc)
#prueba de matriz singular
is.singular.matrix(corMatrix)

#paso3: análisis factorial
#redimensionar factores
fa.parallel(dataop,fm = 'ML', fa = 'fa')
resfa <- fa(dataop,nfactors = 3,cor = 'mixed',rotate = "varimax",fm="minres")
fa.diagram(resfa)
#creando dataframe de resultados
dataopfa<-as.data.frame(resfa$scores)
#revisar factorización
print(resfa$loadings)
print(resfa$loadings,cutoff = 0.5)#con corte al 0.5

#Evaluación de resultado
#Raíz del error cuadrático medio
resfa$crms
#Indice de Tucker Lewis
resfa$TLI
#Qué variables aportan más al modelo
sort(resfa$communality)


