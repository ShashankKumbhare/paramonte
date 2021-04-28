
####################################################################################################################################
####################################################################################################################################
# >>
#' @title An [`R6`] `ParaMonteSampler` class for [paramonte] package usage
#' @description This is the `ParaMonteSampler` base class for the ParaMonte sampler routines. This class is NOT meant to be directly
#' accessed or called by the user of the [paramonte] package. However, its children, such as the [`ParaDRAM`] sampler class will be
#' directly accessible to the public.
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
                                methodName = "ParaDRAM",
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
                                #' optional string argument with the default value “release”. possible choices are:
                                #' - “debug” \cr
                                #'   to be used for identifying sources of bug and causes of code crash.
                                #' - “release” \cr
                                #'   to be used in all other normal scenarios for maximum runtime efficiency.
                                buildMode      = "release",

                                #' @field mpiEnabled
                                #' Optional logical (boolean) indicator which is `FALSE` by default. \cr
                                #' If it is set to `TRUE`, it will cause the ParaMonte simulation to run in parallel on the
                                #' requested number of processors.\cr
                                #' See the class documentation guidelines in the above for information on how to run a simulation in parallel.
                                mpiEnabled     = FALSE,

                                #' @field inputFile
                                #' Optional string input representing the path to an external input namelist of simulation specifications. \cr
                                #' USE THIS OPTIONAL ARGUMENT WITH CAUTION AND ONLY IF YOU KNOW WHAT YOU ARE DOING.
                                #'
                                #' ### WARNING:
                                #' Specifying an input file will cause the sampler to ignore all other simulation specifications set by
                                #' the user via sampler instance's `spec`-component attributes.
                                inputFile      = NULL,

                                #' @field spec
                                #' An R list containing all simulation specifications. \cr
                                #' All simulation attributes are by default set to appropriate values at runtime. To override the default
                                #' simulation specifications, set the `spec` attributes to some desired values of your choice. \cr
                                #' If you need help on any of the simulation specifications, try the supplied `helpme()` function
                                #' in this component. \cr
                                #' If you wish to reset some specifications to the default values, simply set them to `NULL`.
                                spec           = NULL,

                                #' @field reportEnabled
                                #' optional logical (boolean) indicator which is `TRUE` by default. \cr
                                #' If it is set to `TRUE`, it will cause extensive guidelines to be printed on the standard output as the
                                #' simulation or post-processing continues with hints on the next possible steps that could be taken in
                                #' the process. If you do not need such help and information set this variable to `FALSE` to silence all
                                #' output messages.
                                reportEnabled  = NULL,

                                # initialize >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                #' @description Instantiates a `ParaMonteSampler` class object.
                                #' @param platform platform for [paramonte] package.
                                #' @param website website for [paramonte] package.
                                #' @return Returns a new `ParaMonteSampler` class object.
                                initialize = function(platform, website) {

                                    self$spec            = list()
                                    self$reportEnabled   = TRUE

                                    private$Err               = Err_class$new()

                                    private$method            = list()
                                    private$method$isParaDRAM = FALSE
                                    private$method$isParaNest = FALSE
                                    private$method$isParaTemp = FALSE
                                    website                   = list()                                 # >> SET TEMPORARILY xxx <<
                                    website$home$url          = "https://www.cdslab.org/paramonte/"    # >> SET TEMPORARILY xxx <<
                                    private$website           = website
                                    private$platform          = platform

                                    return(invisible(self))

                                },

                                # readChain >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                # @description Return a list of the contents of a set of ParaDRAM output chain files whose names
                                # begin the user-provided input file. This method is to be only used for postprocessing of the output
                                # chain file(s) of an already finished ParaDRAM simulation. It is not meant to be called by all
                                # processes in parallel mode, although it is possible.\cr
                                #' @description
                                #' `r getDocParaMonteSamplerDescription("chain")`
                                #' @param file
                                #' `r getDocParaMonteSamplerParamFile("chain")`
                                #' @param delimiter
                                #' `r getDocParaMonteSamplerParamDelimiter("chain")`
                                #' @param parseContents
                                #' `r getDocParaMonteSamplerParamParseContents("chain")`
                                #' @param renabled
                                #' `r getDocParaMonteSamplerParamRenabled("chain")`
                                #' @return
                                #' `chainList` (optional)\cr
                                #' \cr
                                #' An R list of `TabularFileContents` objects, each of which corresponds to the contents of a unique
                                #' restart file. Each object has the following components:
                                #' - `file`\cr
                                #'   The full absolute path to the output file.
                                #' - `delimiter`\cr
                                #'   The delimiter used in the output file.
                                #' - `ndim`\cr
                                #'   The number of dimensions of the domain of the objective function from which the output has been drawn.
                                #' - `count`\cr
                                #'   The number of sampled points in the output file.
                                #' - `plot`\cr
                                #'   An R list containing the graphics tools for the visualization of the contents of the file.
                                #' - `df`\cr
                                #'   The contents of the output file in the form of a DataFrame (hence called `df`).
                                #' - `contents`\cr
                                #'   corresponding to each column in the chain file, a property with the same name as the column
                                #'   header is also created for the object which contains the data stored in that column of the progress
                                #'   file. These properties are all stored in the attribute `contents`.
                                #'
                                #' If `renabled = TRUE`, the list of objects will be returned as the return value of the method.
                                #' Otherwise, the list will be stored in a component of the ParaDRAM object named `chainList`.
                                readChain       = function(file, delimiter, parseContents, renabled) {
                                    chainList = private$readchain( file = file, delimiter = delimiter, parseContents = parseContents, renabled = renabled )
                                },

                                # readSample >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                # @description Return a list of the contents of a set of ParaDRAM output sample files whose names
                                # contain the user-provided input file. This method is to be only used for postprocessing of the
                                # output sample file(s) of an already finished ParaDRAM simulation. It is not meant to be called
                                # by all processes in parallel mode, although it is possible.
                                #' @description
                                #' `r getDocParaMonteSamplerDescription("sample")`
                                #' @param file
                                #' `r getDocParaMonteSamplerParamFile("sample")`
                                #' @param delimiter
                                #' `r getDocParaMonteSamplerParamDelimiter("sample")`
                                #' @param parseContents
                                #' `r getDocParaMonteSamplerParamParseContents("sample")`
                                #' @param renabled
                                #' `r getDocParaMonteSamplerParamRenabled("sample")`
                                #' @return
                                #' `sampleList` (optional)\cr
                                #' \cr
                                #' An R list of `TabularFileContents` objects, each of which corresponds to the contents of a unique
                                #' restart file. Each object has the following components:
                                #' - `file`\cr
                                #'   The full absolute path to the output file.
                                #' - `delimiter`\cr
                                #'   The delimiter used in the output file.
                                #' - `ndim`\cr
                                #'   The number of dimensions of the domain of the objective function from which the output has been drawn.
                                #' - `count`\cr
                                #'   The number of sampled points in the output file.
                                #' - `plot`\cr
                                #'   An R list containing the graphics tools for the visualization of the contents of the file.
                                #' - `df`\cr
                                #'   The contents of the output file in the form of a DataFrame (hence called `df`).
                                #' - `contents`\cr
                                #'   corresponding to each column in the sample file, a property with the same name as the column
                                #'   header is also created for the object which contains the data stored in that column of the progress
                                #'   file. These properties are all stored in the attribute `contents`.
                                #'
                                #' If `renabled = TRUE`, the list of objects will be returned as the return value of the method.
                                #' Otherwise, the list will be stored in a component of the ParaDRAM object named `sampleList`.
                                readSample      = function(file, delimiter, parseContents, renabled) {
                                    chainList = private$readchain( file = file, delimiter = delimiter, parseContents = parseContents, renabled = renabled )
                                },

                                # readReport >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                # @description Return a list of the contents of a set of the simulation(s) output report files whose
                                # names begin the user-provided input file prefix, or as specified by the input simulation specification
                                # `SAMPLER$spec$outputFileName`, where SAMPLER can be an instance of any one of the ParaMonte's sampler
                                # classes, such as `ParaDRAM`.
                                # ### NOTE
                                # This method is to be only used for post-processing of the output report file(s) of an already finished
                                # simulation. It is NOT meant to be called by all processes in parallel mode, although it is possible.
                                #' @description
                                #' `r getDocParaMonteSamplerDescription("report")`
                                #' @param file
                                #' `r getDocParaMonteSamplerParamFile("report")`
                                #' @param renabled
                                #' `r getDocParaMonteSamplerParamRenabled("report")`
                                #' @return Returns a
                                readReport      = function(file, renabled) {
                                    chainList = private$readchain( file = file, renabled = renabled )
                                },

                                # readRestart >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                #' @description
                                #' `r getDocParaMonteSamplerDescription("restart")`\cr
                                #' `r getDocParaMonteSamplerDescriptionRestartWarning()`
                                #' @param file
                                #' `r getDocParaMonteSamplerParamFile("restart")`
                                #' @param renabled
                                #' `r getDocParaMonteSamplerParamRenabled("restart")`
                                #' @return Returns a
                                readRestart     = function(file, renabled) {
                                    chainList = private$readchain( file = file, renabled = renabled )
                                },

                                # readProgress >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                #' @description
                                #' `r getDocParaMonteSamplerDescription("progress")`
                                #' @param file
                                #' `r getDocParaMonteSamplerParamFile("progress")`
                                #' @param delimiter
                                #' `r getDocParaMonteSamplerParamDelimiter("progress")`
                                #' @param parseContents
                                #' `r getDocParaMonteSamplerParamParseContents("progress")`
                                #' @param renabled
                                #' `r getDocParaMonteSamplerParamRenabled("progress")`
                                #' @return Returns a
                                readProgress    = function(file, delimiter, parseContents, renabled) {
                                    chainList = private$readchain( file = file, delimiter = delimiter, parseContents = parseContents, renabled = renabled )
                                },

                                # readMarkovChain >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                #' @description
                                #' `r getDocParaMonteSamplerDescription("markovChain")`
                                #' @param file
                                #' `r getDocParaMonteSamplerParamFile("markovChain")`
                                #' @param delimiter
                                #' `r getDocParaMonteSamplerParamDelimiter("markovChain")`
                                #' @param parseContents
                                #' `r getDocParaMonteSamplerParamParseContents("markovChain")`
                                #' @param renabled
                                #' `r getDocParaMonteSamplerParamRenabled("markovChain")`
                                #' @return Returns a
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
