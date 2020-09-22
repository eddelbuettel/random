
## R package for true random numbers from [random.org](https://www.random.org)

[![Build Status](https://travis-ci.org/eddelbuettel/random.svg)](https://travis-ci.org/eddelbuettel/random) 
[![License](https://img.shields.io/badge/license-GPL%20%28%3E=%202%29-brightgreen.svg?style=flat)](https://www.gnu.org/licenses/gpl-2.0.html) 
[![CRAN](https://www.r-pkg.org/badges/version/random)](https://cran.r-project.org/package=random) 
[![Dependencies](https://tinyverse.netlify.com/badge/random)](https://cran.r-project.org/package=random)
[![Downloads](https://cranlogs.r-pkg.org/badges/random?color=brightgreen)](https://www.r-pkg.org/pkg/random)
[![Last Commit](https://img.shields.io/github/last-commit/eddelbuettel/random)](https://github.com/eddelbuettel/random)


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
