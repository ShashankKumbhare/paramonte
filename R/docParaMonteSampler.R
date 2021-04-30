
####################################################################################################################################
################################## getDocParaMonteSamplerDescriptionBeginning ######################################################
# >>
getDocParaMonteSamplerDescriptionBeginning = function( type ) {

  if ( type == "markovChain" ) { details = " unweighted verbose (Markov-chain)" }
  else                         { details = "" }

  doc = paste0("

Return a list of the", details, " contents of a set of ParaDRAM output ", type, " files whose names begin the user-provided input
file prefix, or as specified by the input simulation specification `SAMPLER$spec$outputFileName`, where SAMPLER can be an instance
of any one of the ParaMonte's sampler classes, such as `ParaDRAM`.

### Note

- This method is to be only used for postprocessing of the output ", type, " file(s) of an already finished ParaDRAM simulation.
- It is not meant to be called by all processes in parallel mode, although it is possible.

               ")

  return( doc )

}
# <<
################################## getDocParaMonteSamplerDescriptionBeginning ######################################################
####################################################################################################################################


####################################################################################################################################
################################## getDocParaMonteSamplerDescriptionRestartWarning #################################################
# >>
getDocParaMonteSamplerDescriptionRestartWarning = function( ) {

  doc = paste0("

### Warning

- Only restart output files in **ASCII format** can be read via this method. The binary restart files are NOT meant to be parsed
  via this method. To request for ASCII restart output files in simulations, set the input simulation specification

  `SAMPLER$spec$restartFileFormat = 'ascii'`

  where `SAMPLER` can be an instance of any one of the ParaMonte's sampler classes, such as `ParaDRAM`.

               ")

  return( doc )

}
# <<
################################## getDocParaMonteSamplerDescriptionRestartWarning #################################################
####################################################################################################################################


####################################################################################################################################
################################## getDocParaMonteSamplerParamFile  ################################################################
# >>
getDocParaMonteSamplerParamFile = function( type ) {

    doc = paste0("

(optional)

A string representing the path to the ", type, " file with the default value of `''`. The path only needs to  uniquely identify the
name of the simulation to which the ", type, " file belongs.

For example, specifying './mydir/mysim' as input will lead to a search for a file that begins with 'mysim' and ends with '_", type,
".txt' inside the directory './mydir/'.

If there are multiple files with such name, then all of them will be read and returned as a list.

If this input argument is not provided by the user, the value of the object's `spec` attribute `outputFileName` will be used instead.

If the specified path is a URL, the file will be downloaded as a temporary file to the local system and its contents will be parsed
and the file will be subsequently removed.

If no input is specified via any of the possible routes, the method will search for any possible candidate file with the appropriate
suffix in the current working directory.

                 ")

    return( doc )

}
# <<
################################## getDocParaMonteSamplerParamFile  ################################################################
####################################################################################################################################


####################################################################################################################################
################################## getDocParaMonteSamplerParamDelimiter  ###########################################################
# >>
getDocParaMonteSamplerParamDelimiter = function( type ) {

  doc = paste0("

(optional)

Optional input string representing the delimiter used in the output ", type, " file. If it is not provided as input argument, the
value of the corresponding object's `spec` attribute `outputDelimiter` will be used instead. If none of the two are available, the
default comma delimiter `','` will be assumed and used.

               ")

  return( doc )

}
# <<
################################## getDocParaMonteSamplerParamDelimiter  ###########################################################
####################################################################################################################################


####################################################################################################################################
################################## getDocParaMonteSamplerParamParseContents  #######################################################
# >>
getDocParaMonteSamplerParamParseContents  = function( type ) {

  doc = paste0("

(optional)

If set to `TRUE`, the contents of the ", type, " file will be parsed and stored in a component of the object named `contents`.

The default value is `TRUE`.

               ")

  return( doc )

}
# <<
################################## getDocParaMonteSamplerParamParseContents  #######################################################
####################################################################################################################################


####################################################################################################################################
################################## getDocParaMonteSamplerParamRenabled #############################################################
# >>
getDocParaMonteSamplerParamRenabled = function( type ) {

  doc = paste0("

(optional)

If set to `FALSE`, the contents of the file(s) will be stored as a list in a (new) component of the ParaDRAM object named `", type,
"List`  and `NULL` will be the return value of the method. If set to `TRUE`, the reverse will done.

The default value is `FALSE`.

              ")

  return( doc )

}
# <<
################################## getDocParaMonteSamplerParamRenabled #############################################################
####################################################################################################################################


####################################################################################################################################
################################## getDocParaMonteSamplerReturnBeginning ###########################################################
# >>
getDocParaMonteSamplerReturnBeginning = function( type ) {

  if (      type == "report" )  { fileContentClass = "ReportFileContents" }
  else if ( type == "restart" ) { fileContentClass = "RestartFileContents" }
  else                          { fileContentClass = "TabularFileContents" }

  doc = paste0("

`", type, "List` (optional)

An R list of `", fileContentClass, "` objects, each of which corresponds to the contents of a unique restart file. Each object has
the following components:

               ")

  return( doc )

}
# <<
################################## getDocParaMonteSamplerReturnBeginning ###########################################################
####################################################################################################################################


####################################################################################################################################
################################## getDocParaMonteSamplerReturnItemFile ############################################################
# >>
getDocParaMonteSamplerReturnItemFile = function( type ) {

  doc = paste0("

- `file`

  The full absolute path to the output ", type, " file.

               ")

  return( doc )

}
# <<
################################## getDocParaMonteSamplerReturnItemFile ############################################################
####################################################################################################################################


####################################################################################################################################
################################## getDocParaMonteSamplerReturnItemDelimiter #######################################################
# >>
getDocParaMonteSamplerReturnItemDelimiter = function( type ) {

  doc = paste0("

- `delimiter`

  The delimiter used in the output ", type, " file.

               ")

  return( doc )

}
# <<
################################## getDocParaMonteSamplerReturnItemDelimiter #######################################################
####################################################################################################################################


####################################################################################################################################
################################## getDocParaMonteSamplerReturnItemNdim ############################################################
# >>
getDocParaMonteSamplerReturnItemNdim = function( type ) {

  doc = paste0("

- `ndim`

  The number of dimensions of the domain of the objective function from which the output has been drawn.

               ")

  return( doc )

}
# <<
################################## getDocParaMonteSamplerReturnItemNdim ############################################################
####################################################################################################################################


####################################################################################################################################
################################## getDocParaMonteSamplerReturnItemNcol ############################################################
# >>
getDocParaMonteSamplerReturnItemNcol = function( type ) {

  doc = paste0("

- `ncol`

  The number of columns of the ", type, " file.

               ")

  return( doc )

}
# <<
################################## getDocParaMonteSamplerReturnItemNcol ############################################################
####################################################################################################################################


####################################################################################################################################
################################## getDocParaMonteSamplerReturnItemCount ###########################################################
# >>
getDocParaMonteSamplerReturnItemCount = function( type ) {

  doc = paste0("

- `count`

  The number of sampled points in the output ", type, " file.

               ")

  return( doc )

}
# <<
################################## getDocParaMonteSamplerReturnItemCount ###########################################################
####################################################################################################################################


####################################################################################################################################
################################## getDocParaMonteSamplerReturnItemPlot ############################################################
# >>
getDocParaMonteSamplerReturnItemPlot = function( type ) {

  doc = paste0("

- `plot`

  An R list containing the graphics tools for the visualization of the contents of the output ", type, " file.

               ")

  return( doc )

}
# <<
################################## getDocParaMonteSamplerReturnItemPlot ############################################################
####################################################################################################################################


####################################################################################################################################
################################## getDocParaMonteSamplerReturnItemDf ##############################################################
# >>
getDocParaMonteSamplerReturnItemDf = function( type ) {

  doc = paste0("

- `df`

  The contents of the output ", type, " file in the form of a DataFrame (hence called `df`).

               ")

  return( doc )

}
# <<
################################## getDocParaMonteSamplerReturnItemDf ##############################################################
####################################################################################################################################


####################################################################################################################################
################################## getDocParaMonteSamplerReturnItemContents ########################################################
# >>
getDocParaMonteSamplerReturnItemContents = function( type ) {

  doc = paste0("

- `contents`

  Corresponding to each column in the ", type, " file, a property with the same name as the column header is also created for the
  object which contains the data stored in that column of the ", type, " file. These properties are all stored in the attribute
  `contents`.

               ")

  return( doc )

}
# <<
################################## getDocParaMonteSamplerReturnItemContents ########################################################
####################################################################################################################################


####################################################################################################################################
################################## getDocParaMonteSamplerReturnItemPropNameList ####################################################
# >>
getDocParaMonteSamplerReturnItemPropNameList = function( type ) {

  doc = paste0("

- `propNameList`

  A list of entities names parsed from the , ", type, " file.

               ")

  return( doc )

}
# <<
################################## getDocParaMonteSamplerReturnItemPropNameList ####################################################
####################################################################################################################################


####################################################################################################################################
################################## getDocParaMonteSamplerReturnEnding ##############################################################
# >>
getDocParaMonteSamplerDescriptionEnding = function( type ) {

  doc = paste0("

If `renabled = TRUE`, the list of objects will be returned as the return value of the method. Otherwise, the list will be stored in
a component of the ParaDRAM object named `", type, "List`.

               ")

  return( doc )

}
# <<
################################## getDocParaMonteSamplerReturnEnding ##############################################################
####################################################################################################################################
