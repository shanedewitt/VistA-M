LRABG ;SLC/RWF - PULMONARY LAB DATA DISPLAY ;8/25/87  08:27 ;
 ;;5.2;LAB SERVICE;**187,213**;Sep 27, 1994
 ;
PR ;PRINT
 I $D(LRPRETTY) S LRIDT=LRSDT,LRTOP=0,LRTST="1125^48^49^51^52^53^280^54^55^47" D PALL Q
 K LRIDT,DIC("S") S LRIDT=0,%DT="",DIC="^LAB(61,",DIC("A")="Select SITE/SPECIMEN: ",DIC(0)="AEMOQ" D ^DIC S LRTOP=+Y,LRTST="1125^48^49^51^52^53^280^54^55^47" D ^LRNORMAL
 R !!,"STARTING DATE TO DISPLAY: TODAY//",X:10 IF X]"" D ^%DT S LRIDT=3009999-Y-.1
 K %ZIS D ^%ZIS Q:POP  U IO
PALL S LRDPF=$P(^LR(LRDFN,0),U,2),DFN=$P(^(0),U,3) D PT^LRX
 D HEAD^LRABG1 S U="^",LRLDT=0,LREND=0
 S LRPQ="11^15^24^31^37^45^52^59^66^74",LRPJ="1^1^1^1^2^1^1^1^1^"
 S LRXW="IF $L(LRZZ) W ?$P(LRPQ,U,I),$S(I=1:$J(LRZZ,3,$P(LRPJ,U,I)),LRZZ#1:$J(LRZZ,5,$P(LRPJ,U,I)),1:$J(LRZZ,5))"
 G ^LRABG1
