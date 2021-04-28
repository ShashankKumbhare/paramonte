
####################################################################################################################################
################################## file ############################################################################################
# >>
#' @param file
#' (optional)\cr
#' A string representing the path to the chain / markovchain / sample / report / restart / progress file with the default value of `""`.
#' The path only needs to  uniquely identify the name of the simulation to which the chain file belongs.\cr
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
