LEXINF5 ;ISL/KER - Information - Display ;05/23/2017
 ;;2.0;LEXICON UTILITY;**103**;Sep 23, 1996;Build 2
 ;               
 ; Global Variables
 ;    ^LEX(757.02         SACC 1.3
 ;    ^LEX(757.03         SACC 1.3
 ;    ^TMP("LEXINF"       SACC 2.3.2.5.1
 ;               
 ; External References
 ;    ^%ZIS               ICR  10086
 ;    HOME^%ZIS           ICR  10086
 ;    ^%ZISC              ICR  10089
 ;    ^%ZTLOAD            ICR  10063
 ;    ^DIR                ICR  10026
 ;    $$FMTE^XLFDT        ICR  10103
 ;               
TERM(ARY) ; Display by Expression
 K ^TMP("LEXINF",$J) N LEXTYPE S LEXTYPE="T" D MP(.ARY),FS(.ARY),OT(.ARY),CO(.ARY),SR(.ARY),SB(.ARY),DC(.ARY),CP(.ARY) D:$D(^TMP("LEXINF",$J)) DEV
 Q
CODE(ARY) ; Display by Code
 K ^TMP("LEXINF",$J) S LEXTYPE="C" D CO(.ARY),MP(.ARY),FS(.ARY),OT(.ARY),SR(.ARY),SB(.ARY),DC(.ARY),CP(.ARY) D:$D(^TMP("LEXINF",$J)) DEV
 Q
 ;
 ; Display Components
MP(ARY) ;   Major Concept/Preferred Term           MC/PF
 N LEXA,LEXEXP,LEXI,LEXMC,LEXPF,LEXTTL S LEXMC=$P($G(ARY("MC",1,"I")),"^",4) Q:LEXMC'>0
 S LEXPF=$P($G(ARY("PF",1,"I")),"^",4),LEXTTL="Major Concept" S:LEXPF=LEXMC LEXTTL=LEXTTL_"/Preferred Term"
 S LEXEXP=$G(ARY("MC",1)) Q:'$L(LEXEXP)  S:$D(LEXIIEN) LEXEXP=LEXEXP_" (IEN "_LEXMC_")"
 K LEXA S LEXA(1)=LEXEXP D PR^LEXU(.LEXA,70) D TL((" "_LEXTTL)) S LEXI=0
 F  S LEXI=$O(LEXA(LEXI)) Q:+LEXI'>0  D:LEXI=1 BL D TL(("     "_$G(LEXA(LEXI))))
 D ID("MC",1,.ARY),SK("MC",1,.ARY) I LEXPF>0,LEXPF'=LEXMC D
 . N LEXEXP,LEXA,LEXTTL,LEXI S LEXEXP=$G(ARY("PF",1)) S:$D(LEXIIEN) LEXEXP=LEXEXP_" (IEN "_+LEXPF_")"
 . S LEXTTL="Preferred Term" K LEXA S LEXA(1)=LEXEXP D PR^LEXU(.LEXA,70)
 . D BL,TL((" "_LEXTTL)) S LEXI=0 F  S LEXI=$O(LEXA(LEXI)) Q:+LEXI'>0  D:LEXI=1 BL D TL(("     "_$G(LEXA(LEXI))))
 . D ID("PF",1,.ARY),SK("PF",1,.ARY)
 N LEXIIEN,TEST
 Q
FS(ARY) ;   Fully Specified Names                  FS
 N LEXA,LEXEXP,LEXI,LEXIEN,LEXSEQ,LEXSTA,LEXTTL S LEXTTL="Fully Specified Name"
 S:$O(ARY("FS"," "),-1)>1 LEXTTL=LEXTTL_"s" D:$O(ARY("FS",0))>0 BL,TL((" "_LEXTTL))
 S LEXSEQ=0 F  S LEXSEQ=$O(ARY("FS",LEXSEQ)) Q:+LEXSEQ'>0  D
 . N LEXA,LEXEXP,LEXI,LEXIEN,LEXSTA
 . S LEXIEN=$P($G(ARY("FS",LEXSEQ,"I")),"^",4) Q:LEXIEN'>0
 . S LEXSTA=$P($G(ARY("FS",LEXSEQ,"I")),"^",3) S:LEXSTA'["Retire" LEXSTA=""
 . S LEXEXP=$G(ARY("FS",LEXSEQ)) Q:'$L(LEXEXP)
 . S:$L(LEXSTA) LEXEXP=LEXEXP_" ("_LEXSTA_")"
 . S:$D(LEXIIEN) LEXEXP=LEXEXP_" (IEN "_LEXIEN_")" K LEXA S LEXA(1)=LEXEXP D PR^LEXU(.LEXA,70)
 . S LEXI=0 F  S LEXI=$O(LEXA(LEXI)) Q:+LEXI'>0  D:LEXI=1 BL D TL(("     "_$G(LEXA(LEXI))))
 . D ID("FS",LEXSEQ,.ARY)
 . D SK("FS",LEXSEQ,.ARY)
 Q
OT(ARY) ;   Other Terms                            SY/LV
 N LEXPF,LEXTY S LEXPF=$P($G(ARY("PF",1,"I")),"^",4) F LEXTY="SY","LV" D
 . N LEXTTL,LEXSEQ S LEXTTL=$S(LEXTY="LV":"Lexical Variant",1:"Synonym")
 . S:$O(ARY(LEXTY," "),-1)>1 LEXTTL=LEXTTL_"s" D:$O(ARY(LEXTY,0))>0 BL,TL((" "_LEXTTL))
 . S LEXSEQ=0 F  S LEXSEQ=$O(ARY(LEXTY,LEXSEQ)) Q:+LEXSEQ'>0  D
 . . N LEXIEN,LEXSTA,LEXEXP,LEXA,LEXI
 . . S LEXIEN=$P($G(ARY(LEXTY,LEXSEQ,"I")),"^",4)
 . . S LEXSTA=$P($G(ARY(LEXTY,LEXSEQ,"I")),"^",3) S:LEXSTA'["Retire" LEXSTA=""
 . . S LEXEXP=$G(ARY(LEXTY,LEXSEQ))
 . . S:$L(LEXSTA) LEXEXP=LEXEXP_" ("_LEXSTA_")"
 . . S:$D(LEXIIEN) LEXEXP=LEXEXP_" (IEN "_LEXIEN_")"
 . . K LEXA S LEXA(1)=LEXEXP D PR^LEXU(.LEXA,70)
 . . S LEXI=0 F  S LEXI=$O(LEXA(LEXI)) Q:+LEXI'>0  D:LEXI=1 BL D TL(("     "_$G(LEXA(LEXI))))
 . . D ID(LEXTY,LEXSEQ,.ARY)
 Q
ID(X,Y,ARY) ;   Designation ID                         ID
 N LEXC,LEXCT,LEXH,LEXID,LEXSEQ,LEXSTR,LEXT,LEXTTL,LEXTY S LEXTY=$G(X),LEXSEQ=$G(Y) Q:'$L(LEXTY)  Q:+LEXSEQ'>0
 Q:'$D(ARY(LEXTY,LEXSEQ,"ID"))  Q:$O(ARY(LEXTY,LEXSEQ,"ID",0))'>0  S LEXT=20,LEXTTL="Designation ID"
 S:$L($P($G(ARY(LEXTY,LEXSEQ,"ID",1,"I")),"^",3)) LEXTTL=LEXTTL_$J(" ",(LEXT-$L(LEXTTL)))_"Hierarchy "
 S (LEXCT,LEXID)=0 F  S LEXID=$O(ARY(LEXTY,LEXSEQ,"ID",LEXID)) Q:+LEXID'>0  D
 . N LEXC,LEXH,LEXSTR S LEXC=$G(ARY(LEXTY,LEXSEQ,"ID",LEXID)) Q:'$L(LEXC)
 . S LEXH=$P($G(ARY(LEXTY,LEXSEQ,"ID",LEXID,"I")),"^",3)
 . S LEXSTR=LEXC S:$L(LEXH) LEXSTR=LEXSTR_$J(" ",((LEXT-2)-$L(LEXSTR)))_LEXH
 . S LEXCT=LEXCT+1 D:LEXCT=1 TL(("       "_LEXTTL)) D TL(("         "_LEXSTR))
 Q
SK(X,Y,ARY) ;   Supplemental Keywords                  SK
 N LEXA,LEXCL,LEXI,LEXK,LEXMX,LEXNM,LEXSEQ,LEXSK,LEXSTR,LEXTTL,LEXTY S LEXTY=$G(X),LEXSEQ=$G(Y) Q:'$L(LEXTY)
 Q:+LEXSEQ'>0  Q:'$D(ARY(LEXTY,LEXSEQ,"SK"))  Q:$O(ARY(LEXTY,LEXSEQ,"SK",0))'>0  S LEXMX=0
 S LEXSK=0 F  S LEXSK=$O(ARY(LEXTY,LEXSEQ,"SK",LEXSK)) Q:+LEXSK'>0  D
 . N LEXK S LEXK=$G(ARY(LEXTY,LEXSEQ,"SK",LEXSK)) S:$L(LEXK)>LEXMX LEXMX=$L(LEXK)
 S LEXMX=LEXMX+2,LEXNM=65\LEXMX,LEXTTL="Supplemental Keywords" K LEXA S LEXI=1,LEXSK=0,LEXCL=0
 S LEXSTR="" K LEXA F  S LEXSK=$O(ARY(LEXTY,LEXSEQ,"SK",LEXSK)) Q:+LEXSK'>0  D
 . N LEXK S LEXK=$G(ARY(LEXTY,LEXSEQ,"SK",LEXSK)) Q:'$L(LEXK)
 . S LEXSTR=LEXSTR_LEXK_$J(" ",(LEXMX-$L(LEXK))),LEXCL=LEXCL+1
 . S:LEXCL'<LEXNM LEXA(LEXI)=LEXSTR,LEXCL=0,LEXSTR="",LEXI=LEXI+1
 . S:LEXCL<LEXNM LEXA(LEXI)=LEXSTR
 I $O(LEXA(0))>0 D
 . N LEXI,LEXSTR D TL(("       "_LEXTTL)) S LEXI=0 F  S LEXI=$O(LEXA(LEXI)) Q:+LEXI'>0  D
 . . N LEXSTR S LEXSTR=$$TM($G(LEXA(LEXI))) D TL(("         "_LEXSTR))
 Q
SR(ARY) ;   Sources                                SR
 N LEXA,LEXCT,LEXI,LEXIEN,LEXND,LEXNOM,LEXSAB,LEXSEQ,LEXSTR,LEXTTL
 Q:'$D(ARY("SR"))  Q:$O(ARY("SR",0))'>0
 S LEXTTL="Sources",LEXCT=0
 S LEXSEQ=0 F  S LEXSEQ=$O(ARY("SR",LEXSEQ)) Q:+LEXSEQ'>0  D
 . N LEXA,LEXIEN,LEXND,LEXNOM,LEXSAB,LEXSDO,LEXSTR S LEXND=$G(ARY("SR",LEXSEQ,"I"))
 . S LEXSAB=$P(LEXND,"^",1) Q:'$L(LEXSAB)  S LEXIEN=$O(^LEX(757.03,"ASAB",LEXSAB,0)) Q:LEXIEN'>0
 . S LEXNOM=$P(LEXND,"^",2) Q:'$L(LEXNOM)  S LEXSDO=$P(LEXND,"^",3) S:$D(LEXIIEN) LEXSDO=LEXSDO_" (IEN "_LEXIEN_")"
 . S LEXA(1)=LEXSDO D PR^LEXU(.LEXA,(78-26)) S LEXSTR=LEXNOM,LEXSTR=LEXSTR_$J(" ",(15-$L(LEXSTR)))_LEXSAB,LEXCT=LEXCT+1
 . D:LEXCT=1 BL,TL((" "_LEXTTL)),BL S LEXSTR="     "_LEXSTR
 . S:$L(LEXA(1)) LEXSTR=LEXSTR_$J(" ",(27-$L(LEXSTR)))_$G(LEXA(1)) D TL(LEXSTR)
 . I $O(LEXA(1))>1 D
 . . N LEXI S LEXI=1 F  S LEXI=$O(LEXA(LEXI)) Q:+LEXI'>0  D
 . . . N LEXSTR S LEXSTR=$J(" ",27)_$G(LEXA(LEXI)) D TL(LEXSTR)
 Q
CO(ARY) ;   Codes                                  CO
 N LEXTTL,LEXSEQ,LEXCT S LEXTTL="Codes",(LEXSEQ,LEXCT)=0 F  S LEXSEQ=$O(ARY("CO",LEXSEQ)) Q:+LEXSEQ'>0  D
 . N LEXCO,LEXND,LEXST,LEXEF,LEXIE,LEXSR,LEXNM,LEXSTR S LEXCO=$G(ARY("CO",LEXSEQ)),LEXND=$G(ARY("CO",LEXSEQ,"I"))
 . S LEXST=$P(LEXND,"^",1) Q:LEXST'?1N  S LEXEF=$P(LEXND,"^",2) Q:LEXEF'?7N  S LEXIE=$P(LEXND,"^",4) Q:LEXIE'>0
 . S LEXSR=$P($G(^LEX(757.02,+LEXIE,0)),"^",3) Q:LEXSR'>0  S LEXNM=$P($G(^LEX(757.03,+LEXSR,0)),"^",2) Q:'$L(LEXNM)
 . S LEXST=$S(LEXST>0:"Active",1:"Inactive"),LEXSTR=LEXCO,LEXSTR=LEXSTR_" "_$J(" ",(21-$L(LEXSTR)))_LEXNM
 . S LEXSTR=LEXSTR_" "_$J(" ",(33-$L(LEXSTR)))_LEXST,LEXSTR=LEXSTR_" "_$J(" ",(43-$L(LEXSTR)))_$$FMTE^XLFDT(LEXEF,"5Z")
 . S:$D(LEXIIEN) LEXSTR=LEXSTR_$J(" ",(51-$L(LEXSTR)))_" (IEN "_LEXIE_")" S LEXCT=LEXCT+1 D:LEXCT=1 BL,TL((" "_LEXTTL)),BL
 . S LEXSTR="     "_LEXSTR D TL(LEXSTR) D MA(LEXCO,LEXSR,.ARY)
 D:LEXCT>0&($G(LEXTYPE)'="T") BL
 Q
MA(X,Y,ARY) ;   Mappings                               MP
 N LEXSEQ,LEXSRC,LEXSYS,LEXNOM,LEXTTL,LEXCT,LEXSEQ
 S LEXSRC=$G(X),LEXSYS=$G(Y) Q:'$L(LEXSRC)  Q:+LEXSYS'>0  S LEXNOM=$P($G(^LEX(757.03,+LEXSYS,0)),"^",2)
 Q:'$L(LEXNOM)  S LEXTTL="Mappings",(LEXCT,LEXSEQ)=0 F  S LEXSEQ=$O(ARY("MP",LEXSEQ)) Q:+LEXSEQ'>0  D
 . N LEXTAR,LEXND,LEXTST,LEXTEF,LEXTSY,LEXIEN,LEXMAT,LEXSTR S LEXTAR=$G(ARY("MP",LEXSEQ)),LEXND=$G(ARY("MP",LEXSEQ,"I"))
 . Q:$P(LEXND,"^",6)'=LEXSRC  Q:$P(LEXND,"^",7)'=LEXSYS  S LEXTST=$P(LEXND,"^",1) Q:LEXTST'?1N
 . S LEXTST=$S(LEXTST>0:"Active",1:"Inactive"),LEXTEF=$P(LEXND,"^",2) Q:LEXTEF'?7N
 . S LEXTEF=$$FMTE^XLFDT(LEXTEF,"5Z"),LEXTSY=$P(LEXND,"^",3) Q:'$L(LEXTSY)
 . S LEXIEN=$P(LEXND,"^",4) Q:+LEXIEN'>0  S LEXMAT=$P(LEXND,"^",5) Q:'$L(LEXMAT)
 . S LEXCT=LEXCT+1 D:LEXCT=1 TL(("       "_LEXTTL)) S LEXSTR=LEXTAR
 . S LEXSTR=LEXSTR_" "_$J(" ",(17-$L(LEXSTR)))_LEXTSY,LEXSTR=LEXSTR_" "_$J(" ",(29-$L(LEXSTR)))_LEXTST
 . S LEXSTR=LEXSTR_" "_$J(" ",(39-$L(LEXSTR)))_LEXTEF S:$D(LEXIIEN) LEXSTR=LEXSTR_$J(" ",(51-$L(LEXSTR)))_" (IEN "_LEXIEN_")"
 . D TL(("         "_LEXSTR))
 Q
DC(ARY) ;   Diagnostic Categories (ICD-10-CM)      DC
 Q:'$D(ARY("CO","B",30))  N LEXSEQ,LEXTTL,LEXCT S LEXTTL="Diagnostic Categories (ICD-10-CM)",(LEXCT,LEXSEQ)=0
 F  S LEXSEQ=$O(ARY("DC",LEXSEQ)) Q:+LEXSEQ'>0  D
 . N LEXA,LEXDC,LEXND,LEXI,LEXST,LEXEF,LEXNM,LEXIE,LEXSTR,LEXT
 . S LEXDC=$G(ARY("DC",LEXSEQ)),LEXND=$G(ARY("DC",LEXSEQ,"I")),LEXST=$P(LEXND,"^",1),LEXEF=$P(LEXND,"^",2)
 . S LEXNM=$P(LEXND,"^",3),LEXIE=$P(LEXND,"^",4) S:$D(LEXIIEN) LEXNM=LEXNM_" (IEN "_LEXIE_")"
 . K LEXA S LEXA(1)=LEXNM D PR^LEXU(.LEXA,61) S LEXSTR=LEXDC,LEXSTR=LEXSTR_$J(" ",(12-$L(LEXSTR)))_$G(LEXA(1))
 . S LEXCT=LEXCT+1 D:LEXCT=1 BL,TL((" "_LEXTTL)),BL S LEXSTR="     "_LEXSTR D TL(LEXSTR)
 . S LEXI=1 F  S LEXI=$O(LEXA(LEXI)) Q:+LEXI'>0  D
 . . N LEXT S LEXT="",LEXT=LEXT_$J(" ",(12-$L(LEXT)))_$G(LEXA(LEXI)) S LEXT="     "_LEXT D TL(LEXT)
 Q
CP(ARY) ;   Character Positions (ICD-10-PCS)       CP
 Q:'$D(ARY("CO","B",31))  N LEXSEQ,LEXTTL,LEXCT,LEXCODE S LEXTTL="Procedure Character Positions (ICD-10-PCS)"
 S (LEXCT,LEXSEQ)=0,LEXCODE=$G(ARY("CP","I"))
 F  S LEXSEQ=$O(ARY("CP",LEXSEQ)) Q:+LEXSEQ'>0  D
 . N LEXA,LEXDC,LEXND,LEXI,LEXST,LEXEF,LEXNM,LEXIE,LEXSTR,LEXT
 . S LEXDC=$G(ARY("CP",LEXSEQ)),LEXND=$G(ARY("CP",LEXSEQ,"I")),LEXST=$P(LEXND,"^",1),LEXEF=$P(LEXND,"^",2)
 . S LEXNM=$P(LEXND,"^",3),LEXIE=$P(LEXND,"^",4) S:$D(LEXIIEN) LEXNM=LEXNM_" (IEN "_LEXIE_")"
 . K LEXA S LEXA(1)=LEXNM D PR^LEXU(.LEXA,61) S LEXSTR=LEXDC,LEXSTR=LEXSTR_$J(" ",(12-$L(LEXSTR)))_$G(LEXA(1))
 . S LEXCT=LEXCT+1 I LEXCT=1 D
 . . N LEXT D BL,TL((" "_LEXTTL)),BL I $L($G(LEXCODE)) D
 . . . S LEXT=LEXCODE,LEXT=LEXT_$J(" ",(12-$L(LEXT)))_"Code",LEXT="     "_LEXT D TL(LEXT)
 . S LEXSTR="     "_LEXSTR D TL(LEXSTR)
 . S LEXI=1 F  S LEXI=$O(LEXA(LEXI)) Q:+LEXI'>0  D
 . . N LEXT S LEXT="",LEXT=LEXT_$J(" ",(12-$L(LEXT)))_$G(LEXA(LEXI)) S LEXT="     "_LEXT D TL(LEXT)
 Q
SB(ARY) ;   Subsets                                SB
 N LEXA,LEXCT,LEXI,LEXSEQ,LEXTTL,LEXT
 S LEXTTL="Subsets",(LEXCT,LEXSEQ)=0 F  S LEXSEQ=$O(ARY("SB",LEXSEQ)) Q:LEXSEQ'>0  D
 . N LEXND,LEXNM,LEXST,LEXSS,LEXEX,LEXIE,LEXAB,LEXT S LEXNM=$G(ARY("SB",LEXSEQ)) Q:'$L(LEXNM)
 . S LEXND=$G(ARY("SB",LEXSEQ,"I")),LEXST=+LEXND,LEXSS=$P(LEXND,"^",2),LEXEX=$P(LEXND,"^",3)
 . S LEXIE=$P(LEXND,"^",4),LEXAB=$P(LEXND,"^",5) Q:$L(LEXAB)'=3  S LEXT=LEXNM
 . S LEXT=LEXT_$J(" ",(36-$L(LEXT)))_LEXAB S:$D(LEXIIEN) LEXT=LEXT_" (IEN "_LEXIE_")"
 . S LEXCT=LEXCT+1 D:LEXCT=1 BL,TL((" "_LEXTTL)),BL S LEXT="     "_LEXT D TL(LEXT)
 Q
 ;
DEV ; Device/Output
 N %ZIS,LEXCF,LEXCONT,LEXDNC,LEXEOP,LEXI,LEXLC,ZTDESC,ZTDTH,ZTIO,ZTQUEUED,ZTREQ,ZTRTN,ZTSAVE,ZTSK,POP
 S %ZIS("A")=" Device:  ",ZTRTN="OUT^LEXINF5",ZTDESC="Display Lexicon Data"
 S ZTIO=ION,ZTDTH=$H,%ZIS="Q",ZTSAVE(("^TMP(""LEXINF"","_$J_","))="" D ^%ZIS I POP K %ZIS("A"),^TMP("LEXINF",$J) Q
 S ZTIO=ION I $D(IO("Q")) D QUE,^%ZISC,HOME^%ZIS K %ZIS("A") Q
 K %ZIS("A") D NOQUE K ^TMP("LEXINF",$J) Q
NOQUE ;   Do not queue Display
 W @IOF W:IOST["P-" !,"< Not queued, printing Lexicon data >",! U:IOST["P-" IO D @ZTRTN,^%ZISC,HOME^%ZIS Q
QUE ;   Task queued to print Help
 K IO("Q") D ^%ZTLOAD W !,$S($D(ZTSK):"Request Queued",1:"Request Cancelled"),! Q
 Q
OUT ;   Output
 Q:'$D(^TMP("LEXINF",$J))  W:$L($G(IOF))&($G(IOST)'["P-MESSAGE") @IOF
 N LEXLN,LEXLC,LEXCF,LEXCONT,LEXEOP,LEXIT S LEXIT=0,LEXEOP=+($G(IOSL))
 S:LEXEOP=0 LEXEOP=24 S LEXEOP=LEXEOP-2 S (LEXLC,LEXLN)=0 F  S LEXLN=$O(^TMP("LEXINF",$J,LEXLN)) Q:+LEXLN'>0  D  Q:LEXIT
 . N LEXT S LEXT=$G(^TMP("LEXINF",$J,LEXLN)) W !," ",LEXT S LEXCF=0 D LF
 I LEXCF,LEXIT>0 D EOP W:$L($G(IOF)) @IOF K ^TMP("LEXINF",$J) Q
 I 'LEXCF D EOP W:$L($G(IOF)) @IOF
 K ^TMP("LEXINF",$J)
 Q
LF ;   Line Feed
 S LEXLC=LEXLC+1 D:IOST["P-"&(LEXLC>(LEXEOP-7)) EOP D:IOST'["P-"&(LEXLC>(LEXEOP-4)) EOP
 Q
EOP ;   End of Page
 N LEXCONT S LEXLC=0 W:IOST["P-" @IOF Q:IOST["P-"  W !! S LEXCONT=$$CONT S LEXCF=1
 Q
CONT(X) ;   Ask to Continue
 Q:+($G(LEXIT))>0 "^^"  N DIR,DIROUT,DIRUT,DUOUT,DTOUT,Y S DIR(0)="EAO",DIR("A")=" Enter RETURN to continue or '^' to exit: "
 S DIR("PRE")="S:X[""?"" X=""??"" S:X[""^"" X=""^""",(DIR("?"),DIR("??"))="^D CONTH^LEXINF5"
 D ^DIR S:X["^"!($D(DTOUT)) LEXIT=1 Q:$D(DIROUT)!($D(DIRUT))!($D(DUOUT))!($D(DTOUT))!(X["^") "^"
 Q ""
CONTH ;   Ask to Continue Help
 W !,"     Enter either RETURN or '^'."
 Q
 ; 
 ; Miscellaneous
BL ;   Blank Line
 D TL(" ")
 Q
TL(X) ;   Text Line
 W:$D(TEST) !,$G(X) Q:$D(TEST)
 N LEXI S LEXI=$O(^TMP("LEXINF",$J," "),-1)+1 S ^TMP("LEXINF",$J,LEXI)=$G(X)
 Q
TM(X,Y) ;   Trim Character Y - Default " "
 S X=$G(X) Q:X="" X  S Y=$G(Y) S:'$L(Y) Y=" "
 F  Q:$E(X,1)'=Y  S X=$E(X,2,$L(X))
 F  Q:$E(X,$L(X))'=Y  S X=$E(X,1,($L(X)-1))
 Q X