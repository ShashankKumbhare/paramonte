
####################################################################################################################################
####################################################################################################################################
#' @title An [`R6`] `ParaMonteSampler` class for [paramonte] package usage
#' @description This is the `ParaMonteSampler` base class for the ParaMonte sampler routines. This class is NOT meant to be directly
#' accessed or called by the user of the [paramonte] package. However, its children, such as the [`ParaDRAM`] sampler class will be
#' directly accessible to the public.
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
                                updateUserSucess     = updateUserSucess      # updateUserSucess >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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
                                #' @description
                                #' Return a R list of the contents of a set of ParaMonte simulation(s) output chain files whose names
                                #' begin the user-provided prefix, specified, by the input simulation specification pmpd.spec.outputFileName.
                                #' ### WARNING
                                #' This method is to be only used for post-processing of the output chain file(s) of an already finished
                                #' simulation. It is NOT meant to be called by all processes in parallel mode, although it is possible.
                                #' @param file
                                #' (optional)\cr
                                #' A string representing the path to the chain file with the default value of []. The path only needs to
                                #' uniquely identify the name of the simulation to which the chain file belongs.\cr
                                #' For example, specifying "./mydir/mysim" as input will lead to a search for a file that begins with
                                #' "mysim" and ends with "_chain.txt" inside the directory "./mydir/".\cr
                                #' If there are multiple files with such name, then all of them will be read and returned as a list.\cr
                                #' If this input argument is not provided by the user, the value of the object's `spec` attribute
                                #' `outputFileName` will be used instead.\cr
                                #' If the specified path is a URL, the file will be downloaded as a temporary file to the local system
                                #' and its contents will be parsed and the file will be subsequently removed.\cr
                                #' If no input is specified via any of the possible routes, the method will search for any possible
                                #' candidate file with the appropriate suffix in the current working directory.\cr
                                #' @examples
                                #' pmpd$readChain()
                                #' # or
                                #' pmpd$readChain("./out/test_run_")
                                #' # or
                                #' pmpd$spec$outputFileName = "./out/test_run_"
                                #' pmpd.readChain()
                                #' @param delimiter
                                #' (optional)\cr
                                #' Optional input string representing the delimiter used in the output chain file. If it is not provided
                                #' as input argument, the value of the corresponding object's `spec` attribute `outputDelimiter` will be
                                #' used instead. If none of the two are available, the default comma delimiter "," will be assumed and used.\cr
                                #' @example
                                #' pmpd$readChain("./out/test_run_", " ")
                                #' # or
                                #' pmpd$spec$outputDelimiter = " "
                                #' pmpd$readChain("./out/test_run_")
                                #' # or
                                #' pmpd$spec$outputFileName  = "./out/test_run_"
                                #' pmpd$spec$outputDelimiter = " "
                                #' pmpd$readChain()
                                #' @return Return a R list of the contents of a set of ParaMonte simulation(s) output chain files
                                readChain       = function(file, delimiter) {
                                    readEverything = readEverything( file, arg2, arg3 = TRUE, arg4 = FALSE, delimiter, parseContents, renabled )
                                },

                                # readSample >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                #' @description
                                #' @param website blablablablabla
                                #' @return Returns a
                                readSample      = readEverything,

                                # readReport >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                #' @description
                                #' @param website blablablablabla
                                #' @return Returns a
                                readReport      = readEverything,

                                # readRestart >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                #' @description
                                #' @param website blablablablabla
                                #' @return Returns a
                                readRestart     = readEverything,

                                # readProgress >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                #' @description
                                #' @param website blablablablabla
                                #' @return Returns a
                                readProgress    = readEverything,

                                # readMarkovChain >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                #' @description
                                #' @param website blablablablabla
                                #' @return Returns a
                                readMarkovChain = readEverything

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
