

####################################################################################################################################
################################## templateReadRoutines ############################################################################
# >>
#' @title templateReadRoutines
#'
####################################################################################################################################
################################## file ############################################################################################
# >>
#' @param file
#' (optional)\cr
#' A string representing the path to the chain file with the default value of `""`. The path only needs to
#' uniquely identify the name of the simulation to which the chain file belongs.\cr
#' For example, specifying "./mydir/mysim" as input will lead to a search for a file that begins with
#' "mysim" and ends with "_chain.txt" inside the directory "./mydir/".\cr
#' If there are multiple files with such name, then all of them will be read and returned as a list.\cr
#' If this input argument is not provided by the user, the value of the object's `spec` attribute
#' `outputFileName` will be used instead.\cr
#' If the specified path is a URL, the file will be downloaded as a temporary file to the local system
#' and its contents will be parsed and the file will be subsequently removed.\cr
#' If no input is specified via any of the possible routes, the method will search for any possible
#' candidate file with the appropriate suffix in the current working directory.
# <<
################################## file ############################################################################################
####################################################################################################################################

####################################################################################################################################
################################## delimiter########################################################################################
# >>
#' @param delimiter
#' (optional)\cr
#' Optional input string representing the delimiter used in the output chain file. If it is not provided
#' as input argument, the value of the corresponding object's `spec` attribute `outputDelimiter` will be
#' used instead. If none of the two are available, the default comma delimiter `","` will be assumed and used.
# <<
################################## delimiter########################################################################################
####################################################################################################################################

####################################################################################################################################
################################## parseContents ###################################################################################
# >>
#' @param parseContents
#' (optional)\cr
#' If set to `TRUE`, the contents of the file will be parsed and stored in a component of the object named `contents`.\cr
#' The default value is `TRUE`.
# <<
################################## parseContents ###################################################################################
####################################################################################################################################

####################################################################################################################################
################################## renabled ########################################################################################
# >>
#' @param renabled
#' (optional)\cr
#' If set to `FALSE`, the contents of the file(s) will be stored as a list in a (new) component of the ParaDRAM object
#' named `chainList` and `NULL` will be the return value of the method. If set to `TRUE`, the reverse will done.\cr
#' The default value is `FALSE`.
#' @return Return a R list of objects, each of which corresponds to the contents of a unique chain file. Each object has the
#' following components:
# <<
################################## renabled ########################################################################################
####################################################################################################################################

#' @return NULL
#' }
templateReadRoutines <- function(x) {
  return( NULL )
}
# <<
################################## templateReadRoutines ############################################################################
####################################################################################################################################
