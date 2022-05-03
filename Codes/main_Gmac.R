######   main function ###### 
#######  author: Shahina Rahman ######
#######  Example done with "Alizadeh1.csv"

rm(list = ls())

#install package "mclust" and "infotheo" before running the code. 
library(mclust)
library(infotheo)
source("GMac_bic.R")
source("AMI.R")


folder      = "/Users/srahman/Desktop/paper/RJClust/desktop_codes/Microarray-data/"
data_files  = list.files(path = folder, pattern = "*.csv")

for (i in 1:length(data_files)) # 
{
  Data        = read.csv(paste(folder, data_files[i], sep = ''))
  X           = as.matrix(Data[, c(-1, -ncol(Data))])
  truth       = as.matrix(Data[, ncol(Data)])
   Res        = GMac_bic(X, kmax = 20)
   K.hat      = Res$K
   AMI        = f_rez(Res$class, truth)$ami
   print(c(data_files[i], paste("AMI =", round(AMI,4)), paste("K_hat =", K.hat), paste("K_true =", length(unique(truth))))) 
   #print(table(truth, Res$class))

}
