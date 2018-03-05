# Basic operations

`drake_plan()`: Create plan

```r
plan <- drake_plan(
  target = fun(dep1, dep2, ...),
  ...
)
```

`make()`: Execute plan

```r
make(plan)
make(plan, jobs = ...) # parallel
make() # make last plan again
```

`readd()`: Read single target

```r
target <- readd("target")
```

`loadd()`: Load targets into an environment

```r
loadd()
loadd(starts_with(dep))
```

# Diagnosis

`check_plan()`: Check plan

```r
check_plan(plan)
```

`drake_config()`: Configuration object

```r
config <- drake_config(plan)
```

`vis_drake_graph()`: Visualize graph

```r
vis_drake_graph(config)
```

`outdated()`: List out-of-date targets

```r
outdated(config)
```

`diagnose()`: Show problems

```r
diagnose("target")
```

# Project organization

All files belong in your *project directory*. Start R somewhere below, and you don't need `setwd()`.

- RStudio project
- Git repository
- `.here` file

`here::here()`: Find files below your project directory

```r
library(here)
## here() starts at ...
here("path", "to", "file.txt")
here("path/to/file.txt")
```

`here::dr_here()`: Understand your project directory

`here::set_here()`: Create `.here` file

# Files

`file_in()`, `file_out()`: Mark strings as input and output files.

```r
plan <- drake_plan(
  text = readLines(file_in("in.txt")),
  writeLines(text, file_out("out.txt"))
)
```

`knitr_in()`: Mark a string as input file for *knitr*.

```r
plan <- drake_plan(
  rmarkdown::render(knitr_in("report.Rmd"), output_file = file_out("report.md"))
)
```

# Dynamic plans

`evaluate_plan()`, `plan_analyses()`, `plan_summaries()`, `expand_plan()`, `gather_plan()`
