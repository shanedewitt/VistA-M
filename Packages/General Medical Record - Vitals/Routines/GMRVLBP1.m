GMRVLBP1 ;HIRMFO/YH-SYSTOLIC/DIASTOLIC GRAPH ;5/27/97
 ;;4.0;Vitals/Measurements;**1**;Apr 25, 1997
SETHD ;
 S GMR3=(($Y/3)=($Y\3)),(GMRSHI,GMRDHI)=GMRSLO,(GMRSLO,GMRDLO)=$Y*(-10)/3+248.335,(GMRSDIF,GMRDDIF)=GMRSHI-GMRSLO
 S GMRHDR10=$S($Y>8&GMR3&($Y<62):GMRSLO+1.665,1:"")
 Q
DATAPRT ;
 S GMRLINE=GMRX1
 S GMRNM=0 F GMRDT=0:0 S GMRDT=$O(^TMP($J,"GMRDT",GMRDT)) Q:GMRDT'>0  D SETLINE Q:GMRNM=10
 W GMRLINE
 Q
SETLINE ;
 S GMRNM=GMRNM+1,GMROLD=$P(GMRLINE,"|",GMRNM),GMRS=$O(^TMP($J,"GMRVG","S",GMRDT,""))
 S GMRD=$O(^TMP($J,"GMRVG","D",GMRDT,""))
 S GMRSOFF=($Y=7&(+GMRS>225))!($Y=61&(+GMRS<48)),GMRDOFF=($Y=7&(+GMRD>226))!($Y=61&(+GMRD<48))
 S GMROLD=$S(+GMRS>0&(+GMRS'<GMRSLO&(+GMRS'>GMRSHI)!GMRSOFF):"S"_$S('$P(^TMP($J,"GMRVG","S",GMRDT,GMRS),"^",2):" ",1:"*")_$S('GMRSOFF:" ",1:"*")_$E(GMROLD,4,10),1:GMROLD)
 S GMROLD=$E(GMROLD,1,5)_$S(GMRD>0&(+GMRD'<GMRDLO&(+GMRD'>GMRDHI)!GMRDOFF):"D"_$S('$P(^TMP($J,"GMRVG","D",GMRDT,GMRD),"^",2):" ",1:"*")_$S('GMRDOFF:" ",1:"*")_$E(GMROLD,9,10),1:$E(GMROLD,6,10))
 S $P(GMRLINE,"|",GMRNM)=GMROLD
 Q
