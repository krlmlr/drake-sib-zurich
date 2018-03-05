# Before starting: Save this file as make-with-files.R!

# Set compatibility option
pkgconfig::set_config_in("drake::strings_in_dots" = "literals", .in = getNamespace("drake"))

library(dplyr)
library(drake)
library(cooking)

# 1. Save this file as `make-solution.R`, do not edit `make.R`.
#
# 2. Below, the full plan for creating the ragout is repeated.
#    Substitute the string `"meat"` with code that reads the `raw-meat.txt` file,
#    and finally write the result to a file `ragout.rds` with `saveRDS()`.
#    Remember to use `file_in()` and `file_out()`!
#
# 3. Run the script.
#
# 4. Edit the `raw-meat.txt` file.
#
# 5. Run `make()`. Do the results align with your expectations?
#
# 6. Create a new text file and use it instead of `raw-meat.txt`. Run `make()`
#    again.
#
# 7. Open the file `cooking-with-files.Rmd`, knit it. How does the code in the
#   `.Rmd` document access the targets we just built?
#
# 8. Extend the plan to knit the document via `rmarkdown::render()`. Remember to
#    use `knitr_in()` for the input file.
#
# 9. Verify that the `.Rmd` is processed if you change inputs or commands.


# TODO: `meat` should be read from the text file
plan_meat <- drake_plan(
  meat = buy("meat", from = "the butcher shop"),
  chopped_meat = chop(meat),
  fried_meat = fry(chopped_meat, with = c("oil", "garlic"))
)

plan_carrots <- drake_plan(
  carrots = buy("carrots"),
  peeled_carrots = peel(carrots)
)

prepare_potatoes <- function(potatoes) {
  peeled_potatoes <- peel(potatoes)
  cooked_potatoes <- cook(peeled_potatoes, with = "salt")
  cooked_potatoes
}

plan_potatoes <- drake_plan(
  potatoes = buy("potatoes"),
  cooked_potatoes = prepare_potatoes(potatoes)
)

# TODO: Write the `ragout` object to an `.rds` file via `saveRDS()`
plan_ragout <- drake_plan(
  ragout = combine(fried_meat, peeled_carrots, cooked_potatoes)
)

plan <- bind_rows(plan_meat, plan_carrots, plan_potatoes, plan_ragout)

make(plan)
