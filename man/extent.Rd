% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spex.R
\name{extent}
\alias{extent}
\alias{extent_sf}
\alias{Extent}
\title{Extent of simple features}
\usage{
extent_sf(x, ...)
}
\arguments{
\item{x}{object with an extent}

\item{...}{unused}
}
\description{
This is the simplest of the missing "raster support" for the sf package,
here using the xmin, xmax, ymin, ymax convention used by raster rather than
the transpose version favoured in sp and sf.
}
