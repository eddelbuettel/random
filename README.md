
## random [![Build Status](https://travis-ci.org/eddelbuettel/random.png)](https://travis-ci.org/eddelbuettel/random)

R package for true random numbers from [random.org](https://www.random.org)

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
