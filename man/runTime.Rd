% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/runTime.R
\name{runTime}
\alias{runTime}
\title{runnning time conversion}
\usage{
runTime(d, t)
}
\arguments{
\item{d}{Numerical value: distance [km]}

\item{t}{Charstring: time ["MM:SS"]}
}
\value{
list with time elements
}
\description{
display runnning times in useful units
}
\examples{
runTime(d=3.6, t="15:40")
runTime(d=3.6, t="15:10")
runTime(d=3.6, t="14:50")

}
\seealso{
\code{\link{runAxis}}
}
\author{
Berry Boessenkool, \email{berry-b@gmx.de}, Jun 2020
}
