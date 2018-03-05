# cooking-with-files

1. Save this file as `make-solution.R`, do not edit `make.R`.

2. Below, the full plan for creating the ragout is be repeated.
   Substitute the string `"meat"` with code that reads the `raw-meat.txt` file,
   and finally write the result to a file `ragout.rds` with `saveRDS()`.
   Remember to use `file_in()` and `file_out()`!

3. Run the script.

4. Edit the `raw-meat.txt` file.

5. Run `make()`. Do the results align with your expectations?

6. Create a new text file and use it instead of `raw-meat.txt`. Run `make()`
   again.

7. Open the file `cooking-with-files.Rmd`, knit it. How does the code in the
  `.Rmd` document access the targets we just built?

8. Extend the plan to knit the document via `rmarkdown::render()`. Remember to
   use `knitr_in()` for the input file.

9. Verify that the `.Rmd` is processed if you change inputs or commands.
