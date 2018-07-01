env_arduino<-as.environment(1)

.onAttach<-function(libname, pkgname){
  arduino_toolbar()
  arduino<-list(com='',
                analog='',
                ansanalog=c(rep(0,6),rep(0,6),rep(0,6)),
                digital='',
                ansdigital=c(rep(0,7),rep(0,7)),
                delay=500,
                period=5,
                points=10,
                input='',
                table=0)
  assign('arduino',arduino,envir=env_arduino)
}

arduino_toolbar<-function(){
  # bar definition
  arduinobar<-gtkMenuBar()
  # Data Handling item
  DH_menu<-gtkMenu()
  DH_item<-gtkMenuItemNewWithMnemonic(label="_Arduino UNO")
  DH_item$setSubmenu(DH_menu)
  arduinobar$append(DH_item)
  DHport_item<-gtkMenuItemNewWithMnemonic(label="_Port")
  gSignalConnect(DHport_item,"activate",
                 function(item){
                   get('arduino',envir=env_arduino)
                   arduino<-AR_arduino_port(arduino)
                   assign('arduino',arduino,envir=env_arduino)

                 })
  DH_menu$append(DHport_item)
  DHanal_item<-gtkMenuItemNewWithMnemonic(label="_Analog")
  gSignalConnect(DHanal_item,"activate",
                 function(item){
                   get('arduino',envir=env_arduino)
                   arduino<-AR_arduino_analog(arduino)
                   assign('arduino',arduino,envir=env_arduino)
                 })
  DH_menu$append(DHanal_item)
  DHdigi_item<-gtkMenuItemNewWithMnemonic(label="_Digital")
  gSignalConnect(DHdigi_item,"activate",
                 function(item){
                   get('arduino',envir=env_arduino)
                   arduino<-AR_arduino_digital(arduino)
                   assign('arduino',arduino,envir=env_arduino)
                 })
  DH_menu$append(DHdigi_item)
  DHpara_item<-gtkMenuItemNewWithMnemonic(label="_Parameters")
  gSignalConnect(DHpara_item,"activate",
                 function(item){
                   get('arduino',envir=env_arduino)
                   arduino<-AR_arduino_parameters(arduino)
                   assign('arduino',arduino,envir=env_arduino)
                 })
  DH_menu$append(DHpara_item)
  DHstart_item<-gtkMenuItemNewWithMnemonic(label="_Start")
  gSignalConnect(DHstart_item,"activate",
                 function(item){
                   get('arduino',envir=env_arduino)
                   arduino<-AR_arduino_start(arduino)
                   assign('arduino',arduino,envir=env_arduino)
                 })
  DH_menu$append(DHstart_item)

  # build bar
  arduino_window<-gtkWindow(type='GTK_WINDOW_TOPLEVEL')
  arduino_vbox<-gtkVBox()
  arduino_window$add(arduino_vbox)
  arduino_vbox$packStart(arduinobar,FALSE,FALSE)
  arduino_window$setTitle('Board Menubar')
  arduino_window$SetResizable(FALSE)
  arduino_window$Resize(750,20)
}
