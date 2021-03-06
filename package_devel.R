library(devtools)

#Document package
devtools::document()

#load and test package
rm(list=ls())
load_all("C:/Users/wilsoroy/Documents/GIT/l1tfplus")

check("C:/Users/wilsoroy/Documents/GIT/l1tfplus")

install_github("roywilsonHP/l1tfplus")

library(l1tfplus)

#Package testing-----------------------------------------------------------------------

data(somestocks)
data.sub <- somestocks[,10]
trend.est <- l1trend(y.v = data.sub,prop=0.03,sens=100,max.length=5,max.prop.na=0.2)
summary(trend.est)
plot(trend.est)




#A potential ggplot2 method for the l1tf output----------------------------------------------------------------
#

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

#-----------------------------------------------------------------------------------------------------



