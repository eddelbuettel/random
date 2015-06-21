
## random [![Build Status](https://travis-ci.org/eddelbuettel/random.svg)](https://travis-ci.org/eddelbuettel/random) [![License](http://img.shields.io/badge/license-GPL%20%28%3E=%202%29-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-2.0.html) [![CRAN](http://www.r-pkg.org/badges/version/random)](http://cran.rstudio.com/package=random) [![Downloads](http://cranlogs.r-pkg.org/badges/random?color=brightgreen)](http://www.r-pkg.org/pkg/random)


R package for true random numbers from [random.org](https://www.random.org)

### About

This package provides an interface to the true random number service provided
by the [random.org](https://random.org) website created by Mads Haahr.

The random.org web service samples atmospheric noise via radio 
tuned to an unused broadcasting frequency together with a skew
correction algorithm due to John von Neumann.  More background is
available in the included vignette based on an essay by Mads Haahr. 

In its current form, the package offers functions to retrieve 
random integers, randomized sequences and random strings. 

### Author

Dirk Eddelbuettel

### License

GPL (>= 2)
