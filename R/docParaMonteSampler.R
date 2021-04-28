
####################################################################################################################################
################################## getDocParaMonteSamplerDescription ###############################################################
# >>
getDocParaMonteSamplerDescription = function( type ) {

  if( type == "markovChain" ) { details = " unweighted verbose (Markov-chain)" }
  else                        { details = "" }

  doc = paste0(
"Return a list of the", details, " contents of a set of ParaDRAM output ", type, " files whose names
begin the user-provided input file prefix, or as specified by the input simulation specification
`SAMPLER$spec$outputFileName`, where SAMPLER can be an instance of any one of the ParaMonte's sampler
classes, such as `ParaDRAM`.
### NOTE
This method is to be only used for postprocessing of the output ", type, " file(s) of an already finished
ParaDRAM simulation.\\cr
It is not meant to be called by all processes in parallel mode, although it is possible.")

  return( doc )

}
# <<
################################## getDocParaMonteSamplerDescription ###############################################################
####################################################################################################################################


####################################################################################################################################
################################## getDocParaMonteSamplerDescriptionRestartWarning #################################################
# >>
getDocParaMonteSamplerDescriptionRestartWarning = function( ) {

  doc = paste0(
"### WARNING
Only restart output files in **ASCII format** can be read via this method. The binary restart files
are NOT meant to be parsed via this method. To request for ASCII restart output files in simulations,
set the input simulation specification\\cr
\\cr
`SAMPLER$spec$restartFileFormat = 'ascii'`\\cr
\\cr
where `SAMPLER` can be an instance of any one of the ParaMonte's sampler classes, such as `ParaDRAM`.")

  return( doc )

}
# <<
################################## getDocParaMonteSamplerDescriptionRestartWarning #################################################
####################################################################################################################################


####################################################################################################################################
################################## getDocParaMonteSamplerParamFile  ################################################################
# >>
getDocParaMonteSamplerParamFile = function( type ) {

    doc = paste0(
"(optional)\\cr
A string representing the path to the ", type, " file with the default value of `''`. The path only
needs to  uniquely identify the name of the simulation to which the ", type, " file belongs.\\cr
For example, specifying './mydir/mysim' as input will lead to a search for a file that begins with
'mysim' and ends with '_", type, ".txt' inside the directory './mydir/'.\\cr
If there are multiple files with such name, then all of them will be read and returned as a list.\\cr
If this input argument is not provided by the user, the value of the object's `spec` attribute
`outputFileName` will be used instead.\\cr
If the specified path is a URL, the file will be downloaded as a temporary file to the local system
and its contents will be parsed and the file will be subsequently removed.\\cr
If no input is specified via any of the possible routes, the method will search for any possible
candidate file with the appropriate suffix in the current working directory.")

    return( doc )

}
# <<
################################## getDocParaMonteSamplerParamFile  ################################################################
####################################################################################################################################


####################################################################################################################################
################################## getDocParaMonteSamplerParamDelimiter  ###########################################################
# >>
getDocParaMonteSamplerParamDelimiter = function( type ) {

  doc = paste0(
"(optional)\\cr
Optional input string representing the delimiter used in the output ", type, " file.
If it is not provided as input argument, the value of the corresponding object's `spec` attribute
`outputDelimiter` will be used instead. If none of the two are available, the default comma delimiter
`','` will be assumed and used.")

  return( doc )

}
# <<
################################## getDocParaMonteSamplerParamDelimiter  ###########################################################
####################################################################################################################################


####################################################################################################################################
################################## getDocParaMonteSamplerParamParseContents  #######################################################
# >>
getDocParaMonteSamplerParamParseContents  = function( type ) {

  doc = paste0(
"(optional)\\cr
If set to `TRUE`, the contents of the ", type, " file will be parsed and stored in a component of the
object named `contents`.\\cr
The default value is `TRUE`.")

  return( doc )

}
# <<
################################## getDocParaMonteSamplerParamParseContents  #######################################################
####################################################################################################################################


####################################################################################################################################
################################## getDocParaMonteSamplerParamRenabled #############################################################
# >>
getDocParaMonteSamplerParamRenabled = function( type ) {

  doc = paste0(
"(optional)\\cr
If set to `FALSE`, the contents of the file(s) will be stored as a list in a (new) component of
the ParaDRAM object named `", type, "List`  and `NULL` will be the return value of the method.
If set to `TRUE`, the reverse will done.\\cr
The default value is `FALSE`.")

  return( doc )

}
# <<
################################## getDocParaMonteSamplerParamRenabled #############################################################
####################################################################################################################################


