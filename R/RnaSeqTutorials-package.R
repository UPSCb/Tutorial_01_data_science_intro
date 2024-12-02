# RnaSeqTutorial01 package
#
# * To find the imported packages, in the terminal
#
# ---
# cd inst
# grep "library(" */*/*.Rmd | sed -e 's:.*library::g' | tr -d '()' | sort | uniq
# ---
#
# * To build the DESCRIPTION Imports string
#
# ---
# library(here)
# pkgs <- c("learnr","palmerpenguins","tidyverse")
# write(paste0("    ",pkgs," (>= ",unlist(installed.packages()[pkgs,"Version"],use.names=FALSE),"),"),
#       file="Imports.tmp")
# ---
#
#' @title RnaSeqTutorials package
#' @section Tutorials:
#' This is the first in a series of tutorials
#' \itemize{
#' \item\code{01_data_science_intro} an introduction to data science using the palmerpenguins package
#' }
#'
#' @name RnaSeqTutorial01 package
#' @rdname RnaSeqTutorial01-package
#' @author Nicolas Delhomme [aut,cre]
#' @keywords package
#' @description A simple description of the RnaSeqTutorials package
#' @seealso The vignette
#' @examples
#' 	\dontrun{
#' 	learnr::run_tutorial("01_data_science_intro", package = "RnaSeqTutorial01")
#' 	}
#' @keywords internal
"_PACKAGE"
#'
NULL
