LEXQC4 ;ISL/KER - Query - Changes - CPT/MOD ;05/23/2017
 ;;2.0;LEXICON UTILITY;**80,103**;Sep 23, 1996;Build 2
 ;               
 ; Global Variables
 ;    ^DIC(81.3,          ICR   4492
 ;    ^ICPT(              ICR   4489
 ;    ^TMP("LEXQC")       SACC 2.3.2.5.1
 ;               
 ; External References
 ;    None
 ;               
 ; Local Variables NEWed in LEXQC
 ;    LEXADT              After Date
 ;    LEXBDT              Before Date
 ;    LEXCDT              Versioning Date
 ;    LEXQLEN             Length of Display
 ;    LEXQSTR             Length of String
 ;    LEXQTOT             Total Records
 ;               
CPT ; CPT Procedures Changes
 K ^TMP("LEXQC",$J,"CPT"),^TMP("LEXQC",$J,"CPC") N LEX1,LEX2,LEX3,LEX4
 N LEX5,LEX6,LEXAEF,LEXAST,LEXBEF,LEXBST,LEXCEF,LEXCNT,LEXCST,LEXH
 N LEXIDT,LEXIEN,LEXLC,LEXND,LEXPEF,LEXPST,LEXQL,LEXSO,LEXSTID
 S LEXQLEN=+($G(LEXQLEN)),LEXQTOT=+($G(LEXQTOT))
 S LEXQSTR=+($G(LEXQSTR)),LEXCNT=0,LEXLC=0
 S LEXIDT=$$IMPDATE^LEXU("CPT"),LEXCDT=$G(LEXCDT)
 Q:LEXCDT'?7N  Q:LEXCDT'>LEXIDT  S LEXIEN=0
 F  S LEXIEN=$O(^ICPT(LEXIEN)) Q:+LEXIEN'>0  D
 . N LEX1,LEX2,LEX3,LEX4,LEX5,LEX6,LEX7,LEX7D,LEX8,LEX8D,LEXAEF
 . N LEXAST,LEXBEF,LEXBST,LEXCEF,LEXCST,LEXH,LEXND,LEXPEF,LEXPST
 . N LEXQL,LEXSO,LEXSTID,LEXSID
 . S LEXCNT=LEXCNT+1 I LEXCNT'<+($G(LEXQSTR)) S LEXLC=+($G(LEXLC))+1 D
 . . W:'$D(ZTQUEUED)&('$D(LEXQUIET))&(LEXLC'>+($G(LEXQLEN))) "." S LEXCNT=0
 . S LEXSID="CPT",LEXSO=$P($G(^ICPT(LEXIEN,0)),"^",1) Q:'$L(LEXSO)
 . S:$E(LEXSO,1)?1U LEXSID="CPC"
 . S LEXH=$O(^ICPT(+LEXIEN,60,"B",LEXCDT," "),-1)
 . S LEXND=$G(^ICPT(+LEXIEN,60,+LEXH,0))
 . S LEXCEF=$P(LEXND,"^",1),LEXCST=$P(LEXND,"^",2)
 . S LEXH=$O(^ICPT(+LEXIEN,60,"B",LEXBDT," "),-1)
 . S LEXND=$G(^ICPT(+LEXIEN,60,+LEXH,0))
 . S LEXBEF=$P(LEXND,"^",1),LEXBST=$P(LEXND,"^",2)
 . S LEXH=$O(^ICPT(+LEXIEN,60,"B",LEXADT," "),-1)
 . S LEXND=$G(^ICPT(+LEXIEN,60,+LEXH,0))
 . S LEXAEF=$P(LEXND,"^",1),LEXAST=$P(LEXND,"^",2)
 . S LEXH=$O(^ICPT(+LEXIEN,60,"B",LEXCDT),-1)
 . S LEXH=$O(^ICPT(+LEXIEN,60,"B",+LEXH," "),-1)
 . S LEXND=$G(^ICPT(+LEXIEN,60,+LEXH,0))
 . S LEXPEF=$P(LEXND,"^",1),LEXPST=$P(LEXND,"^",2)
 . S LEX1=$D(^ICPT(+LEXIEN,61,"B",LEXCDT))>0
 . S LEX2=$D(^ICPT(+LEXIEN,62,"B",LEXCDT))>0
 . S LEX3=$O(^ICPT(+LEXIEN,61,"B",LEXCDT),-1)
 . S LEX4=$O(^ICPT(+LEXIEN,62,"B",LEXCDT),-1)
 . S LEX5=$D(^ICPT(+LEXIEN,61,"B",LEXCDT))
 . S LEX6=$D(^ICPT(+LEXIEN,62,"B",LEXCDT))
 . ; Short IEN Dupe
 . S LEX7=$O(^ICPT(+LEXIEN,61,"B",LEXCDT," "),-1),LEX7=$$DUPS^LEXQC5(81,LEXIEN,LEX7)
 . ; Long IEN Dupe
 . S LEX8=$O(^ICPT(+LEXIEN,62,"B",LEXCDT," "),-1),LEX8=$$DUPL^LEXQC5(81,LEXIEN,LEX8)
 . ; Activiation/Inactiviation/Re-Activation
 . ;   Has a current status and effective date
 . ;   Has a previous status and effective date
 . ;   Current status not equal to previosu status
 . ;   Has a short description
 . ;   Has a long description
 . ;   Activation - current status >0
 . ;   Inactivatin - current status =0
 . ;   Reactivation - current status >0 past status =0
 . S LEXQL=0 I $L(LEXCST),$L(LEXCEF) D  Q:LEXQL
 . . Q:$L(LEXBEF)&($L(LEXBST))&(LEXBST'=LEXCST)
 . . Q:$L(LEXAEF)&($L(LEXAST))&(LEXAST'=LEXCST)
 . . Q:(LEX1>0&(LEX3?7N))!(LEX2>0&(LEX4?7N))  Q:'$L($G(LEXSO))
 . . N LEXCT,LEXO,LEXSTID S LEXSTID=$S(+LEXCST>0:"ACT",1:"INA")
 . . I LEXSTID="ACT",$G(LEXPEF)?7N,+($G(LEXPST))'>0 D
 . . . I +($G(LEX5))'>0,+($G(LEX6))'>0 S LEXSTID="REA"
 . . S LEXQL=1
 . . S LEXO=LEXIEN_"^"_LEXSO_"^"_LEXCDT
 . . S LEXCT=+($G(^TMP("LEXQC",$J,LEXSID,LEXSTID,0)))
 . . S:'$D(^TMP("LEXQC",$J,LEXSID,LEXSTID,1,(LEXSO_" "))) LEXCT=LEXCT+1
 . . S ^TMP("LEXQC",$J,LEXSID,LEXSTID,1,(LEXSO_" "))=LEXO
 . . S ^TMP("LEXQC",$J,LEXSID,LEXSTID,0)=LEXCT
 . ; Revision
 . ;   I Previous status (LEXPST) >0 and
 . ;     Short exist (LEX1) with a previous short (LEX3) and not a duplicate (LEX7) or
 . ;     long exist (LEX2) with a previosu long (LEX4) and not a duplicate (LEX8)
 . S LEXQL=0 I +LEXPST>0,((LEX1>0&(LEX3?7N)&(LEX7'>0))!(LEX2>0&(LEX4?7N)&(LEX8'>0))) D  Q:LEXQL
 . . N LEXCT,LEXO Q:'$L($G(LEXSO))
 . . S LEXQL=1,LEXO=LEXIEN_"^"_LEXSO_"^"_LEXCDT
 . . S LEXCT=+($G(^TMP("LEXQC",$J,LEXSID,"REV",0)))
 . . S:'$D(^TMP("LEXQC",$J,LEXSID,"REV",1,(LEXSO_" "))) LEXCT=LEXCT+1
 . . S ^TMP("LEXQC",$J,LEXSID,"REV",1,(LEXSO_" "))=LEXO
 . . S ^TMP("LEXQC",$J,LEXSID,"REV",0)=LEXCT
 . ; Re-Use
 . ;   Current status (LEXCST) exist and active
 . ;   Previous Status (LEXPST) exist and is active
 . ;     Short exist (LEX1) with a previous short (LEX3) and not a duplicate (LEX7) or
 . ;     long exist (LEX2) with a previosu long (LEX4) and not a duplicate (LEX8)
 . S LEXQL=0 I ((LEXCEF?7N&(LEXCST>0))!(LEXPEF?7N&(LEXPST>0))),((LEX1>0&(LEX3?7N)&(LEX7'>0))!(LEX2>0&(LEX4?7N)&(LEX8'>0))) D
 . . N LEXCT,LEXO S LEXQL=1
 . . S LEXO=LEXIEN_"^"_LEXSO_"^"_LEXCDT
 . . S LEXCT=+($G(^TMP("LEXQC",$J,LEXSID,"REU",0)))
 . . S:'$D(^TMP("LEXQC",$J,LEXSID,"REU",1,(LEXSO_" "))) LEXCT=LEXCT+1
 . . S ^TMP("LEXQC",$J,LEXSID,"REU",1,(LEXSO_" "))=LEXO
 . . S ^TMP("LEXQC",$J,LEXSID,"REU",0)=LEXCT
 D:$D(^TMP("LEXQC",$J,"CPT")) UPC("CPT")
 D:$D(^TMP("LEXQC",$J,"CPC")) UPC("CPC")
 N LEXQUIET
 Q
MOD ; CPT Modifier Changes
 K ^TMP("LEXQC",$J,"MOD") N LEX1,LEX2,LEX3,LEX4,LEX5,LEX6,LEXAEF
 N LEXAST,LEXBEF,LEXBST,LEXCEF,LEXCNT,LEXCST,LEXH,LEXIDT,LEXIEN
 N LEXLC,LEXND,LEXPEF,LEXPST,LEXQL,LEXSO,LEXSTID
 S LEXQLEN=+($G(LEXQLEN)) S LEXQTOT=+($G(LEXQTOT))
 S LEXQSTR=+($G(LEXQSTR)),LEXCNT=0,LEXLC=0
 S LEXIDT=$$IMPDATE^LEXU("CPT"),LEXCDT=$G(LEXCDT)
 Q:LEXCDT'?7N  Q:LEXCDT'>LEXIDT  S LEXIEN=0
 F  S LEXIEN=$O(^DIC(81.3,LEXIEN)) Q:+LEXIEN'>0  D
 . Q:$O(^DIC(81.3,+LEXIEN,60,0))'>0  N LEX1,LEX2,LEX3,LEX4,LEX5
 . N LEX6,LEX7,LEX8,LEXAEF,LEXAF,LEXAST,LEXACT,LEXBEF,LEXBST,LEXCEF
 . N LEXCST,LEXH,LEXIF,LEXINA,LEXND,LEXPEF,LEXPST,LEXQL,LEXR,LEXRI
 . N LEXSO,LEXSTID,LEXSID S LEXCNT=LEXCNT+1
 . I LEXCNT'<+($G(LEXQSTR)) S LEXLC=+($G(LEXLC))+1 D
 . . W:'$D(ZTQUEUED)&('$D(LEXQUIET))&(LEXLC'>+($G(LEXQLEN))) "." S LEXCNT=0
 . S LEXSID="MOD" S LEXSO=$P($G(^DIC(81.3,LEXIEN,0)),"^",1)
 . Q:'$L(LEXSO)  S LEXH=$O(^DIC(81.3,+LEXIEN,60,"B",LEXCDT," "),-1)
 . S LEXND=$G(^DIC(81.3,+LEXIEN,60,+LEXH,0))
 . S LEXCEF=$P(LEXND,"^",1),LEXCST=$P(LEXND,"^",2)
 . S LEXH=$O(^DIC(81.3,+LEXIEN,60,"B",LEXBDT," "),-1)
 . S LEXND=$G(^DIC(81.3,+LEXIEN,60,+LEXH,0))
 . S LEXBEF=$P(LEXND,"^",1),LEXBST=$P(LEXND,"^",2)
 . S LEXH=$O(^DIC(81.3,+LEXIEN,60,"B",LEXADT," "),-1)
 . S LEXND=$G(^DIC(81.3,+LEXIEN,60,+LEXH,0))
 . S LEXAEF=$P(LEXND,"^",1),LEXAST=$P(LEXND,"^",2)
 . S LEXH=$O(^DIC(81.3,+LEXIEN,60,"B",LEXCDT),-1)
 . S LEXH=$O(^DIC(81.3,+LEXIEN,60,"B",+LEXH," "),-1)
 . S LEXND=$G(^DIC(81.3,+LEXIEN,60,+LEXH,0))
 . S LEXPEF=$P(LEXND,"^",1),LEXPST=$P(LEXND,"^",2)
 . S LEX1=$D(^DIC(81.3,+LEXIEN,61,"B",LEXCDT))>0
 . S LEX2=$D(^DIC(81.3,+LEXIEN,62,"B",LEXCDT))>0
 . S LEX3=$O(^DIC(81.3,+LEXIEN,61,"B",LEXCDT),-1)
 . S LEX4=$O(^DIC(81.3,+LEXIEN,62,"B",LEXCDT),-1)
 . S LEX5=$D(^DIC(81.3,+LEXIEN,61,"B",LEXCDT))
 . S LEX6=$D(^DIC(81.3,+LEXIEN,62,"B",LEXCDT))
 . ; Short IEN Dupe
 . S LEX7=$O(^DIC(81.3,+LEXIEN,61,"B",LEXCDT," "),-1),LEX7=$$DUPS^LEXQC5(81.3,LEXIEN,LEX7)
 . ; Long IEN Dupe
 . S LEX8=$O(^DIC(81.3,+LEXIEN,62,"B",LEXCDT," "),-1),LEX8=$$DUPL^LEXQC5(81.3,LEXIEN,LEX8)
 . ; Activiation/Inactiviation/Re-Activation
 . ;   Has a current status and effective date
 . ;   Has a previous status and effective date
 . ;   Current status not equal to previosu status
 . ;   Has a short description
 . ;   Has a long description
 . ;   Activation - current status >0
 . ;   Inactivatin - current status =0
 . ;   Reactivation - current status >0 past status =0
 . S LEXQL=0 I $L(LEXCST),$L(LEXCEF) D
 . . Q:$L(LEXBEF)&($L(LEXBST))&(LEXBST'=LEXCST)
 . . Q:$L(LEXAEF)&($L(LEXAST))&(LEXAST'=LEXCST)
 . . Q:(LEX1>0&(LEX3?7N))!(LEX2>0&(LEX4?7N))
 . . N LEXSTID Q:'$L($G(LEXSO))
 . . N LEXCT,LEXO S LEXSTID=$S(+LEXCST>0:"ACT",1:"INA")
 . . I LEXSTID="ACT",$G(LEXPEF)?7N,+($G(LEXPST))'>0 D
 . . . I +($G(LEX5))'>0,+($G(LEX6))'>0 S LEXSTID="REA"
 . . S LEXQL=1,LEXO=LEXIEN_"^"_LEXSO_"^"_LEXCDT
 . . S LEXCT=+($G(^TMP("LEXQC",$J,LEXSID,LEXSTID,0)))
 . . S:'$D(^TMP("LEXQC",$J,LEXSID,LEXSTID,1,(LEXSO_" "))) LEXCT=LEXCT+1
 . . S ^TMP("LEXQC",$J,LEXSID,LEXSTID,1,(LEXSO_" "))=LEXO
 . . S ^TMP("LEXQC",$J,LEXSID,LEXSTID,0)=LEXCT
 . ; Revision
 . ;   I Previous status (LEXPST) >0 and
 . ;     Short exist (LEX1) with a previous short (LEX3) and not a duplicate (LEX7) or
 . ;     Long exist (LEX2) with a previosu long (LEX4) and not a duplicate (LEX8)
 . I 'LEXQL I +LEXPST>0,((LEX1>0&(LEX3?7N)&(LEX7'>0))!(LEX2>0&(LEX4?7N)&(LEX8'>0))) D  Q:LEXQL
 . . N LEXCT,LEXO Q:'$L($G(LEXSO))  S LEXQL=1
 . . S LEXO=LEXIEN_"^"_LEXSO_"^"_LEXCDT
 . . S LEXCT=+($G(^TMP("LEXQC",$J,LEXSID,"REV",0)))
 . . S:'$D(^TMP("LEXQC",$J,LEXSID,"REV",1,(LEXSO_" "))) LEXCT=LEXCT+1
 . . S ^TMP("LEXQC",$J,LEXSID,"REV",1,(LEXSO_" "))=LEXO
 . . S ^TMP("LEXQC",$J,LEXSID,"REV",0)=LEXCT
 . ; Re-Used
 . ;   Current status (LEXCST) exist and active
 . ;   Previous Status (LEXPST) exist and is active
 . ;     Short exist (LEX1) with a previous short (LEX3) and not a duplicate (LEX7) or
 . ;     Long exist (LEX2) with a previosu long (LEX4) and not a duplicate (LEX8)
 . I 'LEXQL S LEXQL=0 I ((LEXCEF?7N&(LEXCST>0))!(LEXPEF?7N&(LEXPST>0))),((LEX1>0&(LEX3?7N)&(LEX7'>0))!(LEX2>0&(LEX4?7N)&(LEX8'>0))) D
 . . N LEXCT,LEXO S LEXQL=1
 . . S LEXO=LEXIEN_"^"_LEXSO_"^"_LEXCDT
 . . S LEXCT=+($G(^TMP("LEXQC",$J,LEXSID,"REU",0)))
 . . S:'$D(^TMP("LEXQC",$J,LEXSID,"REU",1,(LEXSO_" "))) LEXCT=LEXCT+1
 . . S ^TMP("LEXQC",$J,LEXSID,"REU",1,(LEXSO_" "))=LEXO
 . . S ^TMP("LEXQC",$J,LEXSID,"REU",0)=LEXCT
 . S (LEXAF,LEXIF,LEXRI)=0,LEXSID="RAN",LEXR=0
 . F  S LEXRI=$O(^DIC(81.3,+LEXIEN,10,LEXRI)) Q:+LEXRI'>0  D  Q:LEXR>1
 . . S LEXND=$G(^DIC(81.3,+LEXIEN,10,LEXRI,0))
 . . S LEXACT=$P(LEXND,"^",3),LEXINA=$P(LEXND,"^",4)
 . . I LEXACT=LEXCDT,'$L(LEXINA) D
 . . . N LEXCT,LEXO Q:$D(^TMP("LEXQC",$J,LEXSID,"ACT",1,(LEXSO_" ")))
 . . . S LEXO=LEXIEN_"^"_LEXSO_"^"_LEXCDT
 . . . S LEXCT=+($G(^TMP("LEXQC",$J,LEXSID,"ACT",0)))
 . . . S:'$D(^TMP("LEXQC",$J,LEXSID,"ACT",1,(LEXSO_" "))) LEXCT=LEXCT+1
 . . . S ^TMP("LEXQC",$J,LEXSID,"ACT",1,(LEXSO_" "))=LEXO
 . . . S ^TMP("LEXQC",$J,LEXSID,"ACT",0)=LEXCT,LEXAF=1
 . . I LEXINA=LEXCDT,$L(LEXACT),LEXINA>LEXACT,(LEXINA-LEXACT)>1 D
 . . . N LEXCT,LEXO Q:$D(^TMP("LEXQC",$J,LEXSID,"INA",1,(LEXSO_" ")))
 . . . S LEXO=LEXIEN_"^"_LEXSO_"^"_LEXCDT
 . . . S LEXCT=+($G(^TMP("LEXQC",$J,LEXSID,"INA",0)))
 . . . S:'$D(^TMP("LEXQC",$J,LEXSID,"INA",1,(LEXSO_" "))) LEXCT=LEXCT+1
 . . . S ^TMP("LEXQC",$J,LEXSID,"INA",1,(LEXSO_" "))=LEXO
 . . . S ^TMP("LEXQC",$J,LEXSID,"INA",0)=LEXCT,LEXIF=1
 . . S LEXR=+LEXAF+LEXIF
 D:$D(^TMP("LEXQC",$J,"MOD")) UPC("MOD")
 N LEXQUIET
 Q
UPC(X) ; Update Counters
 N LEXSID,LEXACT,LEXORD,LEXCT S LEXSID=$G(X) Q:'$L(LEXSID)
 S LEXACT="" F  S LEXACT=$O(^TMP("LEXQC",$J,LEXSID,LEXACT)) Q:'$L(LEXACT)  D
 . S LEXCT=0,LEXORD="" F  S LEXORD=$O(^TMP("LEXQC",$J,LEXSID,LEXACT,1,LEXORD)) Q:'$L(LEXORD)  S LEXCT=LEXCT+1
 . S ^TMP("LEXQC",$J,LEXSID,LEXACT,0)=LEXCT
 Q
