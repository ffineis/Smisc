% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sepList.R
\name{sepList}
\alias{sepList}
\title{Separate a list into distinct objects}
\usage{
sepList(X, envir = parent.frame(), objNames = names(X), verbose = FALSE)
}
\arguments{
\item{X}{a list to be separated}

\item{envir}{The environment where the objects in the list are assigned, defaults to \code{parent.frame()}, the environment
where \code{sepList} was called.}

\item{objNames}{Character vector indicating the names of the objects that will be created.  The length of
\code{names} must match the length of the list, \code{X}.}

\item{verbose}{Logical indicating whether to print the names of the objects that have been created by splitting
the list}
}
\value{
Invisibly returns a character vector of the names of the objects that were created, and assigns the objects to
the environment specified by \code{envir}
}
\description{
Separate a list into distinct objects
}
\details{
The names of the objects are determined by the names in the list.  If names in the list are not present, the objects
are named o1, o2, o3, etc.
}
\examples{
# Simplest way to use sepList()
aList <- list(a = 1:10,  b = letters[1:5], d = TRUE)
sepList(aList)
ls()
a
b
d

# Keeping the object names, and listing them via "verbose"
objs <- sepList(list(1:5, c("bits", "bytes"), c(TRUE, FALSE)), verbose = TRUE)
objs
o1
o2
o3

# Note that it doesn't recurse into sublists, only the top level object
# a and b are created
sepList(list(a = 1:2, b = list(b1 = 5, b2 = FALSE)), verbose = TRUE)

# Separate the original list inside a function, notice where the objects are written
sepTest <- function(x) {

 # Keep objects inside the local environment
 cat("Objects in the local environment before separating the list:\\n")
 print(ls())

 sepList(x)

 cat("Objects in the local environment after separating the list:\\n")
 print(ls())

 # Place objects in the global environment instead
 cat("Objects in the global environment before separating the list:\\n")
 print(ls(.GlobalEnv))

 sepList(x, envir = .GlobalEnv)

 cat("Objects in the local environment after separating the list:\\n")
 print(ls(.GlobalEnv))

} # sepTest

sepTest(list(z1 = 10, z2 = "that"))

# Clean up example objects
rm(aList, a, b, d, objs, o1, o2, o3, sepTest, z1, z2)
}
\author{
Landon Sego
}
