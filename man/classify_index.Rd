% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/classify_index.R
\name{classify_index}
\alias{classify_index}
\title{classify_index}
\usage{
classify_index(r, index = NULL, thresholds = NULL, labels = NULL)
}
\arguments{
\item{r}{is the Raster* object to classify.}

\item{index}{this is the code of the fire danger index.}

\item{thresholds}{numeric vector containing 5 thresholds.}

\item{labels}{string of characters to be used as labels}
}
\value{
The function returns a Raster* object of the same dimensions of
\code{r} but the values are categorical from 1 to 6 (corresponding to
very low, low, moderate, high, very high and extreme danger, respectively).
Some cells may contain NAs, this happens typically over the sea.
}
\description{
This function classifies a fire danger index based on user
defined danger thresholds. If \code{index} is one of GEFF's indices (fwi,
ffmc, dmc, dc, isi, bui), the user does not need to specify thresholds and
labels. Default thresholds and labels are those defined by JRC for Europe:
https://effis.jrc.ec.europa.eu/about-effis/technical-background/fire-danger-forecast/
For instance if index = "fwi", default thresholds and labels are:
very Low = 0-5.2, low = 5.2-11.2, moderate = 11.2-21.3, high = 21.3-38.0,
very high = 38-50.0, extreme = > 50.
However, if threshold != NULL, the default values will be overwritten by the
custom values.
}
\examples{
\dontrun{
  r <- readRDS(system.file("extdata", "RISICO_raster.rds", package = "caliver"))
  x <- classify_index(r, index = "fwi")

  # This can be plotted using rasterVis::levelplot()
  rasterVis::levelplot(x)
}

}
