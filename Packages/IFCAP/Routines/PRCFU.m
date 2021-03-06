PRCFU ;WISC@ALTOONA/CTB/BGJ-UTILITY ROUTINE CODE SHEETS ;10 Sep 89/3:08 PM
V ;;5.1;IFCAP;**39**;Oct 20, 2000
 ;Per VHA Directive 10-93-142, this routine should not be modified.
 ;THIS PROGRAM PADS OUTPUT FOR USE BY THE CODE SHEET PROGRAM
 ;Y IS IN AND OUT VARIABLE AND MUST BE PRESENT
 ;PRCFLN IS FIELD LENGTH IN WHICH VARIABLE IS TO BE PADDED
 ;;;SAMPLE CODE IN OUTPUT TRANSFORM   S Y=Y(0) S:$D(YOUR VARIABLE) PRCFLN=(FIELD LENGTH) D:$D(YOUR VARIABLE) TYPEOFPAD^PRCFU
LZF ;LEFT ZERO A FIELD, Y IS VARIABLE IN, Y IS VARIABLE OUT, PRCFLN IS FIELD LENGTH
 K PRCFZ Q:'$D(PRCFLN)
 S $P(PRCFZ,"0",PRCFLN)=0,PRCFZ=PRCFZ_Y,Y=$E(PRCFZ,$L(PRCFZ)-PRCFLN+1,$L(PRCFZ)) K PRCFLN,PRCFZ Q
RZF ;RIGHT ZERO FILL A FIELD ; Y = DATA , PRCFLN = FIELD LENGTH
 K PRCFZ Q:'$D(PRCFLN)
 S $P(PRCFZ,"0",PRCFLN)=0,Y=$E(Y_PRCFZ,1,PRCFLN) K PRCFLN,PRCFZ Q
LBF ;LEFT BLANK FILL ;Y = DATA, PRCFLN=FIELD LENGTH
 K PRCFZ Q:'$D(PRCFLN)
 S $P(PRCFZ," ",PRCFLN)=" ",PRCFZ=PRCFZ_Y,Y=$E(PRCFZ,$L(PRCFZ)-PRCFLN+1,$L(PRCFZ)) K PRCFLN,PRCFZ Q
RBF ;RIGHT BLANK FILL ; Y=DATA,PRCFLN=FIELD LENGTH
 K PRCFZ Q:'$D(PRCFLN)
 S $P(PRCFZ," ",PRCFLN)=" ",Y=$E(Y_PRCFZ,1,PRCFLN) K PRCFLN,PRCFZ Q
DIC N C,D,DB,DIA,DIC,DICR,DIE,DIX,DO,DR,DS,DSC,DV,DXS,L S DIC=4,DIC(0)="QEMZ",DIC("S")="I $S('$D(^(99)):0,$P(^(99),U)>0:1,1:0)" D ^DIC K DG Q
 Q
EX W !! N %,C,D,DB,DD,DG,DIA,DIBTDH,DIC,DIE,DIX,DIY,DO,DQ,DR,DCS,DXS,DZ,DZ1,L,X,XQH,Y S DIC=4,DIC(0)="QEM",DIC("S")="I $S('$D(^(99)):0,1:0)",X="?" D ^DIC Q
CAPSDATE ;CONVERT INTERNAL FM DATE IN Y TO MM,DD,YY FORMAT FOR CAPPS
 S Y=$E(Y,4,5)_$E(Y,6,7)_$E(Y,2,3) S PRCFLN=6 D RBF Q
CAPSDOL ;CREATE CAPS DOLLAR FIELD TO 9 NUMBER LZF
 Q:'$D(PRCF("OUT"))  S PRCFLN=9 D LZF Q
LBF1(STRING,LENGTH) ;Left blank fill string in a field with specified length
 N X
 S $P(X," ",LENGTH)=" ",STRING=X_STRING
 Q $E(STRING,$L(STRING)-(LENGTH-1),$L(STRING))
