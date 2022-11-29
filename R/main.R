#' Plot random walk chain
#'
#' Make it easy to plot. Thank you for using it.
#'
#' @param p.length length of the generated chain
#' @param p.prob probability to win in one game
#' @param p.num ...
#' @param p.seed random seed
#'
#' @return  No return but plot the figure.
#' @examples
#' main(100,0.5,5,1)
#' main(100,0.51,5,1)
#' main(100,0.4,5,1)
#' main(100,0.6,5,1)
#' @export
#' @importFrom ggplot2 ggplot aes geom_line geom_abline
main = function(p.length,p.prob,p.num,p.seed = 1){
  dt.plot = gene.chain(p.length,p.prob,p.num,p.seed)
  toplot = plot.chain(dt.plot)
  plot(toplot)
}

