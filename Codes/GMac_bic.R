GMac_bic = function(X, kmax){
  
  
  library(mclust)
  
  N           = nrow(X)
  p           = ncol(X)
  GG          = tcrossprod(X, X)/p
  gg_wodiag   = GG - diag(diag(GG))
  GG_new      = cbind(gg_wodiag + diag(colSums(gg_wodiag)/(N - 1)), diag(GG))
  Mclus       = mclust::Mclust(GG_new, modelNames = "VVI", verbose = F, G = 1:kmax)
  delta       = Mclus$classification

   Mdelta     = GG_new
   ## M-delta update
   for (i in 1:N)
   {
      index           = which(delta == delta[i])
      Mdelta[i, i]    = (sum(GG_new[index, i]) - GG_new[i,i]) / (length(index) - 1)
   }
  Gclust            = mclust::Mclust(Mdelta, modelNames = "VVI", verbose = F, G = 1:kmax)
  return(list(class = Gclust$classification, K = Gclust$G, bic = Gclust$BIC))
  
}





