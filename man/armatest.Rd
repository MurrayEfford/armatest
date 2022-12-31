\name{armatest}
\alias{armatest}

\title{Test RcppArmadillo exp}

\description{

Test only

}

\usage{

armatest(ncores = 1, forkonunix = TRUE, armaexp = TRUE, 
    nrepl = 1, N = 200, K = 100,  debug = FALSE, seed = 123)

}

\arguments{

  \item{ncores}{integer cluster size}
  \item{forkonunix}{logical}
  \item{armaexp}{logical; use arma::exp or std::exp in C++}
  \item{nrepl}{integer number of replicates}
  \item{N}{nrows}
  \item{K}{ncols}
  \item{debug}{logical}
  \item{seed}{integer}

}

\details{

Test of RcppArmadillo element-wise exp.

}

\value{

Vector of min, max and mean of simulated exp(-distance).

}

