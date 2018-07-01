#include <stdlib.h>
#include <stdio.h>
#include<string.h>
#ifdef _WIN32
#include <Windows.h>
#else
#include <unistd.h>
#endif
#include "rs232.h"
void copy_string(char*,unsigned char*);

void serial(int *sport, char **bufin, char **bufout){
  int n,i,k,nout,port,bdrate,wait1,wait2,wait3;
  char mode[4];
  unsigned char buf[4096];
  char comd[512];
  char message[11][512];
  strcpy(message[0],"Can not open comport");
  strcpy(message[1],"illegal comport number");
  strcpy(message[2],"invalid baud rate");
  strcpy(message[3],"invalid mode");
  strcpy(message[4],"invalid number of data-bits");
  strcpy(message[5],"invalid parity");
  strcpy(message[6],"invalid number of stop bits");
  strcpy(message[7],"unable to open comport");
  strcpy(message[8],"unable to set comport dcb settings");
  strcpy(message[9],"unable to set comport cfg settings");
  strcpy(message[10],"unable to set comport time-out settings");
  port=sport[0];
  bdrate=sport[1];
  mode[0]=(sport[2]+'0');
  if(sport[3]==0){mode[1]='N';}
  if(sport[3]==1){mode[1]='E';}
  if(sport[3]==2){mode[1]='O';}
  mode[2]=(sport[4]+'0');
  mode[3]=0;
  wait1=sport[5];
  wait2=sport[6];
  wait3=sport[7];
  nout=RS232_OpenComport(port, bdrate, mode);
  if(nout!=0){
    n=sizeof(message[nout]);
    for (k=0;k<=n;k++){
        buf[k]=message[nout][k];
    }
	copy_string(bufout[0],buf);
    return;
  }
  #ifdef _WIN32
    Sleep(wait1);
  #else
    usleep(wait1*1000);
  #endif
  /* write on Arduino */
    strcpy(comd,bufin[0]);
    RS232_cputs(port,comd);
  #ifdef _WIN32
    Sleep(wait2);
  #else
    usleep(wait2*1000);
  #endif
    /* read from Arduino */
    n = RS232_PollComport(port, buf, 4095);
  #ifdef _WIN32
    Sleep(wait3);
  #else
    usleep(wait3*1000);
  #endif
     if(n > 0){
        buf[n] = 0;
        for(i=0; i < n; i++){
            if(buf[i] < 32){
              buf[i] = 'o';
            }
        }
    }
	copy_string(bufout[0],buf);
  RS232_CloseComport(port);
  #ifdef _WIN32
    Sleep(wait1);
  #else
    usleep(wait1*1000);
  #endif
  return;
}

void copy_string(char *target,unsigned char *source)
{
   while(*source)
   {
      *target = *source;
      source++;
      target++;
   }
   *target = '\0';
}