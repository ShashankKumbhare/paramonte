
####################################################################################################################################
####################################################################################################################################
# >>
#'
#' @title An [`R6`] `ParaMonteSampler` class for [paramonte] package usage
#'
#' @description
#' This is the `ParaMonteSampler` base class for the ParaMonte sampler routines. This class is NOT meant to be directly accessed or
#' called by the user of the [paramonte] package. However, its children, such as the [`ParaDRAM`] sampler class will be directly
#' accessible to the public.
#'
# @template templateParamFile
# @template templateParamDelimiter
# @template templateParamParseContents
# @template templateParamRenabled

# <<
####################################################################################################################################
####################################################################################################################################


####################################################################################################################################
################################## ParaMonteSampler ################################################################################
# >>

    # Sourcing Methods / Classes / Auxiliary-functions >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    # thisFileDir = getThisFileDir()
    # sourceFolder( paste( thisFileDir, "/", "public_methods", sep = "" ) )
    # sourceFolder( paste( thisFileDir, "/", "private_methods", sep = "" ) )

    # <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Sourcing Methods / Classes / Auxiliary-functions

ParaMonteSampler <- R6::R6Class(  "ParaMonteSampler", cloneable = FALSE,

                            # Private >> ###########################################################################################

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

                                verifyFileType       = verifyFileType,       # verifyFileType >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                setFileToRead        = setFileToRead,        # setFileToRead >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                setDelimiterToRead   = setDelimiterToRead,   # setDelimiterToRead >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                checkInputArg        = checkInputArg,        # checkInputArg >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                parseEverything      = parseEverything,      # parseEverything >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                updateUserProcessing = updateUserProcessing, # updateUserProcessing >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                updateUserDone       = updateUserDone,       # updateUserDone >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                updateUserSucess     = updateUserSucess,     # updateUserSucess >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                readchain            = readEverything,
                                readsample           = readEverything,
                                readreport           = readEverything,
                                readrestart          = readEverything,
                                readprogress         = readEverything,
                                readmarkovChain      = readEverything

                            ), # << Private

                            # Public >> ############################################################################################

                            public = list(

                                #' @field buildMode
                                #'
                                #' optional string argument with the default value “release”. possible choices are:
                                #'
                                #' - “debug”
                                #'
                                #'   to be used for identifying sources of bug and causes of code crash.
                                #'
                                #' - “release”
                                #'
                                #'   to be used in all other normal scenarios for maximum runtime efficiency.
                                #'
                                buildMode      = "release",

                                #' @field mpiEnabled
                                #'
                                #' Optional logical (boolean) indicator which is `FALSE` by default.
                                #'
                                #' If it is set to `TRUE`, it will cause the ParaMonte simulation to run in parallel on the requested
                                #' number of processors.
                                #'
                                #' See the class documentation guidelines in the above for information on how to run a simulation in
                                #' parallel.
                                #'
                                mpiEnabled     = FALSE,

                                #' @field inputFile
                                #'
                                #' Optional string input representing the path to an external input namelist of simulation specifications.
                                #'
                                #' USE THIS OPTIONAL ARGUMENT WITH CAUTION AND ONLY IF YOU KNOW WHAT YOU ARE DOING.
                                #'
                                #' ### WARNING:
                                #'
                                #' Specifying an input file will cause the sampler to ignore all other simulation specifications set
                                #' by the user via sampler instance's `spec`-component attributes.
                                #'
                                inputFile      = NULL,

                                #' @field spec
                                #'
                                #' An R list containing all simulation specifications.
                                #'
                                #' All simulation attributes are by default set to appropriate values at runtime. To override the
                                #' default simulation specifications, set the `spec` attributes to some desired values of your choice.
                                #'
                                #' If you need help on any of the simulation specifications, try the supplied `helpme()` function in
                                #' this component.
                                #'
                                #' If you wish to reset some specifications to the default values, simply set them to `NULL`.
                                #'
                                spec           = NULL,

                                #' @field reportEnabled
                                #'
                                #' optional logical (boolean) indicator which is `TRUE` by default.
                                #'
                                #' If it is set to `TRUE`, it will cause extensive guidelines to be printed on the standard output
                                #' as the simulation or post-processing continues with hints on the next possible steps that could
                                #' be taken in the process. If you do not need such help and information set this variable to `FALSE`
                                #' to silence all output messages.
                                #'
                                reportEnabled  = NULL,

                                # initialize >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                #'
                                #' @description Instantiates a `ParaMonteSampler` class object.
                                #'
                                #' @param methodName A string representing the name of the ParaMonte sampler that is to be instantiated.
                                #'
                                #' @return Returns a new `ParaMonteSampler` class object.
                                #'
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

                                # readChain >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                #'
                                #' @description
                                #' `r getDocParaMonteSamplerDescriptionBeginning("chain")`
                                #'
                                #' @param file
                                #' `r getDocParaMonteSamplerParamFile("chain")`
                                #' @param delimiter
                                #' `r getDocParaMonteSamplerParamDelimiter("chain")`
                                #' @param parseContents
                                #' `r getDocParaMonteSamplerParamParseContents("chain")`
                                #' @param renabled
                                #' `r getDocParaMonteSamplerParamRenabled("chain")`
                                #'
                                #' @return
                                #' `r getDocParaMonteSamplerReturnBeginning("chain")`
                                #' `r getDocParaMonteSamplerReturnItemFile("chain")`
                                #' `r getDocParaMonteSamplerReturnItemDelimiter("chain")`
                                #' `r getDocParaMonteSamplerReturnItemNdim("chain")`
                                #' `r getDocParaMonteSamplerReturnItemCount("chain")`
                                #' `r getDocParaMonteSamplerReturnItemPlot("chain")`
                                #' `r getDocParaMonteSamplerReturnItemDf("chain")`
                                #' `r getDocParaMonteSamplerReturnItemContents("chain")`
                                #' `r getDocParaMonteSamplerDescriptionEnding("chain")`
                                #'
                                readChain       = function(file, delimiter, parseContents, renabled) {
                                    chainList = private$readchain( file = file, delimiter = delimiter, parseContents = parseContents, renabled = renabled )
                                },

                                # readSample >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                #'
                                #' @description
                                #' `r getDocParaMonteSamplerDescriptionBeginning("sample")`
                                #'
                                #' @param file
                                #' `r getDocParaMonteSamplerParamFile("sample")`
                                #' @param delimiter
                                #' `r getDocParaMonteSamplerParamDelimiter("sample")`
                                #' @param parseContents
                                #' `r getDocParaMonteSamplerParamParseContents("sample")`
                                #' @param renabled
                                #' `r getDocParaMonteSamplerParamRenabled("sample")`
                                #'
                                #' @return
                                #' `r getDocParaMonteSamplerReturnBeginning("sample")`
                                #' `r getDocParaMonteSamplerReturnItemFile("sample")`
                                #' `r getDocParaMonteSamplerReturnItemDelimiter("sample")`
                                #' `r getDocParaMonteSamplerReturnItemNdim("sample")`
                                #' `r getDocParaMonteSamplerReturnItemCount("sample")`
                                #' `r getDocParaMonteSamplerReturnItemPlot("sample")`
                                #' `r getDocParaMonteSamplerReturnItemDf("sample")`
                                #' `r getDocParaMonteSamplerReturnItemContents("sample")`
                                #' `r getDocParaMonteSamplerDescriptionEnding("sample")`
                                #'
                                readSample      = function(file, delimiter, parseContents, renabled) {
                                    chainList = private$readchain( file = file, delimiter = delimiter, parseContents = parseContents, renabled = renabled )
                                },

                                # readReport >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                #'
                                #' @description
                                #' `r getDocParaMonteSamplerDescriptionBeginning("report")`
                                #'
                                #' @param file
                                #' `r getDocParaMonteSamplerParamFile("report")`
                                #' @param renabled
                                #' `r getDocParaMonteSamplerParamRenabled("report")`
                                #'
                                #' @return
                                #' `r getDocParaMonteSamplerReturnBeginning("report")`
                                #' `r getDocParaMonteSamplerReturnItemFile("report")`
                                #' `r getDocParaMonteSamplerReturnItemContents("report")`
                                #' `r getDocParaMonteSamplerDescriptionEnding("report")`
                                #'
                                readReport      = function(file, renabled) {
                                    chainList = private$readchain( file = file, renabled = renabled )
                                },

                                # readRestart >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                #'
                                #' @description
                                #' `r getDocParaMonteSamplerDescriptionBeginning("restart")`
                                #' `r getDocParaMonteSamplerDescriptionRestartWarning()`
                                #'
                                #' @param file
                                #' `r getDocParaMonteSamplerParamFile("restart")`
                                #' @param renabled
                                #' `r getDocParaMonteSamplerParamRenabled("restart")`
                                #'
                                #' @return
                                #' `r getDocParaMonteSamplerReturnBeginning("restart")`
                                #' `r getDocParaMonteSamplerReturnItemFile("restart")`
                                #' `r getDocParaMonteSamplerReturnItemNdim("restart")`
                                #' `r getDocParaMonteSamplerReturnItemCount("restart")`
                                #' `r getDocParaMonteSamplerReturnItemPlot("restart")`
                                #' `r getDocParaMonteSamplerReturnItemDf("restart")`
                                #' `r getDocParaMonteSamplerReturnItemContents("restart")`
                                #' `r getDocParaMonteSamplerReturnItemPropNameList("restart")`
                                #' `r getDocParaMonteSamplerDescriptionEnding("restart")`
                                #'
                                readRestart     = function(file, renabled) {
                                    chainList = private$readchain( file = file, renabled = renabled )
                                },

                                # readProgress >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                #'
                                #' @description
                                #' `r getDocParaMonteSamplerDescriptionBeginning("progress")`
                                #'
                                #' @param file
                                #' `r getDocParaMonteSamplerParamFile("progress")`
                                #' @param delimiter
                                #' `r getDocParaMonteSamplerParamDelimiter("progress")`
                                #' @param parseContents
                                #' `r getDocParaMonteSamplerParamParseContents("progress")`
                                #' @param renabled
                                #' `r getDocParaMonteSamplerParamRenabled("progress")`
                                #'
                                #' @return
                                #' `r getDocParaMonteSamplerReturnBeginning("progress")`
                                #' `r getDocParaMonteSamplerReturnItemFile("progress")`
                                #' `r getDocParaMonteSamplerReturnItemDelimiter("progress")`
                                #' `r getDocParaMonteSamplerReturnItemNcol("progress")`
                                #' `r getDocParaMonteSamplerReturnItemPlot("progress")`
                                #' `r getDocParaMonteSamplerReturnItemDf("progress")`
                                #' `r getDocParaMonteSamplerReturnItemContents("progress")`
                                #' `r getDocParaMonteSamplerDescriptionEnding("progress")`
                                #'
                                readProgress    = function(file, delimiter, parseContents, renabled) {
                                    chainList = private$readchain( file = file, delimiter = delimiter, parseContents = parseContents, renabled = renabled )
                                },

                                # readMarkovChain >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                #'
                                #' @description
                                #' `r getDocParaMonteSamplerDescriptionBeginning("markovChain")`
                                #'
                                #' @param file
                                #' `r getDocParaMonteSamplerParamFile("markovChain")`
                                #' @param delimiter
                                #' `r getDocParaMonteSamplerParamDelimiter("markovChain")`
                                #' @param parseContents
                                #' `r getDocParaMonteSamplerParamParseContents("markovChain")`
                                #' @param renabled
                                #' `r getDocParaMonteSamplerParamRenabled("markovChain")`
                                #'
                                #' @return
                                #' `r getDocParaMonteSamplerReturnBeginning("markovChain")`
                                #' `r getDocParaMonteSamplerReturnItemFile("markovChain")`
                                #' `r getDocParaMonteSamplerReturnItemDelimiter("markovChain")`
                                #' `r getDocParaMonteSamplerReturnItemNdim("markovChain")`
                                #' `r getDocParaMonteSamplerReturnItemCount("markovChain")`
                                #' `r getDocParaMonteSamplerReturnItemPlot("markovChain")`
                                #' `r getDocParaMonteSamplerReturnItemDf("markovChain")`
                                #' `r getDocParaMonteSamplerReturnItemContents("markovChain")`
                                #' `r getDocParaMonteSamplerDescriptionEnding("markovChain")`
                                #'
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
