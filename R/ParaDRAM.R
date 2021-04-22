
####################################################################################################################################
####################################################################################################################################
#' @title An [`R6`] `ParaDRAM` class for [paramonte] package usage
#' @description
#' This is the `ParaDRAM` class to generate instances of **serial** and **parallel**
#' **Delayed-Rejection Adaptive Metropolis-Hastings Markov Chain Monte Carlo** sampler class
#' of the [`paramonte`] library. The `ParaDRAM` class is a child of the [`ParaMonteSampler`] class. \cr
#' The object of this class can be instantiated only via [`paramonte_class`] object method,\cr
#' (for example: `pm$ParaDRAM()`, where `pm = parmonte_classs$new()` ).\cr
#' All `ParaDRAM` class attributes are optional and all attributes can be set after a `ParaDRAM`
#' instance is returned by the class constructor.
####################################################################################################################################
####################################################################################################################################


####################################################################################################################################
################################## ParaDRAM ########################################################################################
# >>

    # Sourcing Methods / Classes / Auxiliary-functions >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    # library('R6')
    # source(       paste( getwd(), "/", "paramonte/auxil/functions/sourceFolder.R", sep = "" ) )
    # sourceFolder( paste( getwd(), "/", "paramonte/auxil/functions", sep = "" ) )
    # sourceFolder( paste( getwd(), "/", "paramonte/auxil/classes", sep = "" ) )
    # sourceFolder( paste( getwd(), "/", "paramonte/interface/@ParaMonteSampler", sep = "" ) )
    # thisFileDir = getThisFileDir()

    # <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Sourcing Methods / Classes / Auxiliary-functions

ParaDRAM <- R6::R6Class(    "ParaDRAM", cloneable = FALSE,

                            inherit = ParaMonteSampler,

                            # Private >> ###########################################################################################

                            private = list(

                                ParaDRAMUnlocked = NULL

                            ), # << Private

                            # Public >> ############################################################################################

                            public = list(

                                # initialize >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                #' @description Instantiates a `ParaDRAM` class object.
                                #' @return Returns a new `ParaDRAM` class object.
                                #' @examples
                                #' pm   = paramonte_class$new()
                                #' pmpd = pm$ParaDRAM()
                                initialize = function( platform = "",
                                                       website  = "" ) {

                                    super$initialize(platform, website)                                  # >> ParaMonteSampler class

                                    private$method$isParaDRAM = TRUE
                                    private$Err$prefix        = private$methodName

                                    textParaDRAMUnlocked      = getTextParaDRAMUnlocked()

                                    eval( parse(text = textParaDRAMUnlocked) )

                                    private$ParaDRAMUnlocked  = ParaDRAMUnlocked

                                    self$print()

                                },

                                # print >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                #' @description Prints `ParaDRAM` object usage.
                                #' @examples
                                #' pm   = paramonte_class$new()
                                #' pmpd = pm$ParaDRAM()
                                #' pmpd$print()
                                #' # or
                                #' @examples
                                #' pm   = paramonte_class$new()
                                #' pmpd = pm$ParaDRAM()
                                #' pmpd
                                print = function() {

                                    tab             = private$Err$tab

                                    private$Err$box = paste( "Post-Processing Usage:", "\n",
                                                             "\n",
                                                             tab, "Call ParaDRAM routines as:", "\n",
                                                             "\n",
                                                             tab, tab, "To read Chain file:    pmpd$readChain('filename')   ", "\n",
                                                             tab, tab, "To read Sample file:   pmpd$readSample('filename')  ", "\n",
                                                             tab, tab, "To read Report file:   pmpd$readReport('filename')  ", "\n",
                                                             tab, tab, "To read Restart file:  pmpd$readRestart('filename') ", "\n",
                                                             tab, tab, "To read Progress file: pmpd$readProgress('filename')", "\n",
                                                             sep = "" )

                                }

                            ) # << Public

)
# <<
################################## ParaDRAM ########################################################################################
####################################################################################################################################


####################################################################################################################################
################################## Help Code #######################################################################################
# >>
# pmpd = ParaDRAM$new()
# pmpd
# <<
################################## Help Code #######################################################################################
####################################################################################################################################
