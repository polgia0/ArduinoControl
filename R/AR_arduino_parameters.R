AR_arduino_parameters<-function(arduino,batch=NULL){
  if(is.null(batch)){
    ans<-inpboxe3(c('Delay (ms)','Period(s) ','N.points  '),
                  c(arduino$delay,arduino$period,arduino$points))
  }else{
    ans<-batch
  }
  if(!is.null(ans)){
    arduino$delay<-as.integer(ans[[1]])
    arduino$period<-as.integer(ans[[2]])
    arduino$points<-as.integer(ans[[3]])
    return(arduino)
  }
}
