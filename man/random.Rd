\name{random}
\alias{random}
\alias{randomNumbers}
\alias{randomSequence}
%\alias{randomBytes}
\alias{randomStrings}
%\alias{randomBufferStatus}
%\alias{sufficientBits}
\alias{randomQuota}
\alias{quotaCheck}
\title{True random numbers from random.org}
\description{
  The \code{random} package provides several functions that
  access the true random number service at \url{http://random.org}.

  \code{randomNumber} retrieves random integers with duplicates,
  \code{randomSequence} retrieves random sequences without
  duplicates and \code{randomStrings} retrieves strings.

  \code{randomQuota} returns the number of available retrievals, and
  \code{quotaCheck} does a simple binary comparison of remaining numbers
  under the quota.
}
\usage{
   randomNumbers(n=100, min=1, max=100, col=5, base=10, check=TRUE)
   randomSequence(min=1, max=20, check=TRUE)
   randomStrings(n=10, len=5, digits=TRUE, upperalpha=TRUE, loweralpha=TRUE, unique=TRUE, check=TRUE)
%   randomBytes(n=16, format=c("hex","dec","oct","bin"), check=TRUE)
%   randomBufferStatus()
%   sufficientBits()
   randomQuota()
   quotaCheck()
}
\arguments{
  \item{n}{The number of random integers, or bytes, to be
    retrieved.}
  \item{min}{The minimum value for the returned numbers.}
  \item{max}{The maximum value for the returned numbers.}
  \item{col}{The number of columns for the return object.}
  \item{base}{The base for the random numbers: one of 2, 8, 10 or 16.}
  \item{len}{The length of strings returned by randomStrings().}
  \item{digits}{Select whether digits are part of random strings.}
  \item{upperalpha}{Select whether uppercase characters part of random strings.}
  \item{loweralpha}{Select whether lowercase characters part of random strings.}
  \item{unique}{Select whether random strings must be unique.}
  \item{check}{Select whether quota at server should be checked first.}
}
\value{
  Each function returns a \code{matrix}.
  For \code{randomNumbers}, it contains \code{col} columns of
  a total of \code{n} integers between \code{min} and
  \code{max}, possibly containing duplicates.  For
  \code{randomSequence}, it contains the shuffled sequence
  denoted by \code{min} and \code{max}. For
  \code{randomStrings}, \code{n} strings of length \code{len}
  are returned.

  \code{randomQuota} returns the number of bits remaining for retrieval
  at the given day under the currently used IP address.
  \code{quotaCheck} is a simple convenience wrapper which tests
  whether the return from \code{randomBufferStatus()} is a positive number.
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
