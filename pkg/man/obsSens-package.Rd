\name{obsSens-package}
\alias{obsSens-package}
\alias{obsSens}
\docType{package}
\title{
Perform sensitivity analysis on observational studies to explore
possible effects of unmeasured (lurking) variables.
}
\description{
This package provides functions for doing sensitivity analysis on
coefficients of regression type models (regression, logistic regression,
cox proportional hazards).  These assume a true model of the form:
g(y)=beta*x+gamma*u+theta*z where u is an unmeasured potential lurking
variable, x is the main variable of interest (treatment) and z
represents other potential variables in the model.  The response
variable (y) can be continuous, binary, or a survival object.  These
functions examine the effect of u on beta for different values of gamma
and the relationship between u and y.
}
\details{


The key functions are all of the form obsSensYXU where Y specifies the
type of variable used as the response variable (y), X specifies the type
of variable used as the main predictor variable to be tested (x), and U
specifies the type of unmeasured variable to use.  They can take on the
following values:  S - survival analysis (Y only), C - Categorical
(logistic regression, currently only handles 2 levels), or N - normal
(or continuous variables).

All the functions take either a fitted model object (lm, glm, or coxph)
or a coefficient value and its confidence interval.  You then specify
values (vector) for the possible relationship between Y and U and X and
U.  The return value is a list with a matrix or array with the adjusted
coefficients and upper and lower confidence limits.

}
\author{
  Greg Snow \email{538280@gmail.com}
}
\references{
Lin, DY and Psaty, BM and Kronmal, RA. (1998): Assessing the Sensitivity
of Regression Results to Unmeasured Confounders in Observational
Studies.  Biometrics, 54 (3), Sep, pp. 948-963.

Baer, VL et. als (2007): Do Platelet Transfusions in the NICU Adversely
Affect Survival? Analysis of 1600 Thrombocytopenic neonates in a
mulihospital healthcare system.  Journal of Perinatology, 27, pp. 790-796.
}
\keyword{ package }
\keyword{ models }
\keyword{ regression }
\keyword{ survival }

\examples{

# Recreate tables from above references

obsSensCCC( log(23.1), log(c(6.9, 77.7)), g0=c(2,6,10),
  p0=seq(0,.5,.1), p1=seq(0,1,.2) )

obsSensSCC( log(1.21), log(c(1.09,1.25)),
  p0=seq(0,.5,.1), p1=seq(0,1,.1), g0=3 )


obsSensCNN( log(1.14), log(c(1.10,1.18)),
  rho=c(0,.5, .75, .85, .9, .95, .98, .99),
  gamma=seq(0,1,.2), sdx=4.5 )

}
