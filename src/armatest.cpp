#include "RcppArmadillo.h"
// [[Rcpp::depends(RcppArmadillo)]]

using std::exp;

// [[Rcpp::export]]
arma::mat armatestcpp(const arma::mat &d, const arma::mat &detpar, bool armaexp) {
    arma::uword N = d.n_rows;
    arma::uword K = d.n_cols;
    arma::mat hik (N,K); 

    if (armaexp) {
        // generate N x K matrix for each parameter
        arma::mat par0 = arma::repmat(detpar.col(0), 1, K);
        arma::mat par1 = arma::repmat(detpar.col(1), 1, K);
        // this should work, but hangs in some cases on Unix with forked workers
        hik = par0 % arma::exp(-arma::square(d) / 2 / arma::square(par1));
    }
    else {
        // this works
        arma::uword i,k;
        for (i=0; i<N; i++)
            for (k=0; k<K; k++)
                hik(i,k) = detpar(i,0) * std::exp(-d(i,k)*d(i,k)/2/detpar(i,1)/detpar(i,1));
    }
    
    return(hik);
    
}
