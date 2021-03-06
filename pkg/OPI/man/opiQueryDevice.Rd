\name{opiQueryDevice}
\alias{opiQueryDevice}
\title{
Query device using OPI.
}
\description{
Generic function for getting details of the chosen OPI implementation that is set with
\code{chooseOpi()}.
}
\usage{
opiQueryDevice(...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
    \item{\dots}{Implementation specific parameters. See details.}
}
\details{
\subsection{Octopus600}{
If the chosen OPI is \code{Octopus600}, then this function returns 
information about the patient. See the Value section for details.
}
\subsection{KowaAP7000}{
If the chosen OPI is \code{KowaAP7000}, then this function returns 
the current location of the pupil.
See the Value section for details.
}
}
\value{
Returns implementation dependant data.
\subsection{Octopus600}{
Returns a list of 10 items:
\enumerate{
\item answerButton [0 = not pressed, 1 = pressed ]
\item headSensor [0 = no forehead detected, 1 = forehead detected ]
\item eyeLidClosureLeft [0 = eye is open, 1 = eye is closed ]
\item eyeLidClosureRight [0 = eye is open, 1 = eye is closed ]
\item fixationLostLeft [1 = eye pos lost, 0 = eye pos ok)
\item fixationLostRight [1 = eye pos lost, 0 = eye pos ok)
\item pupilPositionXLeft [in px]
\item pupilPositionYLeft [in px]
\item pupilPositionXRight [in px]
\item pupilPositionYRight [in px]
}
}

\subsection{KowaAP7000}{
Returns a list of 4 items:
\itemize{
\item \code{pupilX}, the x-coordinate of the pupil position in pixels.
\item \code{pupilY}, the y-coordinate of the pupil position in pixels.
\item \code{purkinjeX}, the x-coordinate of the purkinje position in pixels.
\item \code{purkinjeY}, the y-coordinate of the purkinje position in pixels.
}
It also prints a list of constants that OPI knows about for the AP-7000.
}

}
\references{
Please cite:
A. Turpin, P.H. Artes and A.M. McKendrick
"The Open Perimetry Interface: An enabling tool for clinical visual psychophysics",
Journal of Vision 12(11) 2012.

http://perimetry.org/OPI
}
\author{
Andrew Tuprin <aturpin@unimelb.edu.au>
}

\seealso{
\code{\link{chooseOpi}}
}

\examples{
chooseOpi("SimGaussian")
if (!is.null(opiInitialize(sd=2)))
    stop("opiInitialize failed")
print(opiQueryDevice())
}

\keyword{ misc }
