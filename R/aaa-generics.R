#'A summary method for the l1tf output
#'
#'\code{summary} returns a summary of the l1tf output
#'
#'@param object An object of class l1tf_obj
#'
#'@export

setMethod("summary",
          signature(object = "l1tf_obj"),
          function (object, ...)
          {
            return(object@summary.df)
          }
)

#'A ggplot2 method for the l1tf output
#'
#'\code{ggplot} returns a ggplot of the l1tf output
#'
#'@export

setMethod("ggplot",
          signature(data = "l1tf_obj"),
          function (data, ...)
          {
            ggplot(data@series.df)+
              geom_point(aes(x = index, y = y.proc))+
              geom_point(aes(x = index, y = trend))+
              geom_vline(xintercept=unique(data@summary.df$start)[-1],linetype=2,colour="blue")
          }
)
