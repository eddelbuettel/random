\name{random}
\alias{random}
\alias{randomNumbers}
\alias{randomSequence}
\alias{randomBytes}
\alias{randomBufferStatus}
\alias{sufficientBits}
\title{True random numbers from random.org}
\description{
  The \code{random} packages provides several functions that
  access the true random number service at \url{http://random.org}.

  \code{randomNumber} retrieves random integers with duplicates,
  \code{randomSequence} retrieves random sequences without
  duplicates, \code{randomBytes} retrieves raw bytes and
  \code{randomBufferStatus} retrieves the status of the service, and
  \code{sufficientBits} returns a logical value indicating whether the
  service has random bits in excess of a threshold value.
}
\usage{
   randomNumbers(n=100, min=1, max=100, col=5, check=TRUE)
   randomSequence(min=1, max=20, check=TRUE)
   randomBytes(n=16, format=c("hex","dec","oct","bin"), check=TRUE)
   randomBufferStatus()
   sufficientBits()
}
\arguments{
  \item{n}{The number of random integers, or bytes, to be
    retrieved.}
  \item{min}{The minimum value for the returned numbers.}
  \item{max}{The maximum value for the returned numbers.}
  \item{col}{The number of columns for the return object.}
  \item{check}{Boolean whether buffer size at server should be tested.}
  \item{format}{The desired format for the raw bytes.}
}
\value{
  Each function returns a \code{data.frame}.
  For \code{randomNumbers}, it contains \code{col} columns of
  a total of \code{n} integers between \code{min} and
  \code{max}, possibly containing duplicates.  For
  \code{randomSequence}, it contains the shuffled sequence
  denoted by \code{min} and \code{max}. For
  \code{randomBytes}, \code{n} raw bytes in the selected
  format are returned. Lastly, \code{randomBufferStatus}
  returns the status of the service as a percentage.
  \code{sufficientBits} is a simple convenience wrapper which tests
  whether the return from \code{randomBufferStatus()} is at least 0.2 in
  value.
} \details{
  The \url{http://random.org} services uses atmospheric noise sample
  via a radio tuned to an unused broadcast frequency together with a
  skew correction originally due to John von Neumann. Please see the
  included \code{vignette} for more details. 
}
\references{
  The \code{random.org} website at \url{http://www.random.org}.
  Also see the included vignette for further references.
}
\author{Dirk Eddelbuettel \email{edd@debian.org} for the
  \R interface; Mads Haahr for \code{random.org}.
}
\examples{
  ## Cannot run these as we may not have an internet connection
  \dontrun{
    rn <- randomNumbers(100, 1, 100, 5)
    rs <- randomSequence(1, 20)
  }
}
\keyword{misc}
