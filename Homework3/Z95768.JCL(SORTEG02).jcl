//SORTEG02 JOB ' ',CLASS=A,MSGLEVEL=(1,1),MSGCLASS=X,NOTIFY=&SYSUID
//DELET100 EXEC PGM=IDCAMS
//SYSPRINT DD SYSOUT=*
//SYSIN    DD *
    DELETE Z95768.QSAM.AA NONVSAM
    DELETE Z95768.QSAM.BB NONVSAM
    IF LASTCC LE 08 THEN SET MAXCC = 00
//SORT0200 EXEC PGM=SORT
//SYSOUT   DD SYSOUT=*
//SORTIN   DD *
10002949AHMET          SEZER          19410913
10002840MUSTAFA        ATATÜRK        18810519
10002978SULEYMAN       DEMIREL        19241101
10001949KENAN          EVREN          19170717
10001840CEVDET         SUNAY          18990210
10002949FAHRI          KORUTURK       19030803
10002840CEMAL          GURSEL         18951013
10002978RECEP          ERDOGAN        19540226
10001949ABDULLAH       GÜL            19501029
10001840ISMET          INONU          18840924
//SORTOUT  DD DSN=Z95768.QSAM.AA,
//            DISP=(NEW,CATLG,DELETE),
//            SPACE=(TRK,(5,5),RLSE),
//            DCB=(RECFM=FB,LRECL=60)
//SYSIN    DD *
    SORT FIELDS=(1,7,CH,A)
    OUTREC FIELDS=(1,38,39,8,Y4T,TOJUL=Y4T,15C'0')
//DELET300 EXEC PGM=IEFBR14
//FILE01   DD DSN=Z95768.QSAM.BB,
//             DISP=(MOD,DELETE,DELETE),SPACE=(TRK,0)
//SORT0400 EXEC PGM=SORT
//SYSOUT   DD SYSOUT=*
//SORTIN   DD DSN=Z95768.QSAM.AA,DISP=SHR
//SORTOUT  DD DSN=Z95768.QSAM.BB,
//            DISP=(NEW,CATLG,DELETE),
//            SPACE=(TRK,(5,5),RLSE),
//            DCB=(RECFM=FB,LRECL=50)
//SYSIN    DD *
    SORT FIELDS=COPY
        OUTREC FIELDS=(1,5,ZD,TO=PD,LENGTH=3,
                       6,3,ZD,TO=PD,LENGTH=2,
                       9,30,
                       39,7,ZD,TO=PD,LENGTH=4,
                       46,15,ZD,TO=PD,LENGTH=8)
