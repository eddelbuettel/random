
# $Id$

randomQuota <- function() {
    urltxt <- "http://random.org/quota/?format=plain"
    ##quota <- read.table(file=urltxt, as.is=TRUE, header=FALSE, nrows=1)
    quota <- scan(file=urltxt, nlines=1, quiet=TRUE)
    return(quota)
}

quotaCheck <- function() {
    return(randomQuota() > 0)     	# ok as long as it is positive
}

randomNumbers <- function(n=100, min=1, max=100, col=5, base=10, check=TRUE) {
    if (n < 1 || n > 1e4)
        stop("Random number requests must be between 1 and 10,000 numbers")
    if (min < -1e9 | max > 1e9 | min > max)
        stop("Random number range must be between -1000,000,000 and 1000,000,000")
    if (n %% col != 0)
        stop("Request size 'n' not cleanly divisible by column size 'col'")
    if (!base %in% c(2,8,10,16))
        stop("Base has to be one of 2, 8, 10 or 16")
    if (check & FALSE==quotaCheck())
        stop("random.org suggests to wait until tomorrow")
    urlbase <- "http://random.org/integers/"
    urltxt <- paste(urlbase,
                    "?num=", format(n, scientific=FALSE),
                    "&min=", format(min, scientific=FALSE),
                    "&max=", format(max, scientific=FALSE),
                    "&col=", col,
                    "&base=", base,
                    "&format=plain",
                    "&rnd=new",
                    sep="")
    randNum <- as.matrix(read.table(file=urltxt, as.is=TRUE))
    return(randNum)
}

randomSequence <- function(min=1, max=20, check=TRUE) {
    if (min < -1e9 | max > 1e9 | min > max)
        stop(paste("Random sequence range must be between -1000,000,000",
                   "and 1000,000,000"))
    if (check & FALSE==quotaCheck())
        message("random.org suggests to wait with larger requests")
    urlbase <- "http://random.org/sequences/"
    urltxt <- paste(urlbase,
                    "?min=", min,
                    "&max=", max,
                    "&format=plain",
                    "&rnd=new",
                    sep="")
    randSeq <- as.matrix(read.table(file=urltxt, as.is=TRUE))
    return(randSeq)
}

randomStrings <- function(n=10, len=5, digits=TRUE, upperalpha=TRUE, loweralpha=TRUE, unique=TRUE, check=TRUE) {
    if (n < 1 || n > 1e4)
        stop("Random string requests must be between 1 and 10,000 numbers")
    if (len < 1 || len > 20)
        stop("Random string length must be between 1 and 20")
    if (class(digits)!="logical" || class(upperalpha)!="logical" || class(loweralpha)!="logical" || class(unique)!="logical")
        stop("The 'digits', '(lower|upper)alpha' and 'unique' arguments has to be logical")
    if ( !digits && !upperalpha && !loweralpha)
        stop("The 'digits', 'loweralpha' and 'loweralpha' cannot all be false at the same time")
    if (check & FALSE==quotaCheck())
        stop("random.org suggests to wait until tomorrow")
    urlbase <- "http://random.org/strings/"
    urltxt <- paste(urlbase,
                    "?num=", n,
                    "&len=", len,
                    "&digits=", ifelse(digits, "on", "off"),
                    "&upperalpha=", ifelse(upperalpha, "on", "off"),
                    "&loweralpha=", ifelse(loweralpha, "on", "off"),
                    "&unique=", ifelse(unique, "on", "off"),
                    "&format=plain",
                    "&rnd=new",
                    sep="")
    randStrings <- as.matrix(read.table(file=urltxt))
    return(randStrings)
}

