DIO4 ;SFISC/GFT,XAK,TKW-FINISH OUTPUT, CLOSE DEVICE ;9JAN2004
 ;;22.2;VA FileMan;;Jan 05, 2016;Build 42
 ;;Per VA Directive 6402, this routine should not be modified.
 ;;Submitted to OSEHRA 5 January 2015 by the VISTA Expertise Network.
 ;;Based on Medsphere Systems Corporation's MSC FileMan 1051.
 ;;Licensed under the terms of the Apache License, Version 2.0.
 ;
 K DIXX,DIWT,DIW,DIP,DSC,DRK,DIO("SCR") D:'$D(DISYS) OS^DII
 G:$G(DIFIXPT)=1 K1
 I $G(DIBTPGM)]"" D
 .N % S %=+$P(DIBTPGM,"^DISZ",2) D:% ENRLS^DIOZ(%) K DIBTPGM Q
 I ($G(ZTSTOP)=1!($G(DIFMSTOP))!($G(DIERR)))&'$D(DIAR) K:$G(ZTQUEUED) DIERR,^TMP("DIERR",$J) D FF G STOP
 I $G(S)'=0!(IO'=$P),$G(DISTP)'<1,$D(^UTILITY($J,"T")) S A=0 D ^DIO3 ;DO TOTALS UNLESS USER HAS ABORTED MIDWAY
MATCHES I L!($D(DISTEMP)),DISEARCH,'DISUPNO D:'DJ&('DC)&($D(^UTILITY($J,2))) HDR W !!!?25,$S('DJ:$$EZBLD^DIALOG(8006.1),$G(DUZ("LANG"))>1:$$EZBLD^DIALOG(8006.2,DJ),1:DJ_" MATCH"_$P("ES",U,DJ'=1)_" FOUND.") W:IOST?1"C".E $C(7) ;**
 I DISEARCH,$G(DISV),$D(^DIBT(DISV)) D NOW^%DTC S ^DIBT(DISV,"QR")=%_U_+DJ
NO I $G(DISTP)<1,'DIO,'DISUPNO,'DC D:$D(^UTILITY($J,2)) HDR W !!!!,?10,$$EZBLD^DIALOG(8007.1) ;**NO RECORDS TO PRINT
 I $D(DIAR) D UPDATE^DIARU
 I $D(CP) S X=-1,^DOSV(0,IO(0),"CP")=CP F  S X=$O(CP(X)),Z=-1 Q:X=""  F  S Z=$O(CP(X,Z)) Q:Z=""  S ^DOSV(0,IO(0),"CP",X,Z)=CP(X,Z) Q:X=Z
 I $D(DIOT),$D(Y),Y'=U S DY(1)="X DIOT S DN=0",DN=1 D ^DIO2
 D FF
 I $D(DCOPIES),$D(DOUT),$D(^DD("OS",DISYS,"SDPEND")) D SDP
 G:$G(DIOEND)="G M^DIAU" M^DIAU G:$G(DIOEND)="G L^DIDC" L^DIDC
 X:$D(DIOEND) DIOEND K DIOEND
STOP I $G(ZTSTOP)=1,$G(DISTOP("C"))]"" X DISTOP("C")
 D CLOSE I DUZ(0)'="@" S X=0 X ^DD("FUNC",18,1)
K ;S:$D(ZTSK) ZTREQ="@"
 I $D(ZTQUEUED) D
 . S ZTREQ="@"
 . I $G(DDXPTMDL),$D(DDXPXTNO) N DA,DIK S DIK="^DIPT(",DA=DDXPXTNO D ^DIK
K1 K ^UTILITY($J),^(U,$J),^UTILITY("DIP2",$J),FLDS,DIOT,DQI,A,B,C,D,E,H,I,J,M,N,L,P,Q,S,V,W,X,Y,Z,DITTO,DIP,DIPA,BY
 K %,%H,%I,%A,%B,%DT,%Q,%X,%Y,%Z,FR,CP,DA,DD,DIO,DL,DM,DN,DI,DE,D9,D5,D4,D3,D2,D1,DCOPIES,DIFF,DIASKHD,DISTOP,DISTP,DILCT,DISV,DISX,DIAC,DIFILE
 K DIS,SF,DIPDT,DIPR,DICMX,DHT,DIWL,DIWR,DIPASS,DICSS,DIONOSUB,DIOSUBHD
 K DIRUT,DIROUT,DUOUT,DTOUT,DIHELP,DIMSG,^TMP("DIHELP",$J),^TMP("DIMSG",$J)
 I '$G(DIQUIET) K ^TMP("DIERR",$J),DIERR
 K DIBT,DIBT1,DIBT2,DX,DY,DNP,DC,DXS,DINS,DIPT,IOP,DCC,DQ,DJ,DJK,DIOP,DIOSL,DLP,DILIOSL,DHIT,DIJ,DPR,DP,DISUPNO,DIPCRIT,DIBTOLD,DITYP,DISTXT,DISEARCH Q
 ;
FF W:IOST?1"P".E&$Y&L @IOF
 Q
 ;
SDP Q:'DCOPIES  W ! X ^DD("OS",DISYS,"SDPEND")
 S DIO=IO,DLP=IOPAR,IOP=DOUT,A=IO(0) D ^%ZIS S IO(0)=A Q:POP
 F A=1:1:DCOPIES W:IOST?1"P".E&$Y @IOF X ^DD("OS",DISYS,"SDP") U IO
 I IO'=IO(0) S X=IO X ^DD("FUNC",7,1) K IO(1,IO)
 S IO=DIO Q
 ;
CLOSE ;
 S DIOP=IO X $G(^%ZIS("C"))
 O $P::2 E  H  ;I $P(IO(0),DIOP)]"" S IOP=IO(0) D ^%ZIS H:POP  S X=DIOP X ^DD("FUNC",7,1) K IO(1,IO) U IO(0)
 K DIOP Q
HDR N DN S DN=1 X ^UTILITY($J,1) Q
N G N^DIO2
T G T^DIO2
CSTP G CSTP^DIO2
DT G DT^DIO2 Q
C G C^DIO2
S G S^DIO2
P G P^DIO2
A G A^DIO2
D G D^DIO2
CP G CP^DIO2
H G H^DIO2
M G M^DIO2
