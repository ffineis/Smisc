% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sourceDir.R
\name{sourceDir}
\alias{sourceDir}
\title{Sources all files with '.R' or '.r' extensions in a directory}
\usage{
sourceDir(directory, recursive = FALSE, tryCatch = TRUE, ...)
}
\arguments{
\item{directory}{Character string indicating the path of the directory
containing the R files to be sourced.}

\item{recursive}{\code{=TRUE} descends into subdirectories of
\code{directory}}

\item{tryCatch}{if \code{TRUE}, sourcing is protected in a try catch, i.e.,
if there is an error, \code{sourceDir} will continue to the next file.  If
\code{FALSE}, \code{sourceDir} will stop if a file sources with an error.}

\item{\dots}{Additional arguments to \code{\link{source}}}
}
\value{
Invisibly returns a character vector containing the files that were
identified for sourcing. Also prints a message indicating whether each file was sourced correctly or
not.
}
\description{
Sources all files with '.R' or '.r' extensions in a directory using a try-catch for each file
}
\details{
In addition to sourcing files for general use, this function is also useful in package development to
verify there are no syntax errors prior to building and compilation.
}
\author{
Landon Sego
}
\keyword{misc}
