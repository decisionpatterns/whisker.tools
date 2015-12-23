whisker.tools
===============
Extensions to the R whisker package

The `whisker.tools` package provides missing functionality to Edwin de Jonge's `whisker library`. Whisker implements the `mustache` specification in R; mustache is a language agnostic, logicless template system. The `whisker` provides all the functionality for injecting variables into templates, but falls short of programmatic needs for working with templates. For example, often it is desirable to know what variables are used in the template. This is where `whisker.tools` steps in.  `whisker.tools` provides a set of common utilities for parsing whisker templates.


Mustache syntax
---------------

The syntax of Mustache templates is described in http://mustache.github.com/mustache.5.html 
How the mustache template are used with whisker can be found in the whisker documentation, and below.

Mustache specification
----------------------
Whisker conforms to the [Mustache 1.1 specificaton](https://github.com/mustache/spec) except for delimiter switching and
lambdas. We expect that these will be implented shortly.

Installation
============

The latest whisker.tools version is not yet available on CRAN, but can be installed from github:

```r
library(devtools)

# dev_mode()
install_github("whisker", "edwindj")
```

Usage
-----

- tk

