
####################################################################################################################################
################################## ParaMonteSampler-doc ############################################################################
# >>
#'
#' @name ParaMonteSampler
#'
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#'
#' @title An [`R6`] ``r className = "`ParaMonteSampler`"`` class for [paramonte] package usage
#'
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#'
#' @description
#'
#-----------------------------------------------------------------------------------------------------------------------------------
#' \describe{\item{}{
#-----------------------------------------------------------------------------------------------------------------------------------
#'
#' This is the `r className` base class for the ParaMonte sampler routines. This class is NOT meant to be directly accessed or
#' called by the user of the [paramonte] package. However, its children, such as the [`ParaDRAM`] sampler class will be directly
#' accessible to the public.
#'
#' }}
#'
#' @section \out{<br 1 />}: \out{<hr>}
#'
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#'
#' @section Super class:
#'
#' - `r className` has no super class.
#'
#' @section \out{<br 2 />}: \out{<hr>}
#'
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#'
#' @section Public fields:
#'
#-----------------------------------------------------------------------------------------------------------------------------------
#' \describe{\item{}{\describe{\item{[`r className`] **fields**}{\describe{
#-----------------------------------------------------------------------------------------------------------------------------------
#'
#' \item{`buildMode`}{
#'
#'   optional string argument with the default value “release”. possible choices are:
#'
#'   - “debug”
#'
#'     to be used for identifying sources of bug and causes of code crash.
#'
#'   - “release”
#'
#'     to be used in all other normal scenarios for maximum runtime efficiency.
#'
#' }
#'
#' \item{`mpiEnabled`}{
#'
#'   Optional logical (boolean) indicator which is `FALSE` by default.
#'
#'   If it is set to `TRUE`, it will cause the ParaMonte simulation to run in parallel on the requested
#'   number of processors.
#'
#'   See the class documentation guidelines in the above for information on how to run a simulation in
#'   parallel.
#'
#' }
#'
#' \item{`inputFile`}{
#'
#'   Optional string input representing the path to an external input namelist of simulation specifications.
#'
#'   USE THIS OPTIONAL ARGUMENT WITH CAUTION AND ONLY IF YOU KNOW WHAT YOU ARE DOING.
#'
#'   **WARNING**
#'
#'   Specifying an input file will cause the sampler to ignore all other simulation specifications set
#'   by the user via sampler instance's `spec`-component attributes.
#'
#' }
#'
#' \item{`spec`}{
#'
#'   An R list containing all simulation specifications.
#'
#'   All simulation attributes are by default set to appropriate values at runtime. To override the
#'   default simulation specifications, set the `spec` attributes to some desired values of your choice.
#'
#'   If you need help on any of the simulation specifications, try the supplied `helpme()` function in
#'   this component.
#'
#'   If you wish to reset some specifications to the default values, simply set them to `NULL`.
#'
#' }
#'
#' \item{`reportEnabled`}{
#'
#'   optional logical (boolean) indicator which is `TRUE` by default.
#'
#'   If it is set to `TRUE`, it will cause extensive guidelines to be printed on the standard output
#'   as the simulation or post-processing continues with hints on the next possible steps that could
#'   be taken in the process. If you do not need such help and information set this variable to `FALSE`
#'   to silence all output messages.
#'
#' }
#'
#' }}}}}
#'
#' @section \out{<br 3 />}: \out{<hr>}
#'
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#'
#' @section Class constructor:
#'
#' ## Method `new()`
#'
#' \describe{\item{}{\describe{
#'
#' \item{**Description**}{
#'
#'   Instantiates a `r className` class object.
#'
#' }
#'
#' \item{**Usage**}{
#'
#'   ```
#'   ParaMonteSampler$new( methodName )
#'   ```
#'
#' }
#'
#' \item{**Arguments**}{\describe{
#'
#'   \item{`methodName`}{
#'   A string representing the name of the ParaMonte sampler that is to be instantiated.
#'   }
#'
#' }}
#'
#' \item{**Returns**}{
#'
#'   Returns a new `r className` class object.
#'
#' }
#'
#' }}}
#'
#' @section \out{<br 4 />}: \out{<hr>}
#'
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#'
#' @section Methods:
#'
#-----------------------------------------------------------------------------------------------------------------------------------
#' \describe{\item{}{ [`r className`] **methods**
#-----------------------------------------------------------------------------------------------------------------------------------
#'
#'   - \href{#method-readChain}{`r paste0(className, "$", "``readChain()``")`}
#'   - \href{#method-readSample}{`r paste0(className, "$", "``readSample()``")`}
#'   - \href{#method-readReport}{`r paste0(className, "$", "``readReport()``")`}
#'   - \href{#method-readRestart}{`r paste0(className, "$", "``readRestart()``")`}
#'   - \href{#method-readProgress}{`r paste0(className, "$", "``readProgress()``")`}
#'   - \href{#method-readMarkovChain}{`r paste0(className, "$", "``readMarkovChain()``")`}
#'
#' }}
#'
#' @section \out{<br 5 />}: \out{<hr>}
#'
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#'
#' @section Methods description:
#'
#-----------------------------------------------------------------------------------------------------------------------------------
#' \out{<a id="method-readChain"></a>}
#' ## Method `readChain()`
#-----------------------------------------------------------------------------------------------------------------------------------
#'
#' \describe{\item{}{\describe{
#'
#' \item{**Description**}{
#'
#'   `r getDocParaMonteSamplerDescriptionBeginning("chain")`
#'
#' }
#'
#' \item{**Usage**}{
#'
#'   ```
#'   ParaMonteSampler$readChain(file, delimiter, parseContents, renabled)
#'   ```
#'
#' }
#'
#' \item{**Arguments**}{\describe{
#'
#'   \item{`file`}{
#'   `r getDocParaMonteSamplerParamFile("chain")`
#'   }
#'
#'   \item{`delimiter`}{
#'   `r getDocParaMonteSamplerParamDelimiter("chain")`
#'   }
#'
#'   \item{`parseContents`}{
#'   `r getDocParaMonteSamplerParamParseContents("chain")`
#'   }
#'
#'   \item{`renabled`}{
#'   `r getDocParaMonteSamplerParamRenabled("chain")`
#'   }
#'
#' }}
#'
#' \item{**Returns**}{
#'
#'   `r getDocParaMonteSamplerReturnBeginning("chain")`
#'   `r getDocParaMonteSamplerReturnItemFile("chain")`
#'   `r getDocParaMonteSamplerReturnItemDelimiter("chain")`
#'   `r getDocParaMonteSamplerReturnItemNdim("chain")`
#'   `r getDocParaMonteSamplerReturnItemCount("chain")`
#'   `r getDocParaMonteSamplerReturnItemPlot("chain")`
#'   `r getDocParaMonteSamplerReturnItemDf("chain")`
#'   `r getDocParaMonteSamplerReturnItemContents("chain")`
#'   `r getDocParaMonteSamplerDescriptionEnding("chain")`
#'
#' }
#'
#' }}}
#'
#' \out{<hr>}
#'
#-----------------------------------------------------------------------------------------------------------------------------------
#' \out{<a id="method-readSample"></a>}
#' ## Method `readSample()`
#-----------------------------------------------------------------------------------------------------------------------------------
#'
#' \describe{\item{}{\describe{
#'
#' \item{**Description**}{
#'
#'   `r getDocParaMonteSamplerDescriptionBeginning("sample")`
#'
#' }
#'
#' \item{**Usage**}{
#'
#'   ```
#'   ParaMonteSampler$readSample(file, delimiter, parseContents, renabled)
#'   ```
#'
#' }
#'
#' \item{**Arguments**}{\describe{
#'
#'   \item{`file`}{
#'   `r getDocParaMonteSamplerParamFile("sample")`
#'   }
#'
#'   \item{`delimiter`}{
#'   `r getDocParaMonteSamplerParamDelimiter("sample")`
#'   }
#'
#'   \item{`parseContents`}{
#'   `r getDocParaMonteSamplerParamParseContents("sample")`
#'   }
#'
#'   \item{`renabled`}{
#'   `r getDocParaMonteSamplerParamRenabled("sample")`
#'   }
#'
#' }}
#'
#' \item{**Returns**}{
#'
#'   `r getDocParaMonteSamplerReturnBeginning("sample")`
#'   `r getDocParaMonteSamplerReturnItemFile("sample")`
#'   `r getDocParaMonteSamplerReturnItemDelimiter("sample")`
#'   `r getDocParaMonteSamplerReturnItemNdim("sample")`
#'   `r getDocParaMonteSamplerReturnItemCount("sample")`
#'   `r getDocParaMonteSamplerReturnItemPlot("sample")`
#'   `r getDocParaMonteSamplerReturnItemDf("sample")`
#'   `r getDocParaMonteSamplerReturnItemContents("sample")`
#'   `r getDocParaMonteSamplerDescriptionEnding("sample")`
#'
#' }
#'
#' }}}
#'
#' \out{<hr>}
#'
#-----------------------------------------------------------------------------------------------------------------------------------
#' \out{<a id="method-readReport"></a>}
#' ## Method `readReport()`
#-----------------------------------------------------------------------------------------------------------------------------------
#'
#' \describe{\item{}{\describe{
#'
#' \item{**Description**}{
#'
#'   `r getDocParaMonteSamplerDescriptionBeginning("report")`
#'
#' }
#'
#' \item{**Usage**}{
#'
#'   ```
#'   ParaMonteSampler$readSample(file, renabled)
#'   ```
#'
#' }
#'
#' \item{**Arguments**}{\describe{
#'
#'   \item{`file`}{
#'   `r getDocParaMonteSamplerParamFile("report")`
#'   }
#'
#'   \item{`renabled`}{
#'   `r getDocParaMonteSamplerParamRenabled("report")`
#'   }
#'
#' }}
#'
#' \item{**Returns**}{
#'
#'   `r getDocParaMonteSamplerReturnBeginning("report")`
#'   `r getDocParaMonteSamplerReturnItemFile("report")`
#'   `r getDocParaMonteSamplerReturnItemContents("report")`
#'   `r getDocParaMonteSamplerDescriptionEnding("report")`
#'
#' }
#'
#' }}}
#'
#' \out{<hr>}
#'
#-----------------------------------------------------------------------------------------------------------------------------------
#' \out{<a id="method-readRestart"></a>}
#' ## Method `readRestart()`
#-----------------------------------------------------------------------------------------------------------------------------------
#'
#' \describe{\item{}{\describe{
#'
#' \item{**Description**}{
#'
#'   `r getDocParaMonteSamplerDescriptionBeginning("restart")`
#'
#' }
#'
#' \item{**Usage**}{
#'
#'   ```
#'   ParaMonteSampler$readRestart(file, renabled)
#'   ```
#'
#' }
#'
#' \item{**Arguments**}{\describe{
#'
#'   \item{`file`}{
#'   `r getDocParaMonteSamplerParamFile("restart")`
#'   }
#'
#'   \item{`renabled`}{
#'   `r getDocParaMonteSamplerParamRenabled("restart")`
#'   }
#'
#' }}
#'
#' \item{**Returns**}{
#'
#'   `r getDocParaMonteSamplerReturnBeginning("restart")`
#'   `r getDocParaMonteSamplerReturnItemFile("restart")`
#'   `r getDocParaMonteSamplerReturnItemNdim("restart")`
#'   `r getDocParaMonteSamplerReturnItemCount("restart")`
#'   `r getDocParaMonteSamplerReturnItemPlot("restart")`
#'   `r getDocParaMonteSamplerReturnItemDf("restart")`
#'   `r getDocParaMonteSamplerReturnItemContents("restart")`
#'   `r getDocParaMonteSamplerReturnItemPropNameList("restart")`
#'   `r getDocParaMonteSamplerDescriptionEnding("restart")`
#'
#' }
#'
#' }}}
#'
#' \out{<hr>}
#'
#-----------------------------------------------------------------------------------------------------------------------------------
#' \out{<a id="method-readProgress"></a>}
#' ## Method `readProgress()`
#-----------------------------------------------------------------------------------------------------------------------------------
#'
#' \describe{\item{}{\describe{
#'
#' \item{**Description**}{
#'
#'   `r getDocParaMonteSamplerDescriptionBeginning("progress")`
#'
#' }
#'
#' \item{**Usage**}{
#'
#'   ```
#'   ParaMonteSampler$readChain(file, delimiter, parseContents, renabled)
#'   ```
#'
#' }
#'
#' \item{**Arguments**}{\describe{
#'
#'   \item{`file`}{
#'   `r getDocParaMonteSamplerParamFile("progress")`
#'   }
#'
#'   \item{`delimiter`}{
#'   `r getDocParaMonteSamplerParamDelimiter("progress")`
#'   }
#'
#'   \item{`parseContents`}{
#'   `r getDocParaMonteSamplerParamParseContents("progress")`
#'   }
#'
#'   \item{`renabled`}{
#'   `r getDocParaMonteSamplerParamRenabled("progress")`
#'   }
#'
#' }}
#'
#' \item{**Returns**}{
#'
#'   `r getDocParaMonteSamplerReturnBeginning("progress")`
#'   `r getDocParaMonteSamplerReturnItemFile("progress")`
#'   `r getDocParaMonteSamplerReturnItemDelimiter("progress")`
#'   `r getDocParaMonteSamplerReturnItemNcol("progress")`
#'   `r getDocParaMonteSamplerReturnItemPlot("progress")`
#'   `r getDocParaMonteSamplerReturnItemDf("progress")`
#'   `r getDocParaMonteSamplerReturnItemContents("progress")`
#'   `r getDocParaMonteSamplerDescriptionEnding("progress")`
#'
#' }
#'
#' }}}
#'
#' \out{<hr>}
#'
#-----------------------------------------------------------------------------------------------------------------------------------
#' \out{<a id="method-readMarkovChain"></a>}
#' ## Method `readMarkovChain()`
#-----------------------------------------------------------------------------------------------------------------------------------
#'
#' \describe{\item{}{\describe{
#'
#' \item{**Description**}{
#'
#'   `r getDocParaMonteSamplerDescriptionBeginning("markovChain")`
#'
#' }
#'
#' \item{**Usage**}{
#'
#'   ```
#'   ParaMonteSampler$readMarkovChain(file, delimiter, parseContents, renabled)
#'   ```
#'
#' }
#'
#' \item{**Arguments**}{\describe{
#'
#'   \item{`file`}{
#'   `r getDocParaMonteSamplerParamFile("markovChain")`
#'   }
#'
#'   \item{`delimiter`}{
#'   `r getDocParaMonteSamplerParamDelimiter("markovChain")`
#'   }
#'
#'   \item{`parseContents`}{
#'   `r getDocParaMonteSamplerParamParseContents("markovChain")`
#'   }
#'
#'   \item{`renabled`}{
#'   `r getDocParaMonteSamplerParamRenabled("markovChain")`
#'   }
#'
#' }}
#'
#' \item{**Returns**}{
#'
#'   `r getDocParaMonteSamplerReturnBeginning("markovChain")`
#'   `r getDocParaMonteSamplerReturnItemFile("markovChain")`
#'   `r getDocParaMonteSamplerReturnItemDelimiter("markovChain")`
#'   `r getDocParaMonteSamplerReturnItemNdim("markovChain")`
#'   `r getDocParaMonteSamplerReturnItemCount("markovChain")`
#'   `r getDocParaMonteSamplerReturnItemPlot("markovChain")`
#'   `r getDocParaMonteSamplerReturnItemDf("markovChain")`
#'   `r getDocParaMonteSamplerReturnItemContents("markovChain")`
#'   `r getDocParaMonteSamplerDescriptionEnding("markovChain")`
#'
#' }
#'
#' }}}
#'
#' \out{<hr>}
#'
# <<
################################## ParaMonteSampler-doc ############################################################################
####################################################################################################################################
NULL

####################################################################################################################################
################################## ParaMonteSampler ################################################################################
# >>

# Sourcing Methods / Classes / Auxiliary-functions >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# thisFileDir = getThisFileDir()
# sourceFolder( paste( thisFileDir, "/", "public_methods", sep = "" ) )
# sourceFolder( paste( thisFileDir, "/", "private_methods", sep = "" ) )

# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Sourcing Methods / Classes / Auxiliary-functions

ParaMonteSampler <- R6::R6Class(  "ParaMonteSampler", cloneable = FALSE,

                                  # Private >> #####################################################################################

                                  private = list(

                                    Err        = NULL,
                                    methodName = "",
                                    objectName = NULL,
                                    fileInfo   = NULL,
                                    platform   = NULL,
                                    libName    = NULL,
                                    website    = list(),
                                    method     = NULL,
                                    ndim       = NULL,

                                    verifyFileType       = verifyFileType,       # verifyFileType >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                    setFileToRead        = setFileToRead,        # setFileToRead >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                    setDelimiterToRead   = setDelimiterToRead,   # setDelimiterToRead >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                    checkInputArg        = checkInputArg,        # checkInputArg >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                    parseEverything      = parseEverything,      # parseEverything >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                    updateUserProcessing = updateUserProcessing, # updateUserProcessing >>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                    updateUserDone       = updateUserDone,       # updateUserDone >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                    updateUserSucess     = updateUserSucess,     # updateUserSucess >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                    readchain            = readEverything,
                                    readsample           = readEverything,
                                    readreport           = readEverything,
                                    readrestart          = readEverything,
                                    readprogress         = readEverything,
                                    readmarkovChain      = readEverything

                                  ), # << Private

                                  # Public >> ######################################################################################

                                  public = list(

                                    buildMode      = "release",
                                    mpiEnabled     = FALSE,
                                    inputFile      = NULL,
                                    spec           = NULL,
                                    reportEnabled  = NULL,

                                    # initialize >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                    initialize = function( methodName ) {

                                      self$spec            = list()
                                      self$reportEnabled   = TRUE

                                      private$Err               = Err_class$new()

                                      private$method            = list()
                                      private$method$isParaDRAM = FALSE
                                      private$method$isParaNest = FALSE
                                      private$method$isParaTemp = FALSE
                                      website                   = list()                                 # >> SET TEMPORARILY xxx <<
                                      website$home$url          = "https://www.cdslab.org/paramonte/"    # >> SET TEMPORARILY xxx <<
                                      # private$website           = website
                                      # private$platform          = platform
                                      private$methodName        = methodName

                                      return(invisible(self))

                                    },

                                    # readChain >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                    readChain       = function(file, delimiter, parseContents, renabled) {
                                      chainList = private$readchain( file = file, delimiter = delimiter, parseContents = parseContents, renabled = renabled )
                                    },

                                    # readSample >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                    readSample      = function(file, delimiter, parseContents, renabled) {
                                      chainList = private$readchain( file = file, delimiter = delimiter, parseContents = parseContents, renabled = renabled )
                                    },

                                    # readReport >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                    readReport      = function(file, renabled) {
                                      chainList = private$readchain( file = file, renabled = renabled )
                                    },

                                    # readRestart >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                    readRestart     = function(file, renabled) {
                                      chainList = private$readchain( file = file, renabled = renabled )
                                    },

                                    # readProgress >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                    readProgress    = function(file, delimiter, parseContents, renabled) {
                                      chainList = private$readchain( file = file, delimiter = delimiter, parseContents = parseContents, renabled = renabled )
                                    },

                                    # readMarkovChain >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                    readMarkovChain = function(file, delimiter, parseContents, renabled) {
                                      chainList = private$readchain( file = file, delimiter = delimiter, parseContents = parseContents, renabled = renabled )
                                    }

                                  ) # << Public

)
# <<
################################## ParaMonteSampler ################################################################################
####################################################################################################################################


####################################################################################################################################
################################## Help Code #######################################################################################
# >>
# ParaMonteSamplerObj = ParaMonteSampler$new( platform, website )
# <<
################################## Help Code #######################################################################################
####################################################################################################################################
