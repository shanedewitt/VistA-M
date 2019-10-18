PSODIR1 ;IHS/DSD - ASKS DATA FOR RX ORDER ENTRY CONT. ;3 June 2019 10:45:03
 ;;7.0;OUTPATIENT PHARMACY;**23,46,78,102,121,131,146,166,184,222,268,206,266,340,391,444,446,505,543,457**;DEC 1997;Build 116
 ;External reference ^PS(55 supported by DBIA 2228
 ;External reference ^PSDRUG( supported by DBIA 221
 ;External reference $$MXDAYSUP^PSSUTIL1 supported by DBIA 6229
 ;External reference $$HTFM^XLFDT supported by DBIA 10103
 ;
PTSTAT(PSODIR) ;
PTSTATEN K DIC,DR,DIE S PSODIR("FIELD")=0
 I $G(PSOTPBFG),$G(PSOFROM)="NEW" K PSORX("PATIENT STATUS"),PSODIR("PATIENT STATUS") N PSOFNDRX,PSOFNDFL,PSOFNDPS D
 . S PSOFNDFL=0 F PSOFNDPS=0:0 S PSOFNDPS=$O(^PS(53,PSOFNDPS)) Q:'PSOFNDPS!(PSOFNDFL)  D
 ..  S PSOFNDRX=$P($G(^PS(53,PSOFNDPS,0)),"^") S PSOFNDRX=$$UP^XLFSTR(PSOFNDRX) I PSOFNDRX="NON-VA" S PSOFNDFL=1 S (PSORX("PATIENT STATUS"),DIC("B"))=$P($G(^PS(53,PSOFNDPS,0)),"^")
 I $G(PSOTPBFG),$G(PSOFROM)="NEW",$G(PSORX("PATIENT STATUS"))="" W !,"Could not find a 'NON-VA' Patient Status in the RX PATIENT STATUS file (#53)!" D PSTPB D  S PSODIR("DFLG")=1 G PTSTATX
 . K DIR S DIR(0)="E",DIR("A")="Press Return to continue" D ^DIR K DIR
 I $G(PSOTPBFG),$G(PSOFROM)="NEW" G TPBB
 N PSOX
 S PSOX=$G(^PS(55,PSODFN,"PS")) I PSOX]"" S PSORX("PATIENT STATUS")=$P($G(^PS(53,PSOX,0)),"^"),DIC("B")=PSORX("PATIENT STATUS")
 S:$G(PSODIR("PATIENT STATUS"))]"" DIC("B")=PSODIR("PATIENT STATUS")
TPBB ;
 D ELIG^VADPT W !,"Eligibility: "_$P(VAEL(1),"^",2)_$S(+VAEL(3):"     SC%: "_$P(VAEL(3),"^",2),1:"")
 S N=0 F  S N=$O(VAEL(1,N)) Q:'N  W !,?10,$P(VAEL(1,N),"^",2)
 S DIC("A")="RX PATIENT STATUS: "
 S DIC(0)="QEAMZ",DIC=53 D ^DIC K DIC
 I $G(PSOTPBFG),$G(PSOFROM)="NEW" N PSOPSDIR,PSOFNDZZ,PSOPSUPA S (PSOPSDIR,PSOPSUPA)=0 D  I PSOPSDIR S:PSOPSUPA PSODIR("DFLG")=1 G:PSOPSUPA PTSTATX W ! D PSTPB G PTSTATEN
 . I Y'>0!($D(DTOUT))!($D(DUOUT)) S (PSOPSDIR,PSOPSUPA)=1 Q
 . S (PSODIR("PATIENT STATUS"),PSORX("PATIENT STATUS"))=+Y,PSODIR("PTST NODE")=Y(0)
 . S PSOFNDZZ=$P($G(^PS(53,+Y,0)),"^") S PSOFNDZZ=$$UP^XLFSTR(PSOFNDZZ) I PSOFNDZZ'="NON-VA" S PSOPSDIR=1 K PSODIR("PATIENT STATUS"),PSORX("PATIENT STATUS"),PSODIR("PTST NODE")
 I $G(PSOTPBFG),$G(PSOFROM)="NEW" G TPBSC
 I X[U,$L(X)>1 D:'$G(PSOEDIT) JUMP G PTSTATX
 I $D(DUOUT)!$D(DTOUT) S PSODIR("DFLG")=1 G PTSTATX
 I Y=-1 W $C(7)," Required" G PTSTATEN
 N PSOFNDX,PSOFNDXY,PSOFNDXX,PSOFNDYY
 S PSOFNDXY=$G(Y),PSOFNDYY=$G(Y(0))
 I '$G(PSOTPBFG),$G(PSOFROM)="NEW" S PSOFNDX=$P($G(^PS(53,+Y,0)),"^") S PSOFNDXX=$$UP^XLFSTR(PSOFNDX) I PSOFNDXX="NON-VA" K PSOFNDX,PSOFNDXY,PSOFNDYY,PSOFNDXX,Y W !!,"Cannot select 'NON-VA' Rx Patient Status!",! G PTSTATEN
 S Y=$G(PSOFNDXY),Y(0)=$G(PSOFNDYY)
 K PSOFNDXY,PSOFNDYY,PSOFNDX,PSOFNDXX
 S (PSODIR("PATIENT STATUS"),PSORX("PATIENT STATUS"))=+Y
 S PSODIR("PTST NODE")=Y(0)
TPBSC ;
 I $G(PSOFDR),$P($G(OR0),"^",17)="C" G PTSTATX
 L +^PS(55,PSODFN):$S(+$G(^DD("DILOCKTM"))>0:+^DD("DILOCKTM"),1:3) I '$T G PTSTATX
 S DIE="55",DR="3////"_+Y,DA=PSODFN D ^DIE K DIE,DA,D0
 L -^PS(55,PSODFN)
PTSTATX ;
 K DTOUT,DUOUT,X,Y,DA Q
 ;
SIG(PSODIR) ;
 I $G(PSOFDR),$G(PSODIR("SIG"))']"" D SIGOK G:$G(SIGOK)!($G(PSODIR("DFLG"))) SIGX
 K DIR,DIC
 S DIR(0)="52,10"
 S:$G(PSODRUG("SIG"))]"" DIR("B")=PSODRUG("SIG")
 S:$G(PSODIR("SIG"))]"" DIR("B")=PSODIR("SIG")
 D DIR G:PSODIR("DFLG")!PSODIR("FIELD") SIGX
 S PSODIR("SIG")=Y,SIGOK=0 K SIG
SIGX ;
 K X,Y Q
 ;
QTY(PSODIR) ;
QTYA K DIR,DIC N RFL,RXIEN
 I $G(CLOZPAT)=1 S DIR("A",1)="Patient Eligible for 14 day supply or 7 day supply with 1 refill"
 I $G(CLOZPAT)=2 S DIR("A",1)="Patient Eligible 28 day supply or 14 day supply with 1 refill or 7 day supply with 3 refill"
 S DIR(0)="52,7" S:$G(PSODRUG("IEN")) DIR("A")="QTY ( "_$G(PSODRUG("UNIT"))_" ) "_$S($P($G(^PSDRUG(+PSODRUG("IEN"),5)),"^")]"":$P(^PSDRUG(+PSODRUG("IEN"),5),"^"),1:"")
 K QTYHLD I $G(PSODIR("QTY"))]"" S QTYHLD=PSODIR("QTY") K PSODIR("QTY")
 D:'$G(PSOQTY) QTY^PSOSIG(.PSODIR)
 I '$G(SPEED),$G(QTYHLD),'$G(PSODIR("QTY")) S PSODIR("QTY")=QTYHLD
 K QTYHLD K:'$G(PSODIR("QTY")) PSODIR("QTY")
 I $G(SPEED),$G(PSODIR("QTY"))']"" S PSODIR("QTY")=$P(^PSRX(PSORENW("OIRXN"),0),"^",7)
 S:$G(PSODIR("QTY"))]"" DIR("B")=PSODIR("QTY")
 D DIR
 ;/BLB/ PSO*7.0*505 ;MODIFIED QTY CHECK TO ALLOW LEADING ZEROS
 I Y[".",$P(Y,".")<1 S Y="0"_"."_$P(Y,".",2)
 G:PSODIR("DFLG")!PSODIR("FIELD") QTYX
 I $G(Y),$G(PSODRUG("MAXDOSE"))]"",$G(PSODIR("DAYS SUPPLY")),(Y/+PSODIR("DAYS SUPPLY")>PSODRUG("MAXDOSE")) D  G:$G(PSODIR("DFLG")) QTYX  G QTYA
 . W !,$C(7)," Greater than Maximum dose of "_PSODRUG("MAXDOSE")_" per day" D DAYSEN
 I $G(PSOFDR),$P($G(OR0),"^",24),$G(PSODIR("QTY")),+Y>$G(PSODIR("QTY")) D  G QTYX
 . W !!,"Digitally Signed Order - QTY cannot be increased",!
 . N DIR S DIR(0)="E",DIR("A")="Press Return to Continue" D ^DIR W !
 S PSODIR("QTY")=Y
QTYX ;
 K X,Y Q
 ;
COPIES(PSODIR) ;
 K DIR,DIC
 S DIR(0)="52,10.6"
 S DIR("B")=$S($G(PSODIR("COPIES"))]"":PSODIR("COPIES"),1:1)
 D DIR G:PSODIR("DFLG")!PSODIR("FIELD") COPIESX
 S PSODIR("COPIES")=Y
COPIESX ;
 K X,Y Q
 ;
DAYS(PSODIR) ;
DAYSEN K DIR,DIC N PSORFLS
 ;PSO*7*266
 N S2DS,MXDAYSUP,DFDAYSUP,PSDAYSUP,CSDRUG,NEWTOTDS,PSOREGN S S2DS=0
 S MXDAYSUP=90,CSDRUG=0
 I $D(PSODRUG("IEN")) D
 . S MXDAYSUP=$$MXDAYSUP^PSSUTIL1(PSODRUG("IEN"))
 . S S2DS=$$CSDS^PSOSIGDS(PSODRUG("IEN")) I S2DS,$P($G(PSODIR("PTST NODE")),"^",3)>29 S S2DS=30
 . S PSORFLS=$S($G(PSODIR("# OF REFILLS")):PSODIR("# OF REFILLS"),1:$P($G(PSODIR("RX0")),"^",9))
 . I '$D(PSODRUG("DEA")) S PSODRUG("DEA")=$$GET1^DIQ(50,PSODRUG("IEN"),3,"")
 . I (PSODRUG("DEA")["2")!(PSODRUG("DEA")["3")!(PSODRUG("DEA")["4")!(PSODRUG("DEA")["5") S CSDRUG=1
 S PSOREGN="" ;p457
 I $$ISCLOZ^PSJCLOZ(,,,,$G(PSODRUG("IEN"))) S PSOREGN=$$GET1^DIQ(55,PSODFN,53) ;p457
 ;S PSOREGN=$$GET1^DIQ(55,PSODFN,53) p457 commented out
 S PSDAYSUP=$S(PSOREGN?1U6N!$D(^TMP($J,"CLOZFLG",PSODFN)):4,$G(CLOZPAT)=2:28,$G(CLOZPAT)=1:14,$G(CLOZPAT)=0:7,1:MXDAYSUP)
 I (PSOREGN?2U5N)&($$GET1^DIQ(50,+$G(PSODRUG("IEN")),17.5)="PSOCLO1") D
 . I $P($G(^XTMP("PSO4D-"_PSODFN,"PSOYS")),"^",4)'>0,($P($G(^XTMP("PSO4D-"_PSODFN,0)),"^",1))>$$HTFM^XLFDT($H,1) D
 ..  S PSDAYSUP=4 ; Special condition local override if no ANC results
 S DIR(0)="N^1:"_PSDAYSUP
 S DFDAYSUP=$S($D(CLOZPAT)&('$G(PSODIR("DAYS SUPPLY"))):7,$G(PSODIR("DAYS SUPPLY"))]"":PSODIR("DAYS SUPPLY"),S2DS>1:S2DS,$P($G(PSODIR("PTST NODE")),"^",3):$P(PSODIR("PTST NODE"),"^",3),1:30)
 I DFDAYSUP>MXDAYSUP D  S DFDAYSUP=MXDAYSUP
 . W:$G(PSODIR("DAYS SUPPLY")) !!,$C(7),"Invalid DAYS SUPPLY value (",DFDAYSUP,"), resetting it to ",MXDAYSUP," (maximum allowed).",!
 S DIR("B")=DFDAYSUP
 S DIR("A")="DAYS SUPPLY",DIR("?")="Enter a whole number between 1 and "_PSDAYSUP
 D DIR G:PSODIR("DFLG")!PSODIR("FIELD") DAYSX
 I $G(Y),$G(PSODRUG("MAXDOSE"))]"",$G(PSODIR("QTY"))]"",(+PSODIR("QTY")/Y>PSODRUG("MAXDOSE")) D  G DAYSEN
 .W !,$C(7)," Greater than Maximum dose of "_PSODRUG("MAXDOSE")_" per day"
 I $G(PSOFDR),$P($G(OR0),"^",24),$G(PSODIR("DAYS SUPPLY")),+Y>$G(PSODIR("DAYS SUPPLY")) D  G DAYSX
 . W !!,"Digitally Signed Order - Days Supply cannot be increased",!
 . N DIR S DIR(0)="E",DIR("A")="Press Return to Continue" D ^DIR W !
 I $G(PSONEW("FLD"))=8,PSODIR("DAYS SUPPLY")=Y Q
 S:$G(PSODIR("DAYS SUPPLY")) PSODIR("OLD DAYS SUPPLY")=PSODIR("DAYS SUPPLY")
 S PSODIR("DAYS SUPPLY")=Y
 ; Checking the # Of Refills field value after the Days Supply field was edited
 I $D(PSODRUG("IEN")),$G(Y),$G(Y)>$S(PSORFLS<4:90,PSORFLS<6:89,PSORFLS<12:60,1:0) D
 . N PTST
 . S PTST=+$G(PSODIR("PATIENT STATUS")) S:'PTST PTST=$P($G(PSODIR("RX0")),"^",3)
 . I 'PTST,$G(PSODFN) S PTST=+$G(^PS(55,PSODFN,"PS"))
 . I PSORFLS>$$MAXNUMRF^PSOUTIL(PSODRUG("IEN"),Y,PTST,.CLOZPAT) D
 ..  W !,$C(7),"Invalid number of REFILLS for amount of DAYS SUPPLY.",!,"REFILL EDIT FORCED." D REFILL(.PSODIR)
 ..  S PSODIR("FLD",9)=PSODIR("# OF REFILLS")
 S:$G(CLOZPAT)=0 (PSODIR("N# REF"),PSODIR("# OF REFILLS"))=0
 D:$G(CLOZPAT)=2
 . S:PSODIR("DAYS SUPPLY")=28 (PSODIR("N# REF"),PSODIR("# OF REFILLS"))=0
 . S:PSODIR("DAYS SUPPLY")=14 (PSODIR("N# REF"),PSODIR("# OF REFILLS"))=1
 . S:PSODIR("DAYS SUPPLY")=7 (PSODIR("N# REF"),PSODIR("# OF REFILLS"))=3
 D:$G(CLOZPAT)=1
 . S:PSODIR("DAYS SUPPLY")=14 (PSODIR("N# REF"),PSODIR("# OF REFILLS"))=0
 . S:PSODIR("DAYS SUPPLY")=7 (PSODIR("N# REF"),PSODIR("# OF REFILLS"))=1
 K QTYHLD S:$G(PSODIR("QTY")) QTYHLD=PSODIR("QTY") D QTY^PSOSIG(.PSODIR)
 I $G(QTYHLD),'$G(PSODIR("QTY")) S PSODIR("QTY")=QTYHLD
 K QTYHLD K:'$G(PSODIR("QTY")) PSODIR("QTY")
DAYSX ;
 K X,Y Q
 ;
REFILL(PSODIR) ;
 N PSODAYS,PSOX
 S PSODAYS=+$G(PSODIR("DAYS SUPPLY"))
 ;Recalculating RFTT if it doesn't exist
 I '$G(PSONEW) D
 . N I I '$G(RFTT),$G(PSORXED("IRXN")) F I=0:0 S I=$O(^PSRX(PSORXED("IRXN"),1,I)) Q:'I  S RFTT=$G(RFTT)+1
 ;
 I $G(PSODIR("PTST NODE"))="" D
 . N X,Y
 . S X=$G(PSODIR("PATIENT STATUS")) S:'X X=$P(RX0,"^",3)
 . S DIC=53,DIC(0)="QXZ" D ^DIC K DIC
 . S:+Y PSODIR("PTST NODE")=Y(0)
 . S:'$G(PSODIR("PATIENT STATUS")) PSODIR("PATIENT STATUS")=+Y
 S $P(PSODIR("PTST NODE"),"^",4)=+$P($G(PSODIR("PTST NODE")),"^",4)
 I $G(OR0) G REFOR
 K DIR,DIC,PSOX
 ; Controlled Substance
 S PSODIR("CS")=0
 I (PSODRUG("DEA")["2")!(PSODRUG("DEA")["3")!(PSODRUG("DEA")["4")!(PSODRUG("DEA")["5") D
 . S $P(PSODIR("CS"),"^")=1 S:(PSODRUG("DEA")["2") $P(PSODIR("CS"),"^",2)=1
 ;
 ; Retrieving the Maximum Number of Refills allowed
 S PSOX=$$MAXNUMRF^PSOUTIL(+$G(PSODRUG("IEN")),PSODAYS,+$G(PSODIR("PATIENT STATUS")),.CLOZPAT)
 ;
 I '$D(CLOZPAT) I PSODRUG("DEA")["A"&(PSODRUG("DEA")'["B")!(PSODRUG("DEA")["F")!(PSODRUG("DEA")[1)!(PSODRUG("DEA")[2) D  G REFILLX
 . I PSODRUG("DEA")["A"&(PSODRUG("DEA")'["B")!(PSODRUG("DEA")[1)!(PSODRUG("DEA")[2)!'$O(^PSRX(+$G(PSODIR("IRXN")),1,0))!('$G(PSOLOKED)) D  Q
 ..  S VALMSG="No refills allowed on "_$S(PSODRUG("DEA")["F":"this drug.",1:"Narcotics.") W !,VALMSG,!
 ..  S:$D(PSODIR("FIELD")) PSODIR("FIELD")=0 S PSODIR("# OF REFILLS")=0
 . ; reset refills to the # given
 . D RFRSET^PSODIR2
 ;
 I $P($G(PSODIR("CS")),"^",2)=1 W !,"No refills allowed on Schedule 2 drugs...",! S:$D(PSODIR("FIELD")) PSODIR("FIELD")=0 S PSODIR("# OF REFILLS")=0 G REFILLX
 ;
 ;/RBN - Integration of 457 start
 I $D(CLOZPAT) S PSOX=$S($G(CLOZPAT)=2&(PSODIR("DAYS SUPPLY")=14):1,$G(CLOZPAT)=2&(PSODIR("DAYS SUPPLY")=7):3,$G(CLOZPAT)=1&(PSODIR("DAYS SUPPLY")=7):1,1:0)
 ;/RBN - Integration of 457 end
 ;
 ;PSO*7*266 make sure PSOX is greater than RFTT
 S DIR(0)="N^"_$S($G(RFTT):RFTT,1:0)_":"_$S(+$G(RFTT)>PSOX:RFTT,1:PSOX),DIR("A")="# OF REFILLS"
 ;PSO*7*340 Correct Default Value
 S DIR("B")=$S($G(COPY)&('$G(PSOTITRX)):$G(PSODIR("# OF REFILLS")),$G(PSODIR("N# REF"))]"":PSODIR("N# REF"),$G(PSODIR("# OF REFILLS"))]"":PSODIR("# OF REFILLS"),$G(RFTT)>PSOX:RFTT,1:PSOX)
 S DIR("?",1)="Enter a whole number. The maximum number of refills is based on"
 S DIR("?")="the DAYS SUPPLY and the PATIENT STATUS fields."
 D DIR G:PSODIR("DFLG")!PSODIR("FIELD") REFILLX
 S (PSODIR("N# REF"),PSODIR("# OF REFILLS"))=Y
 ;
REFILLX ;
 S:$G(PSODIR("# OF REFILLS"))']"" PSODIR("# OF REFILLS")=$S($G(PSODIR("N# REF"))]"":PSODIR("N# REF"),1:PSOX)
 K X,Y,PSOX,DEA,PSOCS,RFTT ;PSO*7*340 Kill RFTT
 Q
 ;OERR CALL
REFOR ;
 D REFOR^PSODIR3
 G REFILLX
 Q
DIR ;
 S (PSODIR("FIELD"),PSODIR("DFLG"))=0
 G:$G(DIR(0))']"" DIRX
 D ^DIR K DIR,DIE,DIC,DA
 I $D(DUOUT)!($D(DTOUT))!($D(DIROUT)),$L($G(X))'>1!(Y="") S PSODIR("DFLG")=1 G DIRX
 I $D(DIRUT)!($D(DIROUT)),$G(SPEED) S PSODIR("DFLG")=1 G DIRX
 I X[U,$L(X)>1 D JUMP
DIRX ;
 K DIRUT,DTOUT,DUOUT,DIROUT Q
 ;
JUMP ;
 I $G(PSOEDIT)!($G(OR0)) S PSODIR("DFLG")=1 Q
 S X=$P(X,"^",2),DIC="^DD(52,",DIC(0)="QM" D ^DIC K DIC
 I Y=-1 S PSODIR("FIELD")=PSODIR("FLD") G JUMPX
 I $G(PSONEW1)=0 D JUMP^PSONEW1 G JUMPX
 I $G(PSOREF1)=0 D JUMP^PSOREF1 G JUMPX
 I $G(PSONEW3)=0 D JUMP^PSONEW3 G JUMPX
 I $G(PSORENW3)=0 D JUMP^PSORENW3 G JUMPX
JUMPX ;
 S X="^"_X Q
 ;
SIGOK ;review and decide on oerr sig
 I '$O(SIG(0)) S SIGOK=0 Q
 K SIGOK W !,"SIG: "
 F SIG=0:0 S SIG=$O(SIG(SIG)) W SIG(SIG)_" ",!?5 Q:'$O(SIG(SIG))
 K DIR,DIRUT,DUOUT,DTOUT S DIR("B")="YES",DIR(0)="Y",DIR("A")="Is this SIG correct" D ^DIR K DIR I $D(DIRUT) S PSODIR("DFLG")=1 K DIRUT,DUOUT,DTOUT Q
 S SIGOK=Y I Y K PSODIR("SIG")
 Q
PSTPB    ;
 W !,"New orders entered through this option must have a Patient Status of 'NON-VA'!",!
 Q
 ;
