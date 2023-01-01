# armatest

R package to demonstrate issue in RcppArmadillo with element-wise arma::exp()

May be install with --

devtools::install_github("MurrayEfford/armatest")

Running on Unix --

library(armatest)

armatest(2)   # OK

armatest(1)   # OK

armatest(2)                      # hangs, may be interrupted with ctrl-c

armatest(2, armaexp = FALSE)     # std::exp OK

armatest(2, forkonunix = FALSE)  # OK

armatest(2)                      # hangs, may be interrupted with ctrl-c

