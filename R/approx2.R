#' Smart linear NA interpolation
#' 
#' Smart interpolation: as \code{\link{approx}}, approx2 fills NAs in a vector with linear interpolation,
#' but unlike \code{\link{approx}}, it can handle NAs at the ends of a vector
#' (takes the first/last value available for those). Also, approx2 returns a vector only.
#' 
#' @details The function fill is used to fill missing values at the ends of the vector.
#' It could be mean or median, for example, but must be a function that accepts \code{na.rm=TRUE} as an argument.
#' The default (NULL) means to use the first (or last) observation available.
#' 
#' @return Vector with NAs replaced with interpolation (not a list, as in \code{\link{approx}}!)
#' @author Berry Boessenkool, \email{berry-b@@gmx.de}, July 2015
#' @seealso \code{\link{approx}}, zoo::na.locf, \code{\link{ciBand}} for usage example
#' @keywords arith dplot
#' @importFrom stats approx
#' @importFrom utils head tail
#' @export
#' @examples
#' 
#' approx2(c(NA,NA))   # yields a message
#' approx2(c(NA,NA, 6, 4, 8, 9, 3, 2, 1)) # fills with first non-NA value
#' approx2(c( 2,NA, 6, 4, 8, 9, 3, 2, 1)) # interpolates linearly
#' approx2(c( 2, 4, 6, 4, 8, 9,NA, 2,NA)) # linear, then last non-NA at end
#' 
#' approx2(c(NA,NA, 6, 4, 8, 9, 3, 2, 1))
#' approx2(c(NA,NA, 6, 4, 8, 9, 3, 2, 1), fill=median) # first median, then linear
#' approx2(c(NA,NA, 6, 4, 8, 9, 3, 2, 1), fill=mean)
#' 
#' approx2(c( 3, 4, 6, 4, 8, 9,NA, 2,NA))
#' approx2(c( 3, 4, 6, 4, 8, 9,NA, 2,NA), fill=median)
#' approx2(c( 3, 4, 6, 4, 8, 9,NA, 2,NA), fill=mean)
#' 
#' approx2(c(NA,NA, 6, 4, 8, 9, 3, 2, 1), n=17)
#' approx2(c( 2,NA, 6, 4, 8, 9, 3, 2, 1), n=17)
#' approx2(c( 2, 4, 6, 4, 8, 9,NA, 2,NA), n=17)
#' 
#' @param x Vector with (numeric) values
#' @param fill Function to fill NAs at the start or end of the vector. See Details. DEFAULT: NULL
#' @param n Number of points to interpolate to
#' @param quiet Logical: suppress warning for no non-NA values? DEFAULT: FALSE
#' @param \dots Further arguments passed to \code{\link{approx}}

approx2 <- function(
x,
fill=NULL,
n=length(x),
quiet=FALSE,
...
)
{
# Input controls
if(all(is.na(x)))
  {
  if(!quiet) warning("There are no non-NA values in x.")
  return(rep(NA,n))
  }
L <- length(x)
# Fill leading NAs (with the first available value):
if(is.na(x[1])) x[1] <- if(is.null(fill)) head(x[!is.na(x)],1) else fill(x, na.rm=TRUE)
# Fill trailing NAs (with the last available value):
if(is.na(x[L])) x[L] <- if(is.null(fill)) tail(x[!is.na(x)],1) else fill(x, na.rm=TRUE)
# Fill central NAs with a linear interpolation from the surrounding values:
approx(x, n=n, ...)$y
}

