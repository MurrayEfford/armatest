#include "RcppArmadillo.h"
// [[Rcpp::depends(RcppArmadillo)]]

using std::exp;

// [[Rcpp::export]]
arma::mat armatestcpp(const arma::mat &d, bool armaexp) {
    arma::uword N = d.n_rows;
    arma::uword K = d.n_cols;
    arma::mat hik (N,K); 

    if (armaexp) {
        // this should work, but hangs in some cases on Unix with forked workers
        hik = arma::exp(-d);
    }
    else {
        // this works
        arma::uword i,k;
        for (i=0; i<N; i++)
            for (k=0; k<K; k++)
                hik(i,k) = std::exp(-d(i,k));
    }
    
    return(hik);
    
}
