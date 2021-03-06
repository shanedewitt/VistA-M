SRSUTIN ;B'HAM ISC/MAM - INITIALIZE ^TMP FOR UTILIZATION ; 16 MAY 1990  10:55 AM
 ;;3.0; Surgery ;;24 Jun 93
ALL ; all Surgical Specialties
 S SRSS=0 F I=0:0 S SRSS=$O(^SRO(137.45,SRSS)) Q:'SRSS  S SRSP=$P(^SRO(137.45,SRSS,0),"^"),(SRSDATE,X)=SRSD D H^%DTC S SRD=%Y D ONE
 Q
ONE ; one surgical specialty
 D DAY F I=0:0 S SRSDATE=SRSDATE+1 Q:'SRSDATE!(SRSDATE>SRED1)  D DAY
 Q
DAY ; check for correct date
 S SRDOW=$S(SRD=0:"Sunday",SRD=1:"Monday",SRD=2:"Tuesday",SRD=3:"Wednesday",SRD=4:"Thursday",SRD=5:"Friday",SRD=6:"Saturday")
 I $E(SRSDATE,6,7)>28 S X=SRSDATE,%DT="" D ^%DT I Y<0 D DATE
 I $P($G(^SRU(SRSDATE,2,SRSS,0)),"^",4)["Y" S SRTIME=0,(SRSPST,SRSPEND)=SRSDATE D SET Q
 S TIMES=^SRU(SRSDATE,2,SRSS,0),SRSPST=$P(TIMES,"^",2),SRSPEND=$P(TIMES,"^",3)
 S X=SRSPST,X1=SRSPEND D MIN S SRTIME=X
SET S ^TMP("SR",$J,SRSDATE,SRSP)="0^0^"_SRTIME_"^0^"_SRSPST_"^"_SRSPEND
 I '($D(^TMP("SR",$J,"SP",SRSP))#2) S ^TMP("SR",$J,"SP",SRSP)="0^0^0^0"
 I '($D(^TMP("SR",$J))#2) S ^TMP("SR",$J)="0^0^0^0"
 S X=$P(^TMP("SR",$J,"SP",SRSP),"^",3),$P(^(SRSP),"^",3)=X+SRTIME
 S X=$P(^TMP("SR",$J),"^",3),$P(^($J),"^",3)=X+SRTIME
 S SRD=$S(SRD=6:0,1:SRD+1)
 Q
MIN ; minutes between two times
 S Y=$E(X1_"000",9,10)-$E(X_"000",9,10)*60+$E(X1_"00000",11,12)-$E(X_"00000",11,12),X2=X,X=$P(X,".",1)'=$P(X1,".",1) D ^%DTC:X S X=X*1440+Y
 Q
DATE ; correct date
 I $E(SRSDATE,4,5)=12 S SRSDATE=$E(SRSDATE,1,3)_"0101"+10000 Q
 S SRNEWM=$E(SRSDATE,4,5)+1 S:$L(SRNEWM)=1 SRNEWM="0"_SRNEWM S SRNEWM=SRNEWM_"01",SRSDATE=$E(SRSDATE,1,3)_SRNEWM
 Q
