
####################################################################################################################################
################################## ParaDRAM-doc ####################################################################################
# >>
#'
#' @name ParaDRAM
#'
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#'
#' @import ggplot2
#' @import grDevices
#' @import methods
#' @import utils
#' @import tools
#'
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#'
#' @export
#'
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#'
#' @title An [`R6`] ``r className = "`ParaDRAM`"`` class for [paramonte] package usage
#'
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#'
#' @description
#'
#-----------------------------------------------------------------------------------------------------------------------------------
#' \describe{\item{}{
#-----------------------------------------------------------------------------------------------------------------------------------
#'
#' This is the `ParaDRAM` class to generate instances of **serial** and **parallel** **Delayed-Rejection Adaptive Metropolis-Hastings**
#' **Markov Chain Monte Carlo** sampler class of the [`paramonte`] library.
#'
#' The `r className` class is a child of the [``r superClassName = "`ParaMonteSampler`"``][`r superClassName`] class.
#'
#' All `ParaDRAM` class attributes are optional and all attributes can be set after a `ParaDRAM` instance is returned by the class
#' constructor.
#'
#' Once you set the optional attributes to your desired values, call the ParaDRAM sampler via the object's method `runSampler()`.
#'
#' \out{<hr>}}}
#'
#' \describe{\item{}{\describe{
#-----------------------------------------------------------------------------------------------------------------------------------
#' \item{**Example serial usage**}{
#-----------------------------------------------------------------------------------------------------------------------------------
#'
#' Copy and paste the following code in your R session:
#'
#' ```
#' getLogFunc = function(point) {
#'     # return the log of a multivariate Normal
#'     # density function with ndim dimensions
#'     return( -0.5 * np.dot(point, point) )
#' }
#' pmpd = ParaDRAM$new()
#' pmpd$runSampler ( ndim = 4, # assume 4-dimensional objective function
#'                   getLogFunc = getLogFunc    # the objective function
#' )
#' ```
#'
#' where,
#'
#' - `ndim`
#'
#'   represents the number of dimensions of the domain of the user’s objective function `getLogFunc(point)` and,
#'
#' - `getLogFunc(point)`
#'
#'   represents the user’s objective function to be sampled, which must take a single input argument `point` of type vector of length
#'   `ndim` and must return the natural logarithm of the objective function.
#'
#' testing nested indenting
#'
#'   \describe{\item{**Example serial usage**}{
#'
#'   this should be under 2nd indentation
#'
#'   }}
#'
#' }
#'
#' \out{<hr>}
#'
#-----------------------------------------------------------------------------------------------------------------------------------
#' \item{**Example parallel usage**}{
#-----------------------------------------------------------------------------------------------------------------------------------
#'
#' TO_DO_LATER entire section
#'
#' Copy and paste the following code in your R session:
#'
#' ```
#' TO_DO_LATER
#' TO_DO_LATER
#' TO_DO_LATER
#' TO_DO_LATER
#' ```
#'
#' where,
#'
#' - `ndim`
#'
#'   represents the number of dimensions of the domain of the user’s objective function `getLogFunc(point)` and,
#'
#' - `getLogFunc(point)`
#'
#'   represents the user’s objective function to be sampled, which must take a single input argument `point` of type vector of length
#'   `ndim` and must return the natural logarithm of the objective function.
#'
#' - `mpiEnabled`
#'
#'   is a logical (boolean) indicator that, if `TRUE`, will cause the ParaDRAM simulation to run in parallel on the requested number
#'   of processors. The default value is `FALSE`.
#'
#' }
#'
#' \out{<hr>}
#'
#-----------------------------------------------------------------------------------------------------------------------------------
#' \item{**Note**}{
#-----------------------------------------------------------------------------------------------------------------------------------
#'
#' TO_DO_LATER entire section
#'
#' }
#'
#' \out{<hr>}
#'
#-----------------------------------------------------------------------------------------------------------------------------------
#' \item{**Tips on parallel usage**}{
#-----------------------------------------------------------------------------------------------------------------------------------
#'
#' TO_DO_LATER entire section
#'
#' }
#'
#' \out{<hr>}
#'
#-----------------------------------------------------------------------------------------------------------------------------------
#' \item{**ParaDRAM Class Attributes**}{
#-----------------------------------------------------------------------------------------------------------------------------------
#'
#' See also:
#'
#' - <https://www.cdslab.org/paramonte/notes/usage/paradram/specifications/>
#'
#' All input specifications (attributes) of a ParaDRAM simulation are optional. However, it is recommended that you provide as much
#' information as possible about the specific ParaDRAM simulation and the objective function to be sampled via ParaDRAM simulation
#' specifications.
#'
#' The ParaDRAM simulation specifications have lengthy comprehensive descriptions that appear in full in the output report file of
#' every ParaDRAM simulation.
#'
#' The best way to learn about individual ParaDRAM simulation attributes is to a run a minimal serial simulation with the following
#' R script,
#'
#' ```
#' pmpd = ParaDRAM()
#' pmpd$spec$outputFileName = "./test"
#' getLogFunc = function(point){
#'     return( -sum(point**2) )
#' }
#' pmpd$runSampler( ndim = 1, getLogFunc = getLogFunc )
#' ```
#'
#' Running this code will generate a set of simulation output files (in the current working directory of R) that begin with the
#' prefix test_process_1. Among these, the file test_process_1_report.txt contains the full description of all input specifications
#' of the ParaDRAM simulation as well as other information about the simulation results and statistics.
#'
#' }
#'
#' \out{<hr>}
#'
#-----------------------------------------------------------------------------------------------------------------------------------
#' \item{**Parameters**}{
#-----------------------------------------------------------------------------------------------------------------------------------
#'
#' None. The simulation specifications can be set once an object is instantiated. All simulation specification descriptions are
#' collectively available at:
#'
#' - <https://www.cdslab.org/paramonte/notes/usage/paradram/specifications/>
#'
#' Note that this is the new interface. The previous ParaDRAM class interface used to optionally take all simulation specifications
#' as input. However, overtime, this approach has become more of liability than any potential benefit. All simulation specifications
#' have to be now to be set solely after a ParaDRAM object is instantiated, instead of setting the specifications via the ParaDRAM
#' class constructor.
#'
#' }
#'
#' }}}
#'
#' @section .: . \out{<hr>}
#'
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#'
#' @section Super class:
#'
#' - [``r paste0("`paramonte::", gsub("`", "", superClassName), "`")``][`r superClassName`] -> `r className`
#'
#-----------------------------------------------------------------------------------------------------------------------------------
#' @inheritSection ParaMonteSampler Super class
#-----------------------------------------------------------------------------------------------------------------------------------
#'
#' @section ..: .. \out{<hr>}
#'
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#'
#' @section Public fields:
#'
#-----------------------------------------------------------------------------------------------------------------------------------
#' \describe{\item{}{\describe{\item{[`r className`] **fields**}{\describe{
#-----------------------------------------------------------------------------------------------------------------------------------
#'
#' \item{-- none --}{}
#'
#' }}}}}
#'
#-----------------------------------------------------------------------------------------------------------------------------------
#' @inheritSection ParaMonteSampler Public fields
#-----------------------------------------------------------------------------------------------------------------------------------
#'
#' @section ...: ... \out{<hr>}
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
#'   Instantiates a [`r className`] class object.
#'
#' }
#'
#' \item{**Usage**}{
#'
#'   ```
#'   ParaDRAM$new()
#'   ```
#'
#' }
#'
#' \item{**Arguments**}{\describe{
#'
#'   \item{-- none --`}{}
#'
#' }}
#'
#' \item{**Returns**}{
#'
#'   Returns a new [`r className`] class object.
#'
#' }
#'
#' }}}
#'
#' @section ....: .... \out{<hr>}
#'
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#'
#' @section Methods:
#'
#-----------------------------------------------------------------------------------------------------------------------------------
#' \describe{\item{}{ [`r className`] **methods**
#-----------------------------------------------------------------------------------------------------------------------------------
#'
#'   - -- none --
#'
#' }}
#'
#-----------------------------------------------------------------------------------------------------------------------------------
#' @inheritSection ParaMonteSampler Methods
#-----------------------------------------------------------------------------------------------------------------------------------
#'
#' @section .....: ..... \out{<hr>}
#'
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#'
#' @section Methods description:
#'
#-----------------------------------------------------------------------------------------------------------------------------------
#' @inheritSection ParaMonteSampler Methods description
#-----------------------------------------------------------------------------------------------------------------------------------
#'
# <<
################################## ParaDRAM-doc ####################################################################################
####################################################################################################################################
NULL


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
                                initialize = function( ) {

                                    # super$initialize(platform, website)                                  # >> ParaMonteSampler class
                                    super$initialize( methodName = "ParaDRAM")                           # >> ParaMonteSampler class

                                    private$method$isParaDRAM = TRUE
                                    private$Err$prefix        = private$methodName

                                    textParaDRAMUnlocked      = getTextParaDRAMUnlocked()

                                    eval( parse(text = textParaDRAMUnlocked) )

                                    private$ParaDRAMUnlocked  = ParaDRAMUnlocked

                                    self$print()

                                },

                                # print >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
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
