AR_arduino_start<-function(arduino){
  if(!is.null(arduino$com)){
    if(!is.null(arduino$points)){
      arduino$table<-data.frame(A0=0,A1=0,A2=0,A3=0,A4=0,A5=0,DA1=0,DA2=0,DA4=0,DA7=0,
                                DA8=0,DA12=0,DA13=0)
      dc<-NULL
      if(arduino$analog[1]=='')dc<-c(dc,1)
      if(arduino$analog[2]=='')dc<-c(dc,2)
      if(arduino$analog[3]=='')dc<-c(dc,3)
      if(arduino$analog[4]=='')dc<-c(dc,4)
      if(arduino$analog[5]=='')dc<-c(dc,5)
      if(arduino$analog[6]=='')dc<-c(dc,6)
      if(arduino$digital[1]=='')dc<-c(dc,7)
      if(arduino$digital[2]=='')dc<-c(dc,8)
      if(arduino$digital[3]=='')dc<-c(dc,9)
      if(arduino$digital[4]=='')dc<-c(dc,10)
      if(arduino$digital[5]=='')dc<-c(dc,11)
      if(arduino$digital[6]=='')dc<-c(dc,12)
      if(arduino$digital[7]=='')dc<-c(dc,13)
      arduino$table<-arduino$table[,-dc]
	    arduino$table<-as.data.frame(arduino$table)
      if(ncol(arduino$table)>0){
        arduino$input<-paste(collapse(arduino$analog,sep=''),collapse(arduino$digital,sep=''),sep='')
        nr<-arduino$points
        nc<-ncol(arduino$table)
        vname<-names(arduino$table)
        arduino$table<-matrix(0,nrow=nr,ncol=nc)
        message<-rep('ok',nr)
        for(i in 1:nr){
          output<-.C('serial',sport=as.integer(c(arduino$com-1,
												 arduino$bdrate,
												 arduino$mode,
												 arduino$parity,
												 arduino$bit,
												 2000,
												 arduino$delay,
												 100)),
		                      bufin=arduino$input,
							  bufout=str_dup(' ',4096))
          out<-str_split(output$bufout,'oo')
          if(length(out[[1]])!=(nc+1)){
            message[i]<-out[[1]]
          }else{
            if(dev.cur()>1)dev.off(which = dev.cur())
            dev.new()
            for(j in 1:nc){
              arduino$table[i,j]<-as.integer(out[[1]][j])
            }
            ym<-min(arduino$table[1:i,1:nc])
            yM<-max(arduino$table[1:i,1:nc])
            plot(arduino$table[1:i,1],ylim=c(ym,yM),xlim=c(1,nr),ty='n',ylab='Outputs',xlab='Sampling Point')
            grid()
            for(j in 1:nc){
              points(arduino$table[1:i,j],pch=j)
            }
            Sys.sleep(arduino$period)
          }
        }
        arduino$table<-as.data.frame(arduino$table)
        names(arduino$table)<-vname
        arduino$table<-data.frame(arduino$table,message=message)
        return(arduino)
      }else{
        messagebox('Choose some I/O first!')}
    }else{
      messagebox('Set Parameters first!')}
  }else{
    messagebox('Any Port chosen!')}
}
