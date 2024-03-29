\name{CairoFonMatch}
\alias{CairoFontMatch}
\title{
  Find installed fonts with a fontconfig pattern
}
\description{
  \code{CairoFontMatch} searches for fonts based on a fontconfig pattern.
}
\usage{
CairoFontMatch(fontpattern="Helvetica",sort=FALSE,verbose=FALSE)
}
\arguments{
  \item{fontpattern}{character; a fontconfig pattern.}
  \item{sort}{logical; if 'FALSE', display only the best matching font for the pattern. If 'TRUE', display a sorted list of best matching fonts.}
  \item{verbose}{logical; if 'FALSE', display the family, style, and file property for the pattern. if 'TRUE', display the canonical font pattern for each match.}
}
\details{

This function displays a list of one or more fonts matching the supplied
fontconfig pattern. sort='FALSE' displays the font that Cairo will use
for the supplied pattern, while sort='TRUE' displays a sorted list of
best matching fonts. The simplest fontconfig pattern matching all installed fonts
is ":". Here's what CairoFontMatch(":") displays on this system:

\preformatted{
1. family: "Bitstream Vera Sans", style: "Roman", file: "/usr/share/fonts/truetype/ttf-bitstream-vera/Vera.ttf"
}

verbose='FALSE' displays the font properties 'family', 'style', and 'file', while
verbose='TRUE' will display the canonical font pattern, displaying all properties known
for the font (output of CairoFontMatch(":",verbose=TRUE)):

\preformatted{
1. family: "Bitstream Vera Sans", style: "Roman", file: "/usr/share/fonts/truetype/ttf-bitstream-vera/Vera.ttf"
   "Bitstream Vera Sans-12:familylang=en:style=Roman:stylelang=en:slant=0:weight=80:width=100:pixelsize=12.5:foundry=bitstream:hintstyle=3:hinting=True:verticallayout=False:autohint=False:globaladvance=True:index=0:outline=True:scalable=True:dpi=75:rgba=1:scale=1:fontversion=131072:fontformat=TrueType:embeddedbitmap=True:decorative=False"
}

A simple approach to selecting a font starts with calling CairoFontMatch(":",sort=TRUE) to
list all available fonts. Next, the user will choose a font from the list and call
CairoFontMatch("FamilyName:style=PreferredStyle",sort=TRUE) substituting "FamilyName"
and "PreferredStyle" with the desired values. If only one font is found, then the user
has found the fontconfig pattern that will select the desired font. Otherwise, the user
will call CairoFontMatch with verbose=TRUE to determine other properties to add to
the pattern to attain the desired font, for instance the fontformat.

The following excerpt is from the fontconfig user's manual (http://fontconfig.org/) and
better describes the fontconfig pattern definition:

"Fontconfig provides a textual representation for patterns that
the library can both accept and generate. The representation is
in three parts, first a list of family names, second a list of
point sizes and finally a list of additional properties:

<families>-<point sizes>:<name1>=<values1>:<name2>=<values2>...
	
Values in a list are separated with commas. The name needn't
include either families or point sizes; they can be elided. In
addition, there are symbolic constants that simultaneously
indicate both a name and a value. Here are some examples:

\preformatted{
Font Pattern                    Meaning
----------------------------------------------------------
Times-12                        12 point Times Roman
Times-12:bold                   12 point Times Bold
Courier:italic                  Courier Italic in the default size
Monospace:matrix=1 .1 0 1       The users preferred monospace font
                                with artificial obliquing
}

The '\', '-', ':' and ',' characters in family names
must be preceeded by a '\' character to avoid having them
misinterpreted. Similarly, values containing '\', '=', '_', ':'
and ',' must also have them preceeded by a '\' character. The
'\' characters are stripped out of the family name and values
as the font name is read."
}

\section{Known issues}{
  \itemize{
  	\item This function is only available when the Cairo graphics library is configured
	with FreeType and FontConfig support.
  }
}
\seealso{
  \code{\link{CairoFonts}},
  \code{\link{Cairo}}
}
\keyword{device}
