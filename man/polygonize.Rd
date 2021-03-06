% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/qm_rasterToPolygons.R
\name{polygonize}
\alias{polygonize}
\alias{polygonize.RasterLayer}
\alias{qm_rasterToPolygons}
\alias{qm_rasterToPolygons_sp}
\alias{polygonize.RasterStack}
\alias{polygonize.RasterBrick}
\title{Create a polygon layer from a raster.}
\usage{
\method{polygonize}{RasterLayer}(x, na.rm = TRUE, ...)

polygonize(x, ...)

qm_rasterToPolygons(x, na.rm = TRUE, ...)

\method{polygonize}{RasterStack}(x, na.rm = TRUE, ...)

\method{polygonize}{RasterBrick}(x, na.rm = TRUE, ...)

qm_rasterToPolygons_sp(x, na.rm = TRUE, ...)
}
\arguments{
\item{x}{raster, brick or stack}

\item{na.rm}{defaults to \code{TRUE} and will polygonize all the cells that are non-NA in any layer,
set to \code{FALSE} to not remove any cells}

\item{...}{arguments passed to methods, currently unused}
}
\value{
simple features POLYGON layer, or SpatialPolygonsDataFrame
}
\description{
This method uses the quadmesh to generate the coordinates, and creates a simple features layer.
It's faster by turning off the checking done in the simple features package, but it's also faster
than raster because it uses a dense mesh to generate the coordinates.
}
\details{
If \code{na.rm} is \code{TRUE} (the default) only cells that are not-NA across all
layers are created. An exception to this is the empty raster \code{raster::hasValues(x)} is \code{FALSE}
and all the cells will be turned into polygons - since this is what the whole
scene is really for, easily creating polygons from a grid.
}
\section{Warning}{

Please don't try this on large rasters (> ~1e5 cells), use quadmesh itself for efficient vector based use of a raster's
coordinates. It will work reasonably on largish grids, but you won't want to try plotting them or perform
operations on them, simple features is incredibly wasteful for objects like this.
}

\examples{
#library(raadtools)
library(raster)
r <- raster(volcano)
r[sample(ncell(r), 3000)] <- NA
b <- brick(r, r*1.5)
psf <- qm_rasterToPolygons(r, na.rm = TRUE)
#psp <- qm_rasterToPolygons_sp(r)
#pspr <- rasterToPolygons(r)
#library(rbenchmark)
#benchmark(qm_rasterToPolygons(r), qm_rasterToPolygons_sp(r), rasterToPolygons(r), replications = 2)
#                        test replications elapsed relative user.self sys.self user.child sys.child
# 1    qm_rasterToPolygons(r)            2   0.476    1.000     0.476    0.000          0         0
# 2 qm_rasterToPolygons_sp(r)            2   4.012    8.429     3.964    0.048          0         0
# 3       rasterToPolygons(r)            2   2.274    4.777     2.268    0.008          0         0
}
