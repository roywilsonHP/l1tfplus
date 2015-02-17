library(devtools)

??na.locf


#Load data and test L1 trend filter
data.1.df <- read.csv("C:/Users/wilsoroy/Desktop/data.1.csv")[,-1]

test.l1 <- l1extract(y.v = data.1.df[,20], prop = 0.8)

#develop methods and classes
method.skeleton("plot","l1tf_obj")

#test the plot method
plot(test.l1)
#test the summary method
summary(test.l1)

#Add data
somestocks <- data.1.df
devtools::use_data(somestocks,somestocks)

#Document
devtools::document()

#load and test package
rm(list=ls())
load_all("C:/Users/wilsoroy/Documents/GIT/l1tfplus")

check("C:/Users/wilsoroy/Documents/GIT/l1tfplus")

install_github("roywilsonHP/l1tfplus")

library(l1tfplus)

?l1trend

#Package testing-----------------------------------------------------------------------

data(somestocks)
data.sub <- somestocks[,1]
trend.est <- l1trend(y.v = data.sub,prop=0.2,sens=100,max.length=5,max.prop.na=0.2)
summary(trend.est)
plot(trend.est)



data(somestocks)
data.sub <- somestocks[,1]
trend.est <- l1trend(y.v = data.sub,prop=0.2,sens=100,max.length=5,max.prop.na=0.2)
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



