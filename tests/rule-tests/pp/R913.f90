13 WRITE(*,FMT=*) a
WRITE(6,FMT=*) b
WRITE(10,FMT=*) c
WRITE(n,FMT=*,IOSTAT=ios) d
WRITE(*,ERR=999) e
WRITE(10,ERR=999,IOSTAT=i,ADVANCE="yes",REC=2,FMT=10) f
10 FORMAT(I3)
999 END PROGRAM
