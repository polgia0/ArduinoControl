\name{AR_arduino_start}
\alias{AR_arduino_start}
\title{Start the data acquisition from the board}
\description{Function to start data acquisition and plot incoming values}
\usage{AR_arduino_start(arduino)}
\arguments{
  \item{arduino}{list with all the board settings and data}
}
\details{The function starts data collection and plots in a graph the incoming values. The plot is updated after each data set is coming, so the plot is changing for data acquisition time.}
\value{The data are copied on the reference environmental (typically the .Gloabalenv). \bold{The collected data are in \emph{arduino$table} variable, as a data.frame object}}
\author{Gianmarco Polotti}
\examples{
# set all the parameters and start acquisition
arduino<-list()
arduino<-AR_arduino_port(arduino,'5')
analog<-list(
  input=c(A0=TRUE, A1=TRUE, A2=TRUE, A3=FALSE, A4=FALSE, A5=FALSE),
  output=c(O3=FALSE, O5=FALSE, O6=FALSE, O9=FALSE, O10=FALSE, O11=FALSE),
  volts=rep(0,6))
arduino<-AR_arduino_analog(arduino, analog)
digital<-list(
  input=c(DA1=TRUE, DA2=TRUE, DA4=TRUE, DA7=FALSE, DA8=FALSE, DA12=FALSE, DA13=FALSE),
  output=c(DO1=FALSE, DO2=FALSE, DO4=FALSE, DO7=FALSE, DO8=FALSE, DO12=FALSE, DO13=FALSE))
arduino<-AR_arduino_digital(arduino, digital)
param<-c(Delay=500, Period=10, Points=50)
arduino<-AR_arduino_parameters(arduino, param)
arduino<-AR_arduino_start(arduino)
arduino$table
}
\keyword{ start }
\keyword{ arduino }
