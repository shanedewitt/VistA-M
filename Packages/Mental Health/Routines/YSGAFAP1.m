YSGAFAP1 ;ALB/ASF,HIOFO/FT - GLOBAL ASSESSMENT OF FUNCTIONING ;5/8/13 1:56pm
 ;;5.01;MENTAL HEALTH;**64,108**;Dec 30, 1994;Build 17
 ;Reference to ^DPT( supported by DBIA #10035
 ;Reference to ^VA(200, supported by DBIA #10060
 Q
ENT(YSDATA,YS) ;Enter GAF information
 ; DFN  - Patient IEN
 ; GAF - GAF Score (Axis 5)
 ; DATE - Date/Time of Diagnosis
 ; STAFF - Diagnosis By DUZ
 S YSDATA(1)="[ERROR]",YSDATA(2)="With DSM 5, no new GAFs allowed"
 Q
PARSE ;
 S YSPN=$G(YS("DFN"))
 S YSGN=$G(YS("GAF"))
 S YSGD=$G(YS("DATE"),"NOW") S X=YSGD,%DT="T" D ^%DT S YSGD=Y
 S YSGC=$G(YS("STAFF"))
 IF YSPN'>0!('$D(^DPT(YSPN,0))) S YSDATA(1)="[ERROR]",YSDATA(2)="bad DFN" Q  ;------->
 IF YSGC'>0!('$D(^VA(200,YSGC,0))) S YSDATA(1)="[ERROR]",YSDATA(2)="bad staff" Q  ;---->
 IF YSGN'?1N.N!(YSGN<1)!(YSGN>100) S YSDATA(1)="[ERROR]",YSDATA(2)="bad dx" Q  ;----->
 IF YSGD<0 S YSDATA(1)="[ERROR]",YSDATA(2)="bad date" Q  ;---->
 ;
SET ;
 ;K DD,DO,DA,DINUM
 ;S DLAYGO=627.8,X="NOW",%DT="TR" D ^%DT S X=Y
 ;S DIC="^YSD(627.8,",DIC(0)="L"
 ;D FILE^DICN Q:Y'>0  S YSDA=+Y
 ;S DFN=+YSPN
 ;D PATSTAT^YSDX3B
 ;I '$D(DFN) D  QUIT  ;--->
 ;. D EN^YSGAFOBX(YSDA)
 ;S DIE="^YSD(627.8,",DA=YSDA
 ;S DR=".02////"_YSPN_";.03////"_YSGD_";.04////"_YSGC_";.05////"_DUZ
 ;S DR=DR_";65////"_YSGN_";66////"_YSSTAT
 ;L +^YSD(627.8,YSDA):9999 Q:'$T
 ;D ^DIE
 ;L -^YSD(627.8,YSDA)
 ;K YSDATA S YSDATA(1)="[DATA]"
 ;D EN^YSGAFOBX(YSDA)
 ;K %DT,DA,DIC,DIE,DLAYGO,DR,X,Y,YSDA,YSPN,YSGN,YSGD,YSGC,YSSTAT
 Q
