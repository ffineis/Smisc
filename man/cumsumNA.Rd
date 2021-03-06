% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cumsumNA.R
\name{cumsumNA}
\alias{cumsumNA}
\title{Computes the cummulative sum of a vector without propagating NAs}
\usage{
cumsumNA(x)
}
\arguments{
\item{x}{An integer or double vector}
}
\value{
The vector of cumulative sums.
}
\description{
Computes the cummulative sum of a vector without propagating NAs
}
\details{
If \code{x} is integer, then integer addition is used.  Otherwise, floating
point (double) addition is used. Elements in \code{x} that were \code{NA} will continue
to be \code{NA}, but the \code{NA} will not be propagated.
}
\examples{
# Compare to cumsum()
x <- as.integer(c(5, 2, 7, 9, 0, -1))
cumsum(x)
cumsumNA(x)

# Now with missing values
x[c(2,4)] <- NA
print(x)
cumsum(x)
cumsumNA(x)
}
\seealso{
\code{\link{cumsum}}
}
\author{
Landon Sego
}
\keyword{misc}
