\name{AR_arduino_port}
\alias{AR_arduino_port}
\title{Set the port number for data acquisition}
\description{Graphical menu to set the serial port number used by the board}
\usage{AR_arduino_port(arduino, batch)}
\arguments{
  \item{arduino}{list with all the board settings}
  \item{batch }{default NULL. In case of batch mode, a character string with the port number}
}
\details{The menu allows to set the port number where the board is connected to.\cr
\figure{port.png}\cr}
\value{The setting of the port number is changed in arduinio list. The updated list is copied on the reference environmental (typically the .Gloabalenv).}
\author{Gianmarco Polotti}
\examples{
arduino<-list()
arduino<-AR_arduino_port(arduino,'5')
arduino
}
\keyword{ port }
\keyword{ arduino }
