Mvec = function(Z){
   # input :  original feature matrix with dimension N by P
   # output:  M matrix with dimensiona N by N+1. Rows of this matrix are m-vectors.

p   = ncol(Z)
n   = nrow(Z)
GG  = tcrossprod(Z, Z)/p
gg  = GG 
gg_wodiag       = gg - diag(diag(gg))
gg_wdiag        = cbind(gg_wodiag, diag(gg))
GG_new          = cbind(gg_wodiag + diag(colSums(gg_wodiag)/(n - 1)), diag(gg))

return(GG_new)
}