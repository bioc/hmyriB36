\name{hmyriB36}
\docType{package}
\alias{hmyriB36}
\alias{hmyriB36-package}
\alias{ex}
\title{representations of HapMap phaseII snp data + expression data}
\description{
representations of HapMap snp data + expression data
}
\format{ExpressionSet and SnpMatrix instances to be combined using getSS}
\usage{
# getSS("hmyriB36", "20")  # for example, to get full expression, + genotypes
           # on chr20
}
\details{
Instances of class \code{\link[GGBase:smlSet-class]{smlSet}} are
created from two basic sources.  

First, the expression data for 90 YRI families 
were obtained from SANGER GENEVAR project.

Second, data on forward non-redundant SNPs in these individuals
the HapMap build 36 ftp site (r23a) in march 2008.  Full provenance information
still to be supplied.
}
\value{
instances of class \code{\link[GGBase:smlSet-class]{smlSet}}
}
\references{ 
Cheung VG., Spielman RS., Ewens KG., Weber TM., Morley M & Burdick JT.:
\emph{Mapping determinants of human gene expression by regional and whole
genome association.} Nature, 437: 1365-1369, 2005 
 }
\author{Vince Carey <stvjc@channing.harvard.edu>}
\note{ As of March 2011 the smlSet is no longer serialized.  Instead,
use \code{getSS("hmyriB36", [chrs])} to create an smlSet with all
probes and selected chromosomes.  There is an instance of
\code{\link[Biobase]{ExpressionSet-class}} named \code{ex} in the
\code{data} folder of this package that will be united with genotype data using
\code{\link[GGBase]{getSS}}.  }


%\seealso{  }

\examples{
library(GGtools)
hmyriB36 = getSS("hmyriB36", c("20"))  # just 1 chromosome
exprs(hmyriB36)[1:4,1:4]
as(smList(hmyriB36)[[1]][1:4,1:4], "character")
library(GGtools)
library(illuminaHumanv1.db)
cptag = get("CPNE1", revmap(illuminaHumanv1SYMBOL))
tt = eqtlTests(hmyriB36[probeId(cptag),] , ~male)
topFeats(probeId(cptag), mgr=tt, ffind=1)
}
\keyword{ packages }
