\name{AR_arduino_parameters}
\alias{AR_arduino_parameters}
\title{Set the parameters on the board}
\description{Graphical menu to set the parameters for data collection}
\usage{AR_arduino_parameters(arduino, batch)}
\arguments{
  \item{arduino}{list with all the board settings}
  \item{batch }{default NULL. In case of batch mode, a list with the setting of data acquisition. See examples for format.}
}
\details{The menu allows to set the parameters for data collection.Parameters are:
\itemize{
  \item{\emph{Delay}}{ time in millisecond between two readings (electronic parameter)}
  \item{\emph{Period}}{ time in second between two points on the graph (graphical parameter) )}
  \item{\emph{N.points}}{ number of readings}
}
\figure{parameters.png}\cr}
\value{The setting of parameters is changed in arduinio list. The updated list is copied on the reference environmental (typically the .Gloabalenv).}
\examples{
# set Delay, Period and number of points
arduino<-list(com='COM5')
param<-c(Delay=500, Period=10, Points=50)
arduino<-AR_arduino_parameters(arduino, param)
arduino
}
\author{Gianmarco Polotti}
\keyword{ parameters }
\keyword{ arduino }
