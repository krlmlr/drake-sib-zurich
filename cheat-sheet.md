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

