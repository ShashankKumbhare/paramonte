#' @details
#'
#' ## What is ParaMonte?
#'
#' ParaMonte is a serial / parallel library of Monte Carlo routines for sampling
#' mathematical objective functions of arbitrary-dimensions, in particular,
#' the posterior distributions of Bayesian models in data science,
#' Machine Learning, and scientific inference, with the design
#' goal of unifying the
#' - **automation** of Monte Carlo simulations,
#' - **user-friendliness** of the library,
#' - **accessibility** from multiple programming environments,
#' - **high-performance** at runtime, and,
#' - **scalability** across many parallel processors.
#'
#' For more information on the installation, usage, and examples, visit:
#' - <https://www.cdslab.org/paramonte>
#'
#' For the API documentation, visit:
#' - <https://www.cdslab.org/paramonte/notes/api/python>
#'
#' ## ParaMonte samplers
#' The routines currently supported by the ParaMonte Python library include:
#' - **ParaDRAM**\cr
#' Parallel Delayed-Rejection Adaptive Metropolis-Hastings Markov Chain Monte Carlo Sampler.
#' For a quick start, example scripts, and instructions on how to use the ParaDRAM sampler,
#'  type the following commands enclosed between the comment lines in your R session,\cr
#'  \cr
#' `##################################`\cr
#' `pm = paramonte_class$new()`\cr
#' `help("ParaDRAM")           # the input value is case-insensitive`\cr
#' `##################################`\cr
#' \cr
#' or,\cr
#' \cr
#' `##################################`\cr
#' `pm = paramonte_class$new()`\cr
#' `?ParaDRAM                  # get help on ParaDRAM sampler class`\cr
#' `##################################`
#'
#'
#' ## Naming conventions
#'
#' - The camelCase naming style is used throughout the entire ParaMonte
#' library, across all programming languages. The ParaMonte library is
#' a multi-language cross-platform library. To increase the consistently
#' and similarities of all implementations, a single naming convention
#' had to be used for all different languages.
#'
#' - All simulation specifications start with a lowercase letter, including
#' scalar/vector/matrix int, float, string, or boolean variables.
#'
#' - The name of any variable that represents a vector of values is normally
#' suffixed with `Vec`, for example: `startPointVec`, ...
#'
#' - The name of any variable that represents a matrix of values is normally
#' suffixed with `Mat`, for example: `proposalStartCorMat`, ...
#'
#' - The name of any variable that represents a list of varying-size values
#' is normally suffixed with `List`, like: `variableNameList`, ...
#'
#' - All static functions or methods of classes begin with a lowercase verb.
#'
#' - Significant attempt has been made to end all boolean variables with a
#' passive verb, such that the full variable name virtually forms a
#' proposition, that is, an English-language statement that should
#' be either `TRUE` or `FALSE`, set by the user.
#'
#' ## Tips
#'
#' - When running the ParaMonte samplers, in particular on multiple cores
#' in parallel, it would be best to close any such aggressive software or
#' applications as **Dropbox**, **ZoneAlarm**, ... that can interfere with
#' the ParaMonte simulation output files, potentially causing the sampler to
#' crash before the successful completion of the simulation.
#' These situations should however happen only scarcely.
#'
#' - On Windows systems, when restarting an old interrupted ParaMonte simulation,
#' ensure your Python session is also restarted before the simulation restart.
#' This may be needed as Windows sometimes locks access to some or all of the
#' simulation output files.
#'
#' - To unset an already-set input simulation specification, simply set the
#' simulation attribute to None or re-instantiate the sampler.
#'
#' @keywords internal
"_PACKAGE"

# The following block is used by usethis to automatically manage
# roxygen namespace tags. Modify with care!
## usethis namespace: start
## usethis namespace: end
NULL
