# 封装成函数
# x = Sys.time()
# library()
gene.chain = function(p.length,p.prob,p.num,p.seed = 1){
  set.seed(p.seed)
  savelist = list()
  for(i in 1:p.num){

    ei = rbinom(p.length,1,p.prob)*2 - 1
    xi = c(0,cumsum(ei))
    savelist[[i]] = data.frame("Times" = 1:(p.length+1),
                               "Value" = xi,
                               "chainId" = i)
  }
  dtplot = do.call(rbind,savelist)
  dtplot$chainId = factor(dtplot$chainId)
  return(dtplot)
}


plot.chain = function(dtplot){
  # library(ggplot2)
  p = ggplot(dtplot,aes(x = Times,y = Value,group = chainId,color = chainId))+
    geom_line()+
    geom_abline(intercept = 0,slope = 0)+geom_abline(slope = 0,intercept = -20,col = 2)
  return(p)
}
