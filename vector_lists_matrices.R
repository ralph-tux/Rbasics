# Codes from "Introductory Statistics with R. Authors: Dalgaard, Peter."
#sorry for typos

###INSTALAR PACOTES#########################



install.packages("ISwR")
install.packages("drc", dep=T, repos="http://cran.fiocruz.br/")
install.packages("ISwR")                                        # livro Dalagaard




###CARREGAR  E ANALISAR PACOTES#############


getwd()                                                  # devolve o endereço do diretório em uso
dir()                                                    # devolve arquivos e pastas de diretório em uso
setwd("pasta")                                           # altera a pasta em uso. Substituir o nome "pasta" pelo nome da pasta desejado                                   
library(ISwR)
ls("package:ISwR")                                       # lista dados e funções contidas no pacote
lsf.str("package:dplyr")
args(plot.default)                                       # mostra os argumentos default de uma função
search()                                                 # devolve os pacotes carregados. A ordem mostrada dos pacotes, representa a ordem onde o R buscará primeiro uma função ou um pacote pedido
vignette(package = "sf")                        # see which vignettes are available
vignette("sf1")                                        # an introduction to the package




###CARREGAR DADOS########################




read.table(                                              # função para leitura de um arquivo externo 
arquivo.txt,                                             # nome do arquivo no diretório ativo. Pode ser "clipboard".Caso queira escolher o diretório por navegação no windows, usar "file.choose()"no lugar de arquivo. Para ler csv, digite o nome do arquivo seguido de .csv.  txt...
header=FALSE,                                            # argumento lógico que indica se o arquivo tem ou não nome das variáveis na primeira linha. Default= FALSE
sep=" ",                                                 # é o caractere que separa os valores em cada linha. " " corresponde a espaçõem branco, ";" ponto e vírgula etc...
dec = ".",                                               # é o caractere que corresponde ao separador decimal. Default="."
row.names,                                               # é vector com os nomes das linhas, caso header=FALSE. Default= V1, V2, V3...
col.names,                                               # é vector com os nomes das colunas. Default= V1, V2, V3...
as.is = FALSE,                                           # é uma variável lógica que controla a conversão das variáveis alfanuméricas em factores (objectos do R para variáveis qualitativas  vectores de categorias). Se o seu valor é TRUE a leitura mantém o tipo original dos dados
na.strings = "NA")                                       # é o valor usado para os dados desconhecidos no arquivo e que será convertido em NA

#Variações de leitura

read.csv("filename")                                    # Comma-separated
read.delim("filename")                                  # Tab-delimited
read.csv2("filename")                                   # Semicolon-separated, comma decimal point
read.delim2("filename")                                 # Tab-delimited, comma decimal point


###CRIAR UM ARQUIVO######################




write.table(                                             # função para criação de um arquivo
x,                                                       # nome do objeto a ser gravado
file="",                                                 # nome do arquivo a ser criado. colocar .csv ou .txt no final
quote=TRUE,                                              # é uma variável lógica que indica se as variáveis alfanuméricas são ou não escritas entre aspas
sep=" ",                                                 # é o caractere que separa os valores em cada linha. " " corresponde a espaçõem branco, ";" ponto e vírgula etc...Default= ""
na="NA",                                                 # é a representação no arquivo dos NAs de x
dec=".",                                                 # é o caractere que corresponde ao separador decimal. Default="."
row.names=TRUE,                                          # variável lógica que indica se o arquivo vai ou não conter os nomes das linhas de x, ou são vectores alfanuméricos com os nomes a atribuir às linhas no arquivo
col.names=TRUE)                                          # # variável lógica que indica se o arquivo vai ou não conter os nomes das linhas de x, ou são vectores alfanuméricos com os nomes a atribuir às linhas no arquivo




###OBJETOS###############################


                                                         # objetos pedem ser vetores, matrizes, listas data frames e funções

h<- 7*(8-3.4)
h
4*9+1/5 ->u                                              # a determinação de um objeto não necessariamente deve ficar à esquerda 
u
rm(h)                                                    # exclui um objeto
rm(list=ls())                                            # exclui todos os objetos      
ls.str()                                                 # mostra informações sobre objetos
mode(h)                                                  # tipos de elementos do objeto
length(h)                                                # números de elementos do objeto
ls()                                                     # lista os objetos ativos no workspace

                                                         


###EXEMPLOS DE CÁLCULOS##################




weight <- c(60, 72, 57, 90, 95, 72)                      # weight -> objeto e (60, 72..) dados vetores
weight
height <- c(1.75, 1.80, 1.65, 1.90, 1.74, 1.91)          # note que do mesmo tamanho que weight
bmi <- weight/height^2
bmi

#cálculo de desvio padrão sem uso de funções
sum(weight)
sum (weight)/length(weight)#neste caso "length"é o comprimento do vetor "weight" 
xbar <- sum(weight)/length(weight) #média
weight - xbar #neste caso, xbar tem comprimento 1 e foi reciclado e subtraído de cada elemento de "weight"
(weight - xbar)^2
sum((weight - xbar)^2)
sqrt(sum((weight - xbar)^2)/(length(weight) - 1))#desvio padrão
t.test(bmi, mu=22.5) #testar se a média de bmi é 22.5
plot(height, weight, pch=4)
hh <- c(1.65, 1.70, 1.75, 1.80, 1.85, 1.90)
lines(hh, 22.5 * hh^2)# a função "lines" adiciona valores de x e y combinados por uma linha em um gráfico já existente




rm(list=ls())                                       # remover todos os objetos após o uso


###VETORES###############################




c("Huey","Dewey","Louie")                 # vetores de caracteres 
c(T,T,F,T)                                # vetores lógicos
x<- c(1,2,3,4,5,6)                        # vetores numéricos


c("Huey","Dewey","Louie")                 # vetor de caracteres. As aspas servem para o sistema saber que se trata de uma "string"e não do nome de uma variável
cat(c("Huey","Dewey","Louie"))            # a função cat permite saída dos strings sem aspas
cat("Huey","Dewey","Louie", "\n")         # obter o prompt de comando na linha seguinte. \n é um escape de sequencia. \ é caractere de escape.
cat("What is \"R\"?\n")                   # o "\" eliminou a necessidade de continuar a sequencia, permitindo a formação da frase.
c(42,57,12,39,1,3,4)                      # criação de vetores explicitando cada

seq(4,9)                                  # função seq> usado para série de números equidistantes

seq(4,10,2)                               # para sequencia  de 2 em 2 até o número desejado.
seq(1.65,1.90,0.05)                       # o mesmo, porém os saltos são de 0.05
4:9                                       # quando os intervalos forem de 1, pode usar o ":". 4:9=seq(4,9)
seq(length=9, from=-5, by=0.5)

1:15                                      # define o vector c(1,2,...,14,15), ou pode usar seq(to=15,from=1)
15:1                                      # define o vector c(15,14,...,2,1)
2*1:15                                    # define o vector c(2,4,...,28,30)
(2*1):15                                  # define o vector c(2,3,...,14,15)


oops <- c(7,9,13)
rep(oops,3)                               # repetir "oops" 3 vezes
rep(oops,1:3)                             # repetir o 7 uma vez, o 9 duas vezes e 13 três vezes
rep(1:3,2)                                # define o vector c(1,2,3,1,2,3)
rep(1:2,c(10,15))                         # exemplo em código de grupos: os dez primeiros são homens (1) e os quinze últimos são mulheres (2)
rep(1:2,each=10)                          # quando número de réplicas forem iguais, pode-se usar o argumento "each". rep(1:2,each=10) = rep(1:2,c(10,10))




###CONSULTA NOS VETORES##################




x[5]                            # seleção do quinto elemento de x
ind<-c(1,3,5)             
x[ind]                          # devolve o primeiro, terceiro e quinto elementos de x
x[-ind]                         # devolve os elementos que não estão nas posições indicadas por ind
x[c(1,3,5)]                     # devolve os elementos indicados
x[x>3]                          # devolve os valores de x> 3
x[x>3 & x<10]                   # devolve os valores de x> 3 e <10
length(x)                       # devolve o número de elementos do vector
sum(x)                          # devolve a soma dos elementos do vector x
prod(x)                         # devolve o produto dos elementos do vector x
cumsum(x)                       # devolve um vector cujos elementos são a soma acumulada dos elementos do vector x
cumprod(x)                      # devolve um vector cujos elementos são o produto acumulado dos elementos do vector x
sort(x)                         # devolve um vector com os elementos do vector x ordenados por ordem crescente
choose(n,k)                     # devolve a combinação Cnk
names(x)                        # extrai nomes de "x"



###EDIÇÃO DE VETORES#####################




x <- c(1, 2, 3)
y <- c(10, 20) 
N<- c(x, y, 5)                  # concatenar vetores de mais de um elemento
N



x <- c(red="Huey", 
blue="Dewey", 
green="Louie")                  # atribuir nomes aos elementos

c(FALSE, 3)
c(pi, "abc")
c(FALSE, "abc")                 # concatenar vetores de tipos diferentes converte eles para o tipo restritivo. exemplo: False ficou 0 e pi ficou 3.14. No caso de "abc", não foi possível essa conversão

log(x)                          # Quando o argumento é o vector x, as funções log, exp, sin, cos, tan, atan, sqrt, abs devolvem o vector em que cada elemento é o resultado de aplicar a função ao elemento homólogo de x

notas <- c(1,2,0.75,0.5,
1.75,1,0.75,1,0.5)
teste <- c("I1","I2","Iac",
"II1","II2","IIac", "III1",
"III2","IIIac")
teste[notas>1]                   # devolve os strings de teste que correspondem às notas maiores que 1



###CARREGAR OBJETOS PARA OS EXEMPLOS################


b<-c(1,0,0)
d<-c(1,0)
f<- c(1,6,5,8,6)
g=13

A <- c(3,2,-4,0,-1,8)
dim(A) <- c(3,2)

E<- c(0,-8,8,0)
dim(E)<- c(2,2)

P<- c(21,65,82,70,63,41,25,83,34)
dim(P)<- c(3,3)

B<- matrix(25:36, nrow=3, byrow=F)

j<- matrix(1:12, nrow=3, byrow=T)
k<- matrix(13:24, nrow=3, byrow=T)
M<- matrix(1:12, nrow=3, byrow=T)

C<-matrix(1:6,2,3)

(H <- P %*% P)


###CRIAÇÃO DE MATRIZES#############################



M<- matrix(1:12,3,4)                         # cria uma matriz com vetor de valores 1 a 12, 3 linhas e 4 colunas, elementos dispostor por colunas.
M
M<- matrix(1:12, nrow=3, byrow=T)            # outra forma de escrever M. byrow=T faz com que os elementos sejam dispostos por linha.
M

A <- c(3,2,-4,0,-1,8)
dim(A) <- c(3,2)                             # a função dim dimensiona o vetor A para que seja uma matriz 3x2 


x<- matrix(c(1,2,3),3,1)                     # vetor coluna 3x1
w<- matrix(c(2,5,7),1,3)                     # vetor linha 1x3
A<- matrix(c(1,2,3,4,5,6),3,2)               # matriz 3x2
B<- matrix(c(1,2,3,4,5,6),2,3)               # matriz 2x3

M<- 1:12
dim(M)<- c(3,4)                              # transforma M numa matriz com 3 linhas e 2 colunas
M

z<- 1:1500
dim(z) <- c(3,5, 100)                        # o conjunto de 1500 vetores foi tratado numa matriz 3 por 5 em 100 matrizes
z

vv <-matrix(seq(1,5),5,1)                    #matriz 5x1 com sequência de 1 a 5

cbind(A=1:4, B=5:8, C=9:12)                  #cbind e rbind "cola" os vetores horizontalmente (coluna a coluna) e verticalmente (linha a linha), respectivamente, gerando uma matriz
rbind(A=1:4, B=5:8, C=9:12)                            

u <- 1:3
v <- 4:6
V <- rbind(u,v)
V

ident.10 <-diag(rep(1,10))                   #criação de uma matriz identidade 10x10




###CONSULTAS NA MATRIZ######################



isSymmetric(P)                              # verificar se P é simétrica
t(E)==-E                                    # verifica se E é anti-simétrica. Para isso, todos os valores lógicos devem ser TRUE. Ver que para P ocorre FALSE (ou seja, não é anti-simétrica)

dim(M)                                      # ver a dimensão de M
nrow(M)                                     # número de linhas de M
ncol(M)                                     # número de colunas de M
length(M)                                   # número de elementos  de M


M[3,1]                                      # é o elemento de M que está na linha 3 e na coluna 1
M[3,]                                       # é a linha 3 da matriz M. Estes objetos são do tipo vector. O mesmo vale para colunas Ex. M[,1]
M
M[c(1,3),2]                                 # selecionar os elementos das linhas 1 e 3 da coluna 2
M[2:3,]                                     # mostra matriz com 2ª e 3ª linhas de M
M[2:3,c(1,3,4)]                             # Quando a seleção é de mais de uma linha e uma coluna, o resultado é uma submatriz. Aqui, foram selecionados os elementos das linhas 2 e 3 nas colunas 1,3 e 4. 

x <- array(1:20, dim=c(4,5))                # criação de uma matriz 4x5
x
i<- array(c(1:3,3:1), dim=c(3,2))           # i é uma matriz 3x2 indexada
i
x[i]                                        # obter de x os elementos dos índices [1,3], [2,2] and [3,1] (a matriz i é composta por esses esses índices)

Ac1 <-A[,1]                                 # Ac1 é vetor coluna igual a 1ª. Coluna de A
Ac1
Ac1 <-matrix(A[,1])                         # faz o mesmo




###VARIANTES DAS MATRIZES########################



isSymmetric(P)  # testa se a matriz P é simétrica
diag(5)         # devolve uma matriz identidade de ordem 5
diag(H)         # se H é escalar, é criada uma matriz identidade HxH
diag(f)         # cria uma matriz na qual os elementos de f ficam na diagonal principal (note que f é vetor)
diag(M)         # devolve um vetor contendo elementos da diagonal principal de M
t(M)            # devolve a transposta da matriz M
solve(P)        # devolve a inversa da matriz (quadrada) P
solve(P,b)      # devolve a solução do(s) sistema(s) Px=b; em que P é uma matriz quadrada e b pode ser um vector ou uma matriz;
det(P)          # devolve o determinante da matriz (quadrada) P
-M              # devolve a matriz oposta de M



###EDIÇÃO DE MATRIZES######################



as.vector(M)                           # transforma matriz em vetor
M
rownames(M)<-LETTERS[1:3]              # colocar letras como nomes das linhas. LETTERS é construída # em variáveis que contém letras maiúsculas A-Z. Vetores úteis similares similares são letters, month.name e month.abb
M
M[1,1]<-0                              # trocar o elemento do índice [1,1] por 0
M

x <- array(1:20, dim=c(4,5))           # criação de uma matriz 4x5
x
i<- array(c(1:3,3:1), dim=c(3,2))      # i é uma matriz 3x2 indexada
i
x[i]<-0                                # trocar os elementos dos índices X[1,3], X[2,2] e X[3,1] por 0 (correspondem às três linhas de i)
x




###OPERAÇÕES COM MATRIZES############


                                       

B*M                                    # esta operação não é a habitual multiplicação de matrizes definida em Álgebra Linear
C%*%B                                  # produto internode C por B. Como c é do tipo 2x3 e B é do tipo 3x4, criou uma matriz 2x4
C%*%b                                  # o vector b é transformado numa matriz 3x1
d%*%C                                  # o vector b é transformado numa matrix 1x3
t(A)%*%A                               # multiplicação transposta de A por A
g*A                                    # produto de um número (g) pela matriz A
k+M                                    # adição de K + M
M+(-M)                                 # obter matriz nula a partir da soma de M e sua oposta
A%o%B                                  # obter produto externo
crossprod(A,B)                         # obter A'B (inversa de A multiplicada por B)
crossprod(A)                           # obter A'A (inversa de multiplicada por A)
rowMeans(M)                            # devolve um vetor com as médias das linhas de M
colMeans(M)                            # devolve um vetor com as médias das colunas de M
rowSums(M)                             # devolve um vetor com a soma das linhas de M
colSums(M)                             # devolve um vetor com a soma das colunas de M



###FATORES##############




         
                                           # Vari?vel eplicat?ria (explanatory). (conjunto de n?veis- set of levels) subdivis?es de dados, que podem ser n?m?ricos. Ex. machos (1) f?meas (2)

pain <- c(0,3,2,2,1)                                # cria??o do vetor num?rico "dor", codificando os n?veis de dor de 5 pacientes
fpain <- factor(pain,levels=0:3)                    # tratar fpain como uma vari?vel categ?rica. Assim, cria-se o fator fpain com a fun??o factor
fpain
levels(fpain) <- c("none",
"mild",
"medium",
"severe")                                           # categorizar os n?veis de fpain
fpain
as.numeric(fpain)                                   # esta fun??o extrai a codifica??o de fpain e devolve em codifica??o num?rica em n?veis de 1-4. A representa??o interna do R sempre usa fatores a partir de 1
levels(fpain)                                       # devolve os n?veis de fpain
ordered(fpain)                                      # ordena os n?veis como vari?vel ordinal. Por default, o R trata os n?veis como se fossem equidistantes.
pain




###LISTAS#######################################




intake.pre <- c(5260,5470,5640,6180,6390,
+ 6515,6805,7515,7515,8230,8770)

intake.post <- c(3910,4220,3885,5160,5645,
+ 4680,5265,5975,6790,6900,7335)

mylist <- list(before=intake.pre,
after=intake.post)                                  # combinar os indiv?duos em uma lista nomeada com "before"e "after"
mylist
mylist$before                                       # extrai componentes espec?ficos. para after, pode usar mylist[2]
mylist[2]
mylist[2:3]




