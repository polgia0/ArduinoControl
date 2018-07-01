AR_arduino_port<-function(arduino,batch=NULL){
  arduino$analog<-rep('',12)
  arduino$digital<-rep('',14)
  if(is.null(batch)){
	ans<-inpboxc('COM',as.character(1:38))
  }else{
	ans<-batch
  }
  if(!is.null(ans)){
    arduino$com<-as.numeric(ans[[1]])
  }else{
    arduino$com<-NA
  }
  #default values
  arduino$bdrate<-9600
  arduino$mode<-8
  arduino$parity<-0
  arduino$bit<-1
  return(arduino)
}

