% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/addAlpha.R
\name{addAlpha}
\alias{addAlpha}
\title{Color transparency}
\usage{
addAlpha(col, alpha = 0.3)
}
\arguments{
\item{col}{Vector of color names (\code{\link{colors}}), hexadecimal or integer that can be interpreted by \code{\link{col2rgb}}}

\item{alpha}{Level of semi-transparency. between 0 (transparent) and 1 (intransparent). Can also be a vector. DEFAULT: 0.3}
}
\value{
character vector with hexadecimal color codes.
}
\description{
Make existing colors semi-transparent (add alpha)
}
\examples{

addAlpha("red", c(0.1, 0.3, 0.6, 1))
addAlpha(1:3)
addAlpha(1:3, 1:3/3)
NewColors <- addAlpha(c("red","blue","yellow","green", "purple"), 0:200/200)
plot(runif(1000), col=NewColors, pch=16, cex=2)

# use addFade for line segments, because of overlapping dots
set.seed(1); x <- cumsum(rnorm(30))  ; y <- x-2
plot(x, type="n")
segments(x0=1:29,y0=head(x,-1), x1=2:30,y1=x[-1], col=addAlpha(4, 29:0/30), lwd=10)
segments(x0=1:29,y0=head(y,-1), x1=2:30,y1=y[-1], col=addFade (4, 29:0/30), lwd=10)

}
\seealso{
\code{\link{addFade}}, \code{\link{rgb}}, \code{\link{colors}}, \code{\link{col2rgb}}
}
\author{
Berry Boessenkool, \email{berry-b@gmx.de}, June 2014 Based on suggestion by Mathias Seibert, Dec. 2013
}
\keyword{color}
\keyword{dplot}
