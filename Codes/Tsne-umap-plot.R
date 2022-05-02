## T-SNE visualization plot 

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
#BiocManager::install("M3C")
library(M3C)
library(ggplot2)
library(gridExtra)
source("Mvec.R")

Data   = read.csv("Arm1.csv")
X      = as.matrix(Data[, c(-1, -ncol(Data))]);
class  = c(rep("ALL",24), rep("MLL",20), rep("AML",28))




##You need to use identical name and labels values for both shape and color scale.

set.seed(100)
p1 <- tsne(t(X), seed = 10, perplex = 3, dotsize = 0.1, labels = as.factor(class), legendtitle = "Ground truth") + #, text = as.factor(class), textlabelsize = 2) + 
  geom_point(aes(shape = as.factor(class), color = as.factor(class)), size = 3) +
  scale_shape_manual(name = "Ground truth", labels = as.factor(class), values = c(8, 16, 17)) + 
  scale_color_manual(name = "Ground truth", labels = as.factor(class), values = c('black', '#E69F00', '#56B4E9')) + 
  theme(legend.position = "bottom") + labs(title = "Clusters in original features", x = "tSNE1", y = "tSNE2 ")  +
  theme(plot.title = element_text(face = "bold"), axis.title = element_text(face = "bold", size = 8), 
        axis.text.x = element_text(size = 10), axis.text.y = element_text(size = 10),
        axis.title.x = element_text(size = 10), axis.title.y = element_text(size = 10)) 


p2 <- tsne(t(Mvec(X)), seed = 10, perplex = 3, dotsize = 0.1, labels = as.factor(class), legendtitle = "truth") + #, text = as.factor(class), textlabelsize = 2) + 
  geom_point(aes(shape = as.factor(class), color = as.factor(class)), size = 3) +
  scale_shape_manual(values = c(8, 16, 17)) + 
  scale_color_manual(values = c('black', '#E69F00', '#56B4E9')) + 
  theme(legend.position = "none") + labs(title = "Clusters in m-vectors", x = "tSNE1", y = "tSNE2 ")  +
  theme(plot.title = element_text(face = "bold"), axis.title = element_text(face = "bold", size = 8), 
        axis.text.x = element_text(size = 10), axis.text.y = element_text(size = 10), 
        axis.title.x = element_text(size = 10), axis.title.y = element_text(size = 10)) 

p5 <- umap(t(X), legendtitle = "truth", dotsize = 0.1, labels = as.factor(class)) + #, text = as.factor(class), textlabelsize = 2) + 
  geom_point(aes(shape = as.factor(class), color = as.factor(class)), size = 3) +
  scale_shape_manual(values = c(8, 16, 17)) + 
  scale_color_manual(values = c('black', '#E69F00', '#56B4E9')) + 
  theme(legend.position = "none") + labs(title = "", x = "UMAP1", y = "UMAP2 ")  +
  theme(plot.title = element_text(face = "bold"), axis.title = element_text(face = "bold"), axis.text.x = element_text(size = 10), axis.text.y = element_text(size = 10), axis.title.x = element_text(size = 10), axis.title.y = element_text(size = 10)) 


p6 <- umap(t(Mvec(X)), dotsize = 0.1, legendtitle = "Gclusters", labels = as.factor(class)) + #,text = as.factor(class), textlabelsize = 2) +
  geom_point(aes(shape = as.factor(class), color = as.factor(class)), size = 3) +
  scale_shape_manual(values = c(8, 16, 17)) + 
  scale_color_manual(values = c('black', '#E69F00', '#56B4E9')) + 
  theme(legend.position = "none") + labs(title = "", x = "UMAP1", y = "UMAP2 ")  +
  theme(plot.title = element_text(face = "bold"), axis.title = element_text(face = "bold"), axis.text.x = element_text(size = 10), axis.text.y = element_text(size = 10), axis.title.x = element_text(size = 10), axis.title.y = element_text(size = 10)) 


g_legend <- function(a.gplot){
  tmp    <- ggplot_gtable(ggplot_build(a.gplot))
  leg    <- which(sapply(tmp$grobs, function(x) x$name) == "guide-box")
  legend <- tmp$grobs[[leg]]
  return(legend)}
mylegend <- g_legend(p1)


gridExtra::grid.arrange(arrangeGrob(p1 + theme(legend.position = "none"),
                                    p2 + theme(legend.position = "none"), 
                                    p5 + theme(legend.position = "none"),
                                    p6 + theme(legend.position = "none"),
                                    nrow = 2), mylegend, nrow = 2, heights = c(14, 1))




