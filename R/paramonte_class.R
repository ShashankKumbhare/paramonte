
####################################################################################################################################
####################################################################################################################################
#' @title An [`R6`] `paramonte_class` for **[paramonte]** package usage
#' @description
#' `paramonte_class$new()` initializes a `paramonte_class` object.\cr
#' It can then be used to instantiate [`ParaDRAM`] samplers object.\cr
#' @import ggplot2
#' @import grDevices
#' @import utils
#' @export
####################################################################################################################################
####################################################################################################################################


####################################################################################################################################
################################## paramonte_class #################################################################################
# >>

    # Sourcing Methods / Classes / Auxiliary-functions >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    # library('R6')
    # source(       paste( getwd(), "/", "paramonte/auxil/functions/sourceFolder.R", sep = "" ) )
    # sourceFolder( paste( getwd(), "/", "paramonte/auxil/functions", sep = "" ) )
    # sourceFolder( paste( getwd(), "/", "paramonte/auxil/classes", sep = "" ) )
    # source(       paste( getwd(), "/", "paramonte/interface/@ParaDRAM/ParaDRAM.R", sep = "" ) )
    # source(       paste( getwd(), "/", "paramonte/interface/@ParaDRAM/ParaDRAMUnlocked.R", sep = "" ) )
    # thisFileDir = getThisFileDir()

    # <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Sourcing Methods / Classes / Auxiliary-functions

paramonte_class <- R6::R6Class( "paramonte", cloneable = FALSE,

                            # Private >> ###########################################################################################

                            private = list(

                                Err     = NULL,
                                libName = "paramonte"

                            ), # << Private

                            # Public >> ############################################################################################

                            public = list(

                                website  = list(),
                                authors  = NULL,
                                credits  = NULL,
                                version  = NULL,
                                platform = "",
                                names    = list( paramonte = "ParaMonte",
                                                 paradram  = "ParaDRAM",
                                                 matdram   = "MatDRAM",
                                                 paradise  = "ParaDISE",
                                                 paranest  = "ParaNest",
                                                 paratemp  = "ParaTemp" ),

                                # initialize >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                #' @description Instantiates a `paramonte_class` object.
                                #' @return Returns a [`R6`] object.
                                #' @examples
                                #' pm   = paramonte_class$new()
                                initialize = function( ) {

                                    private$Err        = Err_class$new()
                                    private$Err$prefix = private$libName

                                    private$Err$note   = 0
                                    private$Err$note   = "'paramonte' object has been created."

                                    # class(self) = private$libName

                                    self$print()

                                },

                                # ParaDRAM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                #' @description This method instantiate a [`R6`] [`ParaDRAM`] class object. \cr
                                #' It can then be used to call [`ParaDRAM`] routines. \cr
                                #' This is the [`ParaDRAM`] class constructor to generate instances of **serial** and **parallel**
                                #' **Delayed-Rejection Adaptive Metropolis-Hastings Markov Chain Monte Carlo** sampler class
                                #' of the [`paramonte`] library. The [`ParaDRAM`] class is a child of the [`ParaMonteSampler`] class. \cr
                                #' The object of [`ParaDRAM`] class can be instantiated only via [`paramonte_class`] object method, \cr
                                #' (for example: `pm$ParaDRAM()`, where `pm = parmonte_classs$new()` ).\cr
                                #' All [`ParaDRAM`] class attributes are optional and all attributes can be set after a [`ParaDRAM`]
                                #' instance is returned by the class constructor.
                                #' @return Returns a [`R6`] object.
                                #' @examples
                                #' pm   = paramonte_class$new()
                                #' pmpd = pm$ParaDRAM()
                                ParaDRAM = function() {

                                    ParaDRAMObj = ParaDRAM$new()

                                    lockEnvironment(ParaDRAMObj)

                                    return( ParaDRAMObj )

                                },

                                # print >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                #' @description Prints `paramonte_class` object usage.
                                #' @examples
                                #' pm = paramonte_class$new()
                                #' pm$print()
                                #' # or
                                #' @examples
                                #' pm = paramonte_class$new()
                                #' pm
                                print = function( ) {

                                    tab             = private$Err$tab

                                    private$Err$box = paste( "To instantiate 'ParaDRAM' object try:", "\n",
                                                             "\n",
                                                             tab, "pmpd = pm$ParaDRAM()", "\n",
                                                             sep = "" )

                                }

                            ) # << Public

)
# <<
################################## paramonte_class #################################################################################
####################################################################################################################################


# ####################################################################################################################################
# ################################## paramonte #######################################################################################
# # >>
# paramonte = function() {  return( paramonte_class$new() )  }
# # <<
# ################################## paramonte #######################################################################################
# ####################################################################################################################################
