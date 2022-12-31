###############################################################################
## package 'armatest'
## armatest.R
## 2023-01-01
###############################################################################

armatest <- function (ncores = 1, forkonunix = TRUE, armaexp = TRUE, 
    nrepl = 1, N = 200, K = 100,  debug = FALSE, seed = 123) {

    if (ncores > 1) {
        clustertype <- if (forkonunix && .Platform$OS.type == "unix") "FORK" else "PSOCK"
        clusterfile <- if (debug) "clusterlogfile.txt" else "/dev/null"
        message (paste0('Preparing ', clustertype, 
            ' cluster for parallel processing (ncores = ', ncores, ')'))
        clust <- makeCluster(ncores, type = clustertype, outfile = clusterfile)
        on.exit(stopCluster(clust))
        clusterSetRNGStream(clust, seed)
    } 
    else {
        message (paste0('Using single processor (ncores = ', ncores, ')'))
        set.seed(seed)
    }
    one <- function (r) {
        d <- matrix(runif(N*K), N, K)
        at <- armatestcpp(d, armaexp)
        c(range(at),mean(at))
    }
    if (ncores>1)
        out <- do.call(rbind, parLapply(clust, 1:nrepl, one))
    else
        out <- do.call(rbind, lapply(1:nrepl, one))
    apply(out,2,mean)
}
###############################################################################

