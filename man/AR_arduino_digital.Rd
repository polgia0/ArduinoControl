\name{AR_arduino_digital}
\alias{AR_arduino_digital}
\title{Set the Digital IOs on the board}
\description{Graphical menu to set the Digital Inputs / Outputs on the board}
\usage{AR_arduino_digital(arduino, batch)}
\arguments{
  \item{arduino}{list with all the board settings}
  \item{batch }{default NULL. In case of batch mode, a list with the setting of Digital IOs. See examples for format.}
}
\details{The menu allows to set the level of Input/Output switches on the board.\cr
\figure{digital.png}\cr}
\value{The setting of digital IOs is changed in arduino list. The updated list is copied on the reference environmental (typically the .Gloabalenv).}
\author{Gianmarco Polotti}
\examples{
# set open gates DA1, DA2, DA4 as input and keep close all the other ones
arduino<-list(com='COM5')
digital<-list(
  input=c(DA1=TRUE, DA2=TRUE, DA4=TRUE, DA7=FALSE, DA8=FALSE, DA12=FALSE, DA13=FALSE),
  output=c(DO1=FALSE, DO2=FALSE, DO4=FALSE, DO7=FALSE, DO8=FALSE, DO12=FALSE, DO13=FALSE))
arduino<-AR_arduino_digital(arduino, digital)
arduino
}
\keyword{ digital }
\keyword{ arduino }
