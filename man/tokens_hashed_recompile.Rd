% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tokens.R
\name{tokens_hashed_recompile}
\alias{tokens_hashed_recompile}
\title{recompile a hashed tokens object}
\usage{
tokens_hashed_recompile(x, method = c("C++", "R"))
}
\arguments{
\item{x}{the \link{tokens} object to be recompiled}

\item{method}{\code{"C++"} for C++ implementation or \code{"R"} for an older
R-based method}
}
\description{
This function recompiles a hashed tokens object when the vocabulary has been
changed in a way that makes some of its types identical, such as lowercasing
when a lowercased version of the type already exists in the hash table, or
introduces gaps in the integer map of the types.  It also reindexes the types
atttribute to account for types that may have become duplicates, through a
procedure such as stemming or lowercasing; or the addition of new tokens
through compounding.
}
\examples{
# lowercasing
toks1 <- tokens(c(one = "a b c d A B C D",
                 two = "A B C d"))
attr(toks1, "types") <- char_tolower(attr(toks1, "types"))
unclass(toks1)
unclass(quanteda:::tokens_hashed_recompile(toks1))

# stemming
toks2 <- tokens("Stemming stemmed many word stems.")
unclass(toks2)
unclass(quanteda:::tokens_hashed_recompile(tokens_wordstem(toks2)))

# compounding
toks3 <- tokens("One two three four.")
unclass(toks3)
unclass(tokens_compound(toks3, "two three"))

# lookup
dict <- dictionary(list(test = c("one", "three")))
unclass(tokens_lookup(toks3, dict))

# empty pads
unclass(tokens_select(toks3, dict))
unclass(tokens_select(toks3, dict, pad = TRUE))

# ngrams
unclass(tokens_ngrams(toks3, n = 2:3))

}
\author{
Kenneth Benoit and Kohei Watanabe
}
\keyword{internal}
\keyword{tokens}
