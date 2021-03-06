##' Identify linearly dependent rows or columns in a matrix
##'
##' @details A row (or column) is considered to be a linear combination of another if
##' the maximum of the absolute succesive differences of the ratios of the two
##' rows (columns) exceeds the tolerance, \code{tol}.  This is a fairly crude
##' criterion and may need improvement--but it at least will identify the
##' almost-exact linear dependencies.
##'
##' \code{findDepMat} identifies linearly dependent rows (columns) similar to
##' the way \code{\link{duplicated}} identifies duplicates. As such, the first
##' instance (row or column) of a set of linearly dependent rows (or columns)
##' is not flagged as being dependent.
##'
##' The sum of the negated output of \code{findDepMat} should be the number of
##' linearly independent rows (columns).  This quanity is compared to the rank
##' produced by \code{\link{qr}}, and if not equal, a warning is issued.  The
##' value of \code{tol} is passed to \code{\link{qr}}, but the criteria of
##' convergence for \code{\link{qr}} is assuredly different from that used here
##' to identify the linearly dependent rows (columns).
##'
##' Currently this uses nested 'for' loops within R (not C).  Consequently,
##' \code{findDepMat} is likely to be slow for large matrices.
##'
##' @export
##' @param X A numeric matrix
##'
##' @param rows Set \code{rows = TRUE} to identify which rows are linearly
##' dependent. Set \code{rows = FALSE} to identify columns that are linearly
##' dependent.
##'
##' @param tol The tolerance used to determine whether one row (or column) is a
##' linear combination of another.
##'
##' @return A logical vector, equal in length to the number of rows (columns)
##' of \code{X}, with \code{TRUE} indicating that the row (column) is linearly
##' dependent on a previous row (column).
##'
##' @author Landon Sego
##'
##' @keywords misc
##'
##' @examples
##' # A matrix
##' Y <- matrix(c(1, 3, 4,
##'               2, 6, 8,
##'               7, 2, 9,
##'               4, 1, 7,
##'               3.5, 1, 4.5), byrow = TRUE, ncol = 3)
##'
##' # Note how row 2 is multiple of row 1, row 5 is a multiple of row 3
##' print(Y)
##'
##' findDepMat(Y)
##' findDepMat(t(Y), rows = FALSE)

findDepMat <- function(X, rows = TRUE, tol = 1e-10) {

  if (!is.matrix(X))
    stop("'X' is not a matrix")
  if (!is.numeric(X))
    stop("'X' is not numeric")

  if (!rows) {
    X <- t(X)
  }

  depends <- logical(NROW(X))

  for (i in 1:(NROW(X) - 1)) {

    for (j in (i + 1):NROW(X)) {

      # Only check it if a dependency has not been established
      if (!depends[j]) {
        depends[j] <- (max(abs(diff(X[i,] / X[j,]))) < tol)
      }

    }

  } # for (i

  # Check with qr
  qr.rank <- qr(X, tol = tol)$rank
  
  if (sum(!depends) != qr.rank) {
    warning("Number of linearly independent rows (or columns), ",
            sum(!depends), ", do not agree with rank of X, ", qr.rank, ".\n")
  }

  return(depends)

} # findDepMat


