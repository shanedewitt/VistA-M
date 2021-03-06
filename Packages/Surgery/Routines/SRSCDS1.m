SRSCDS1 ;B'HAM ISC/MAM - SCHEDULED OPERATIONS BY SERVICE ; [ 07/27/98   2:33 PM ]
 ;;3.0; Surgery ;**50**;24 Jun 93
 W ! K IOP,%ZIS,POP,IO("Q")
 S %ZIS("A")="Print the list on which device: ",%ZIS="Q" D ^%ZIS G:POP END I $D(IO("Q")) K IO("Q") S ZTDESC="SCHEDULED OPERATIONS BY SERVICE",ZTRTN="SRS^SRSCDS1",(ZTSAVE("SRSDATE"),ZTSAVE("SRSITE*"))="" D ^%ZTLOAD G END
SRS ; entry when queued
 U IO S (SROR,SRQ,SRSS,SRTN)=0,Y=SRSDATE D D^DIQ S SRDATE=Y
OR F  S SROR=$O(^SRF("AOR",SROR)) Q:'SROR!SRQ  I $$ORDIV^SROUTL0(SROR,$G(SRSITE("DIV"))) F  S SRTN=$O(^SRF("AOR",SROR,SRSDATE,SRTN)) Q:'SRTN!SRQ  I $D(^SRF(SRTN,31)),$P(^(31),"^",4) S SRST=$P(^(31),"^",4) D UTL
 D PRINT W:$E(IOST)="P" @IOF I $D(ZTQUEUED) K ^TMP("SR",$J) Q:$G(ZTSTOP)  S ZTREQ="@" Q
 I '$D(^TMP("SR",$J)) D HDR W $$NODATA^SROUTL0()
END I 'SRQ,$E(IOST)'="P" W !!,"Press RETURN to continue  " R X:DTIME
 D ^SRSKILL K SRTN D ^%ZISC W @IOF
 Q
LOOP ; break procedure if greater than 65 characters
 S SROPS(M)="" F LOOP=1:1 S MM=$P(SROPER," "),MMM=$P(SROPER," ",2,200) Q:MMM=""  Q:$L(SROPS(M))+$L(MM)'<65  S SROPS(M)=SROPS(M)_MM_" ",SROPER=MMM
 Q
ZTSAVE S ZTSAVE("DT")=DT,ZTSAVE("SRS")=SRS,ZTSAVE("SRS(""C"")")=SRS("C"),ZTSAVE("SRS(""N"")")=SRS("N"),ZTSAVE("SRSITE*")=""
 Q
HDR ; print heading
 I $D(ZTQUEUED) D ^SROSTOP I SRHALT S SRQ=1 Q
 S SRZ=1 W:$Y @IOF W !,?20,"* Scheduled Operations for "_SRSS_" *",!,?30,SRDATE,!!,"Start Time",?13,"Patient",?43,"Operating Room",?67,"Ward Location",!,?13,"ID #",! F LINE=1:1:80 W "="
 Q
UTL ; set ^TMP("SR",$J)
 S DFN=$P(^SRF(SRTN,0),"^") D DEM^VADPT S SRNM=VADM(1),SRSSN=VA("PID"),SRWARD=$S($D(^DPT(DFN,.1)):$P(^(.1),"^"),1:""),SRSOP=$P(^SRF(SRTN,"OP"),"^"),SRSS=$P(^SRF(SRTN,0),"^",4) I SRWARD="" D WARD
 S SROR("N")=$P(^SRS(SROR,0),"^"),SROR("N")=$P(^SC(SROR("N"),0),"^")
 I SRSS S SRSS=$P(^SRO(137.45,SRSS,0),"^")
 S Y=SRST D D^DIQ S SRFIND=$F(Y,":"),SRTIME=$S(SRFIND:$E(Y,SRFIND-3,SRFIND+1),1:"")
 S:SRSS="" SRSS="NOT ENTERED" S SRSS=$P(SRSS,"(")
 S ^TMP("SR",$J,SRSS,SROR("N"),SRST)=SRNM_"^"_SRSOP_"^"_SRWARD_"^"_SRTIME_"^"_SRSSN
 Q
PRINT ; loop through ^TMP and print cases
 S (SROR,SRSS,SRST,SRZ)=0
 F  S SRSS=$O(^TMP("SR",$J,SRSS)) Q:SRSS=""!SRQ  D:SRZ PAGE Q:SRQ  D HDR F  S SROR=$O(^TMP("SR",$J,SRSS,SROR)) Q:SROR=""!SRQ  F  S SRST=$O(^TMP("SR",$J,SRSS,SROR,SRST)) Q:'SRST!SRQ  D OUT
 Q
OUT ; output data
 I $Y+5>IOSL D PAGE Q:SRQ  D HDR Q:SRQ
 S SR=^TMP("SR",$J,SRSS,SROR,SRST),SROPER=$P(SR,"^",2) K SROPS,MM,MMM S:$L(SROPER)<65 SROPS(1)=SROPER I $L(SROPER)>64 S SROPER=SROPER_"  " F M=1:1 D LOOP Q:MMM=""
 W !,$P(SR,"^",4),?12,$P(SR,"^"),?45,SROR,?67,$P(SR,"^",3),!,?12,$P(SR,"^",5),!,?12,SROPS(1) I $D(SROPS(2)) W !,?12,SROPS(2) I $D(SROPS(3)) W !,?12,SROPS(3)
 W ! F LINE=1:1:80 W "-"
 Q
PAGE I $E(IOST,1)'="P" W !!,"Press RETURN to continue or '^' to quit.  " R X:DTIME I '$T!(X="^") S SRQ=1
 Q
WARD ; check for scheduled admission
 S (X,PEND)=0 F  S PEND=$O(^DGS(41.1,"B",DFN,PEND)) Q:'PEND  S PDATE=$P(^DGS(41.1,PEND,0),"^",2) I PDATE>DT S SRWARD="ADM. PENDING",X=1
 Q:X=1  S SRWARD="OUTPATIENT"
 Q
