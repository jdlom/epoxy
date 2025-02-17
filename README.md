
<!-- README.md is generated from README.Rmd. Please edit that file -->

# epoxy <a href='http://pkg.garrickadenbuie.com/epoxy'><img src='man/figures/logo.png' align="right" height="139" /></a>

<!-- badges: start -->

[![epoxy r-universe
badge](https://gadenbuie.r-universe.dev/badges/epoxy)](https://gadenbuie.r-universe.dev)
[![R-CMD-check](https://github.com/gadenbuie/epoxy/workflows/R-CMD-check/badge.svg)](https://github.com/gadenbuie/epoxy/actions)
<!-- badges: end -->

epoxy makes templating with [glue](https://glue.tidyverse.org) easy in R
Markdown documents and Shiny apps.

## Installation

You can install the latest version of epoxy with
[remotes](https://remotes.r-lib.org)

``` r
# install.packages("remotes")
remotes::install_github("gadenbuie/epoxy")
```

or from [gadenbuie.r-universe.dev](https://gadenbuie.r-universe.dev).

``` r
options(repos = c(
  gadenbuie = "https://gadenbuie.r-universe.dev/",
  getOptions("repos")
))

install.packages("epoxy")
```

## Setup

``` r
library(epoxy)
```

Loading epoxy adds four new [knitr
engines](https://bookdown.org/yihui/rmarkdown/language-engines.html), or
chunk types. Each type lets you intermix text with R code or data
(`expr` in the table below), and each is geared toward a different
output context.

| Engine        | Output Context       |                         Delimiter                         |
| :------------ | :------------------- | :-------------------------------------------------------: |
| `epoxy`       | all-purpose markdown |                         `{expr}`                          |
| `epoxy_html`  | HTML                 |                        `{{expr}}`                         |
| `epoxy_latex` | LaTeX                |                         `<expr>`                          |
| `whisker`     | all-purpose          | [mustache template language](https://mustache.github.io/) |

⚠️ **Caution:** Previously, epoxy provided a `glue` engine, but this
conflicts with a similar chunk engine by the
[glue](https://glue.tidyverse.org) package. You can update existing
documents to use the `epoxy` engine, or you can explicitly use epoxy’s
`glue` chunk by including the following in your setup chunk.

``` r
use_epoxy_glue_engine()
```

## Use epoxy

To use epoxy in your R Markdown document, create a new chunk using the
engine of your choice. In that chunk, write in markdown, HTML, or LaTeX
as needed, wrapping R expressions inside the delimiters for the epoxy
chunk.

```` default
```{epoxy}
The average speed of the cars was **{mean(cars$speed)} mph.**
But on average the distance traveled was only _{mean(cars$dist)}_.
```
````

The average speed of the cars was **15.4 mph**. But on average the
distance traveled was only *42.98 ft*.

`epoxy` is built around `glue::glue()`, which evaluates the R
expressions in the `{ }` and inserts the results into the string. The
chunk above is equivalent to this call to `glue::glue()`:

``` r
glue::glue("The average speed of the cars was **{mean(cars$speed)} mph**.
But on average the distance traveled was only _{mean(cars$dist)} ft_.")
#> The average speed of the cars was **15.4 mph**.
#> But on average the distance traveled was only _42.98 ft_.
```

One immediate advantage of using `epoxy` instead of `glue::glue()` is
that RStudio’s autocompletion feature works inside `epoxy` chunks\!
Typing `cars$` in the chunk will suggest the columns of `cars`.

## Learn more

There’s a whole lot more that epoxy can do\! Learn more:

  - [epoxy Package Documentation](https://pkg.garrickadenbuie.com/epoxy)

  - [Getting
    Started](https://pkg.garrickadenbuie.com/epoxy/articles/epoxy.html)

  - [Inline Reporting with
    epoxy](https://pkg.garrickadenbuie.com/epoxy/articles/inline-reporting.html)
