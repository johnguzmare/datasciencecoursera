Simulation
=================

To start, here is a table with all four normal distribution functions and their purpose, syntax, and an example:


| PURPOSE  |  SYNTAX |  EXAMPLE |  
|---|---|---|
| RNORM  | Generates random numbers   | from normal distribution	rnorm(n, mean, sd)	rnorm(1000, 3, .25)
Generates 1000 numbers
from a normal with mean 3
and sd=.25  |
|---|---|---|
|   |   |   |  

		
	


DNORM	Probability Density Function
(PDF)	dnorm(x, mean, sd)	dnorm(0, 0, .5)
Gives the density (height of the
PDF) of the normal
with mean=0 and sd=.5. 
PNORM	Cumulative Distribution Function
(CDF)	pnorm(q, mean, sd)	pnorm(1.96, 0, 1)
Gives the area under the
standard normal curve to
the left of 1.96,
i.e. ~0.975
QNORM	Quantile Function – inverse of
pnorm	qnorm(p, mean, sd)	qnorm(0.975, 0, 1)
Gives the value at which the
CDF of the standard normal
is .975, i.e. ~1.96
Note that for all functions, leaving out the mean and standard deviation would result in default values of mean=0 and sd=1, a standard normal distribution.
