whisker.tools
===============
Extensions to the R whisker package

The `whisker.tools` package provides missing functionality to Edwin de Jonge's excellent  `whisker library`. Whisker implements the  [mustache](https://mustache.github.io/) mustache language agnostic, logicless template specification in R. The `whisker` provides all the functionality for injecting variables into templates, but falls short of programmatic needs for working with templates. For example, often it is desirable to know what variables are used in the template. This is where `whisker.tools` steps in.  `whisker.tools` provides several enhancemence to increase `whisker`'s utility.  These include variable for extracting the names found in a template (`whisker_names`) as well as finding those names on the stack (`whisker_get_all`).


Important Functions 
-------------------

- `whisker_names` : Extract varaibles names from a whisker template, like `ls` or names applied to a template.
- `whisker_get_all` : Find all of a templates names on the call stack, like `get`.
- `whisker_mapply` : repeatedly render a template over multiple arguments
- `whisker_path` : Treat arguments to `file.path` as if they were a

Mustache syntax
---------------

The syntax of Mustache templates is described [here](http://mustache.github.com/mustache.5.html). 
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

