\name{AR_arduino_analog}
\alias{AR_arduino_analog}
\title{Set the Analog IOs on the board}
\description{Graphical menu to set the Analog Inputs / Outputs on the board}
\usage{AR_arduino_analog(arduino, batch)}
\arguments{
  \item{arduino}{list with all the board settings}
  \item{batch }{default NULL. In case of batch mode, a list with the setting of Analog IOs. See examples for format.}
}
\details{The menu allows to set the level of Input/Output switches on the board.\cr
\figure{analog.png}\cr}
\value{The setting of analog IOs is changed in arduino list. The updated list is copied on the reference environmental (typically the .Gloabalenv).}
\author{Gianmarco Polotti}
\examples{
# set open gates A0, A1, A2 and keep close all the other ones
arduino<-list(com='COM5')
analog<-list(
  input=c(A0=TRUE, A1=TRUE, A2=TRUE, A3=FALSE, A4=FALSE, A5=FALSE),
  output=c(O3=FALSE, O5=FALSE, O6=FALSE, O9=FALSE, O10=FALSE, O11=FALSE),
  volts=rep(0,6))
arduino<-AR_arduino_analog(arduino, analog)
arduino
}
\keyword{ analog }
\keyword{ arduino }
