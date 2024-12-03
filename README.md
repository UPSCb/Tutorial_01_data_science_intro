# RnaSeqTutorial01

Introduction to Data Science tutorial based on learnr

## Installation

In R do the following to install the dependencies

```R
if(!require("BiocManager")) {install.packages("BiocManager")}
BiocManager::install(c("here","learnr","palmerpenguins","tidyverse"))
```

Then install the package using _e.g._ `pak`

 ```R
 if(!require("pak")){BiocManager::install("pak")}
 pak::pkg_install("UPSCb/Tutorial_01_data_science_intro")
 ```

## Getting started

This is the first in a series of tutorials.

1. 01_data_science_intro: an introduction to data science using the `palmerpenguins` package
2. 02_exploratory_data_analysis: the exploratory data analysis of a public RNA-Seq dataset
3. 03_differential_gene_expression: the differential expression DE analysis of the same dataset
4. 04_gene_set_enrichment_analysis: gene set enrichment analysis (GSEA) on the DE gene sets
5. 05_ensemble_gene_set_enrichment_analysis: ensemble GSEA of the DE gene sets and comparison to GSEA
6. 06_differential_transcript_usage: the differential transcript usage analysis of the same dataset
7. 07_non_model_organism_exploratory_data_analysis: the exploratory data analysis of a Norway spruce RNA-Seq dataset
8. 08_non_model_organism_differential_gene_expression: the differential expression DE analysis of the Norway spruce RNA-Seq dataset

To start the tutorial run:

1. if you have installed the package
  
  ```{r tutorial}
  learnr::run_tutorial("01_data_science_intro", package = "RnaSeqTutorial01")
  ```

2. if you have cloned the repository in a new project



## Accessing the code

### Tutorials

The tutorial is available as `.Rmd` files in the `tutorials` directory:

```{r tutorial list}
dir(system.file(package="RnaSeqTutorial01","tutorials"))
```

```{r tutorial paths}
list.files(path=system.file(package="RnaSeqTutorial01","tutorials"),
           pattern="*.Rmd",
           recursive=TRUE)
```

### Scripts

There is a script available in the `script` directory:

```{r script paths}
list.files(path=system.file(package="RnaSeqTutorial01","scripts"),
           pattern="*.R",
           recursive=TRUE)
```
