
# $Id: random.R,v 1.2 2007/04/26 01:57:39 edd Exp $

randomBufferStatus <- function() {
  urltxt <- "http://www.random.org/cgi-bin/checkbuf"
  checkBuf <- read.table(file=urltxt, as.is=TRUE)
  ## strip trailing '%', and dividide by 100 so that '45%' becomes 0.45
  pct <- as.numeric(gsub('%','', checkBuf))/100
  names(pct) <- 'checkbuf'
  return(pct)
}

sufficientBits <- function() {
  ## following Haahr's suggestion, we compare to a level of 20\%
  return( randomBufferStatus() >= 0.2 )
}

randomNumbers <- function(n=100, min=1, max=100, col=5, check=TRUE) {
  if (n < 1 || n > 10000)
    stop("Random number requests must be between 1 and 10,000 numbers")
  if (min < -1000000000 | max > 1000000000)
    stop("Random number range must be between -1000,000,000 and 1000,000,000")
  if (n %% col != 0)
    stop("Request size 'n' not cleanly divisible by column size 'col'")
  if (check & n >= 1000 & !sufficientBits()) 
    message("random.org suggests to wait with larger requests")
  urlbase <- "http://random.org/cgi-bin/"
  urltxt <- paste(urlbase,
                  "randnum?num=", format(n, scientific=FALSE),
                  "&min=", format(min, scientific=FALSE),
                  "&max=", format(max, scientific=FALSE),
                  "&col=", col,
                  sep="")
  randNum <- as.matrix(read.table(file=urltxt, as.is=TRUE))
  return(randNum)
}

randomSequence <- function(min=1, max=20, check=TRUE) {
  if (min < -1000000000 | max > 1000000000)
    stop(paste("Random sequence range must be between -1000,000,000",
               "and 1000,000,000"))
  if (check & (max-min+1) >= 1000 & !sufficientBits()) 
    message("random.org suggests to wait with larger requests")
  urlbase <- "http://random.org/cgi-bin/"
  urltxt <- paste(urlbase,
                  "randseq?min=", min,
                  "&max=", max,
                  sep="")
  randSeq <- as.matrix(read.table(file=urltxt, as.is=TRUE))
  return(randSeq)
}

randomBytes <- function(n=16, format=c("hex","dec","oct", "bin"), check=TRUE) {
  if (n < 16 || n > 16384)
    stop("Random bytes requests must be between 16 and 16,384 bytes")
  if (n %% 16 !=0) 
    stop("Random bytes request size must be divisible by 16")

  format <- match.arg(format)
  
  urlbase <- "http://random.org/cgi-bin/"
  urltxt <- paste(urlbase,
                  "randbyte?nbytes=", n,
                  "&format=", format,
                  sep="")

  randBytes <- as.matrix(read.table(file=urltxt))
  return(randBytes)
}

