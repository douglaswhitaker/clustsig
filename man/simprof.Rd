\name{simprof}
\alias{simprof}
\title{Similiarity Profile Analysis}
\description{A tool for determining the number of significant clusters
  produced using hclust() with the assumption of no a priori groups.
}
\usage{
simprof(data, num.expected=1000, num.simulated=999,
method.cluster="average", method.distance="euclidean", 
method.transform="identity", alpha=0.05,
sample.orientation="row", const=0,
silent=TRUE, increment=100,
undef.zero=TRUE, warn.braycurtis=TRUE)
}
\arguments{
  \item{data}{Input data in a matrix.}
  \item{num.expected}{The number of similarity profiles to generate for
    creating the expected distribution of the data. This value should be
  large.}
  \item{num.simulated}{The number of similarity profiles to generate for
    use in comparing the observed test statistic with its null
    distribution. This value should be large.}
  \item{method.cluster}{The method of clustering to use with
    \code{\link{hclust}}. Standard values from \code{hclust} are \code{"ward"}, \code{"single"},
    \code{"complete"}, \code{"average"}, \code{"mcquitty"}, \code{"median"} or \code{"centroid".}}
  \item{method.distance}{This value should be either an option to pass
    to the function \code{\link{dist}} (standard values are \code{"euclidean", "maximum",
    "manhattan", "canberra", "binary" or "minkowski"}), \code{"braycurtis"} or \code{"czekanowski"} for
    Czekanowski Dissimilarity (referred to as Bray-Curtis Disimilarity in some fields, particularly 
    marine biology), or \code{"actual-braycurtis"} for the true Bray-Curtis Dissimilarity where the 
    data are standardized before the dissimilarity is calculated. This value can also be any function 
    which returns a \code{"dist"} object.}
  \item{method.transform}{An option to specify a transform, if any, to
    be applied to the data. Possible values are \code{"identity"} (no
    transformation), \code{"squareroot"}, \code{"log"}, \code{"PA"}
    (Presence/Absence), or any numeric value (of type
    \code{"double"}). This transform is applied before the adjustment
    constant is applied, so choose a constant accordingly.}
  \item{alpha}{The alpha level at which to reject the null
    hypothesis. If the null is rejected, the test continues and tests
    each sub-tree recursively until either all subtrees are exhausted
    by reaching the individual level or there are no significant
    distance. Due to the nature of multiple testing inherent in this
    process, care should be taken when choosing this alpha level.}
  \item{sample.orientation}{The orientation of the data, either \code{"row"} or
    \code{"column"}. The practical effect of this is that the transpose will be
    examined if \code{"column"} is chosen.}
  \item{const}{The value of the constant to be used in adjusting the
    Bray-Curtis Dissimilarity coefficient, if any is to be used. Any
    positive value of \code{"const"} will be appended as a new variable
    to each sample, acting as a sort of \dQuote{dummy species} (where that
    interpretation is appropriate).}
  \item{silent}{A logical value indicating whether anything should be
    printed during the code execution. If \code{FALSE}, a message will
    be printed every \code{increment} (see below) number of times in the
    main looping procedure. This was implemented because the code can
    take a while to run due to many permutations and its recursive
    nature; however, for the same reason, many messages could be
    printed.}
  \item{increment}{An integer value indicating, if \code{silent=FALSE},
    one which iterations a message should be printed. (If the iteration
    number modulus \code{increment} equals 0, that number will be printed.)}
  \item{undef.zero}{A logical value indicating whether undefined values arising from a
    denominator equal to 0 in the Bray-Curtis/Czekanowski Dissimilarity Indices should result
    in \code{NA} or 0. This defaults to \code{TRUE} so that NA values are replaced by 0. This
    default is to retain backward compatibility with the previous version of the package but
    may be changed in a future release.}
  \item{warn.braycurtis}{A logical value indicating whether a warning should be printed
    when using the \code{"braycurtis"} option because of the naming confusion in some fields
    with the Czekanowski Dissimilarity Index. This defaults to \code{TRUE} but may change in
    future releases. For more information, see Yoshioka (2008) listed in the references.}
}
\value{A list object is produced with the following components:
  \item{numgroups}{The number of groups which are found to be
    statistically significant.}
  \item{significantclusters}{A list of length numgroups with each
    element containing the sample IDs (row/column numbers in the
    corresponding original data) that are in each significant cluster.}
  \item{pval}{The merge component from the hclust results with an extra
    column of p-values. These p-values are for testing whether the two
    groups in that row are statistically different.}
  \item{hclust}{An object of class hclust which is just the results of
    running hclust on the original data.}
}
\references{Clarke, K.R., Somerfield, P.J., and Gorley, R.N.,
  2008. Testing of null hypotheses in exploratory community analyses
  similarity profiles and biota-environment
  linkage. \emph{J. Exp. Mar. Biol. Ecol.} \bold{366}, 56--69.
  
  Yoshioka, P.M., 2008. Misidentification of the Bray-Curtis similarity index. \emph{Mar. Ecol. Prog. Ser.} \bold{368}, 309--310.
  }
\author{Douglas Whitaker and Mary Christman}
\seealso{
  \code{\link{hclust}}
}
\examples{
\dontrun{
# Load the USArrests dataset included with R
# And use abbreviations of state names
# We leave out the third column because
# it is on a different scale
usarrests<-USArrests[,c(1,2,4)]
rownames(usarrests)<-state.abb
# Run simprof on the data
res <- simprof(data=usarrests, 
method.distance="braycurtis")
# Graph the result
pl.color <- simprof.plot(res)
}
} 
\keyword{cluster}
\keyword{similarity profile}
\keyword{significant cluster}
\keyword{cluster analysis}

  