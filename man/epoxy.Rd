% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/engines.R
\name{epoxy}
\alias{epoxy}
\alias{epoxy_html}
\alias{epoxy_latex}
\title{Epoxy string interpolation}
\usage{
epoxy(
  ...,
  .data = NULL,
  .style = NULL,
  .sep = "",
  .envir = parent.frame(),
  .open = "{",
  .close = "}",
  .na = "",
  .null = "",
  .comment = character(),
  .literal = FALSE,
  .trim = FALSE,
  .transformer = NULL
)

epoxy_html(
  ...,
  .data = NULL,
  .style = NULL,
  .sep = "",
  .envir = parent.frame(),
  .open = "{{",
  .close = "}}",
  .na = "",
  .null = "",
  .comment = "",
  .literal = FALSE,
  .trim = FALSE,
  .transformer = NULL
)

epoxy_latex(
  ...,
  .data = NULL,
  .style = NULL,
  .sep = "",
  .envir = parent.frame(),
  .open = "<",
  .close = ">",
  .na = "",
  .null = "",
  .comment = "",
  .literal = FALSE,
  .trim = FALSE,
  .transformer = NULL
)
}
\arguments{
\item{...}{[\code{expressions}]\cr Unnamed arguments are taken to be expression
string(s) to format. Multiple inputs are concatenated together before formatting.
Named arguments are taken to be temporary variables available for substitution.}

\item{.data}{A data set}

\item{.style}{For \code{\link[=epoxy_style]{epoxy_style()}}}

\item{.sep}{[\code{character(1)}: \sQuote{""}]\cr Separator used to separate elements.}

\item{.envir}{[\code{environment}: \code{parent.frame()}]\cr Environment to evaluate each expression in. Expressions are
evaluated from left to right. If \code{.x} is an environment, the expressions are
evaluated in that environment and \code{.envir} is ignored. If \code{NULL} is passed, it is equivalent to \code{\link[=emptyenv]{emptyenv()}}.}

\item{.open}{[\code{character(1)}: \sQuote{\\\{}]\cr The opening delimiter around
the template variable or expression. Doubling the full delimiter escapes
it.}

\item{.close}{[\code{character(1)}: \sQuote{\\\}}]\cr The closing delimiter
around the template variable or expression. Doubling the full delimiter
escapes it.}

\item{.na}{[\code{character(1)}: \sQuote{NA}]\cr Value to replace \code{NA} values
with. If \code{NULL} missing values are propagated, that is an \code{NA} result will
cause \code{NA} output. Otherwise the value is replaced by the value of \code{.na}.}

\item{.null}{[\code{character(1)}: \sQuote{character()}]\cr Value to replace
NULL values with. If \code{character()} whole output is \code{character()}. If
\code{NULL} all NULL values are dropped (as in \code{paste0()}). Otherwise the
value is replaced by the value of \code{.null}.}

\item{.comment}{[\code{character(1)}: \sQuote{#}]\cr Value to use as the comment
character.}

\item{.literal}{[\code{boolean(1)}: \sQuote{FALSE}]\cr Whether to treat single or
double quotes, backticks, and comments as regular characters (vs. as
syntactic elements), when parsing the expression string. Setting \code{.literal = TRUE} probably only makes sense in combination with a custom
\code{.transformer}, as is the case with \code{glue_col()}. Regard this argument
(especially, its name) as experimental.}

\item{.trim}{[\code{logical(1)}: \sQuote{TRUE}]\cr Whether to trim the input
template with \code{\link[glue:trim]{trim()}} or not.}

\item{.transformer}{[\verb{function]}\cr A function taking three parameters \code{code}, \code{envir} and
\code{data} used to transform the output of each block before, during, or after
evaluation. For example transformers see \code{vignette("transformers")}.}
}
\value{
Returns a transformed string, using \code{glue::glue()} but with the
additional transformers provided to the \code{.style} argument of \code{epoxy()}.
}
\description{
The functions power the knitr chunk engines and are wrappers around
\code{\link[glue:glue]{glue::glue()}}, with a few extra conveniences provided by \pkg{epoxy}.
}
\section{Functions}{
\itemize{
\item \code{epoxy()}: super \code{glue()}

\item \code{epoxy_html()}: super \code{glue()} for HTML

\item \code{epoxy_latex()}: super \code{glue()} for LaTeX

}}
\examples{
movie <- bechdel[1, ]
movies <- bechdel[2:4, ]

epoxy("*{movie$title}* ({movie$year}) was directed by {movie$director}.")
epoxy("- *{movies$title}* ({movies$year}) was directed by {movies$director}.")

epoxy("*{title}* ({year}) was directed by {director}.", .data = movie)
epoxy("- *{title}* ({year}) was directed by {director}.", .data = movies)

epoxy(
  "{title} ({year}) was directed by {director}.",
  .data = movie,
  .style = "bold"
)

epoxy(
  "I'd be happy to watch { title| }.",
  .data = movies,
  .style = c("italic", "collapse")
)

epoxy(
  "They were directed by { director& }.",
  .data = movies,
  .style = c("collapse", "bold")
)

epoxy("The budget for *{title}* was {.dollar budget}.", .data = movie)

epoxy_html(
  "I'd be happy to watch {{ title| }}.",
  .data = movies,
  .style = c("italic", "collapse")
)

epoxy_latex(
  "I'd be happy to watch < title| >.",
  .data = movies,
  .style = c("italic", "collapse")
)
}
