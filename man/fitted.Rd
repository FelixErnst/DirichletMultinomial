\name{model components}
\alias{mixture}
\alias{mixturewt}
\alias{goodnessOfFit}
\alias{laplace}
\alias{AIC,DMN-method}
\alias{BIC,DMN-method}
\alias{fitted,DMN-method}
\alias{predict,DMN-method}
\alias{show,DMN-method}
\alias{fitted,DMNGroup-method}
\alias{predict,DMNGroup-method}
\alias{summary,DMNGroup-method}
\alias{show,DMNGroup-method}

\title{Access model components.}

\description{
  The accessors \code{mixture} and \code{mixturewt} return information
  about the estimated Dirichlet components of the fitted
  model. Return values are described in the Values section, below.
}

\usage{
mixture(object, ..., assign=FALSE)
mixturewt(object, ...)
goodnessOfFit(object, ...)
laplace(object, ...)
\S4method{AIC}{DMN}(object, ..., k = 2)
\S4method{BIC}{DMN}(object, ...)

\S4method{fitted}{DMN}(object, ..., scale=FALSE)
\S4method{predict}{DMN}(object, newdata, ..., logevidence=FALSE)
\S4method{fitted}{DMNGroup}(object, ...)
\S4method{predict}{DMNGroup}(object, newdata, ..., assign=FALSE)
\S4method{summary}{DMNGroup}(object, ...)
}

\arguments{

  \item{object}{An instance of class \code{\link{dmn}}.}

  \item{newdata}{A \code{matrix} of new sample x taxon data to be fitted
    to the model of \code{object}.}

  \item{...}{Additional arguments, available to methods, when
    applicable.}

  \item{assign}{\code{logical(1)} indicating whether the maximum
    per-sample mixture component should be returned
    (\code{assign=FALSE}), or the full mixture matrix
    (\code{assign=TRUE}).}

  \item{scale}{\code{logical(1)} indicating whether fitted values should
    be returned unscaled (default, \code{scaled=FALSE}) or scaled by the
    variability of \code{\link{mixturewt}} parameter \code{theta}.}

  \item{logevidence}{\code{logical(1)} indicating whether posterior
    probability (default, \code{logevidence=FALSE}) or log evidence
    \code{logical=TRUE} should be returned.}

  \item{k}{ignored.}

}

\value{

  \code{mixture} with \code{assign=FALSE} returns a matrix of sample x
  Dirichlet component estimates. With \code{assign=TRUE} \code{mixture}
  returns a named vector indexing the maximal Dirichlet component of
  each sample.

  \code{mixturewt} returns a matrix with rows corresponding to mixture
  components, and columns \code{pi} (component weight) and \code{theta}
  (component variability). Small values of \code{theta} correspond to
  highly variable components.

  \code{goodnessOfFit} returns a named numeric vector of measures of
  goodness of fit.

  \code{laplace}, \code{AIC}, and \code{BIC} return the corresponding
  measures of goodness of fit.

}

\author{Martin Morgan \url{mailto:mtmorgan@fhcrc.org}}

\examples{
data(fit)
best <- fit[[4]]
mixturewt(best)
head(mixture(best), 3)
head(mixture(best, assign=TRUE), 3)
goodnessOfFit(best)

fl <- system.file(package="DirichletMultinomial", "extdata",
                  "Twins.csv")
count <- t(as.matrix(read.csv(fl, row.names=1)))
data(bestgrp)
bestgrp
head(predict(bestgrp, count))
}

\keyword{manip}
