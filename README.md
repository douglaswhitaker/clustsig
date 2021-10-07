# clustsig

## About

This package implements the *similarity profile analysis* method described by Clarke, Somerfield, and Gorley (2008) [<a href="https://doi.org/10.1016/j.jembe.2008.07.009">DOI</a>, <a href="http://www.pelagicos.net/MARS6300/readings/Clarke_et_al._2008.pdf">PDF</a>]. This is technique for determining statistically significant clusters identified by a hierarchical agglomerative clustering technique (such as implemented by `hclust` in R). 

## Installation

The latest version (v1.1, released in 2014) is available on CRAN. Install the usual way:

```
install.packages("clustsig")
```

## Note about development

I wrote this R package in graduate school and first released it in 2010. The development work was done at the University of Florida's Institute of Food and Agricultural Sciences (UF/IFAS) with my advisor Mary Christman. This R package was first released in 2010 (v1.0), and some minor bugfixes were made in 2014 (v1.1). However, my research focus changed substantially shortly after I released the package. I have not seriously worked on this package since 2010. If you have questions, bugfixes, improvements, enhancements, etc. please feel free to reach out to me, but my ability to provide extremely technical help with the package might be limited. I am open pull requests and the like that improve the package.

## Frequently asked questions

I will try to document questions that I am asked here.

**Q: A symmetric matrix (of distances) is all that is required to use `hclust`. Is such a matrix sufficient for using `simprof`, or is the raw data required?**

A: The raw data are required because the similarity profiles that are used to determine which clusters are statistically significant are constructed by permuting the data. A symmetric matrix (of distances) is a matrix of summary statistics and cannot be used to permute the raw data. 
