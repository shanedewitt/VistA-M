PSJPADIU ;BP/VGH-INPATIENT PADE INVENTORY FILE UTILITIES ;3/20/18 8:35 AM
 ;;5.0;INPATIENT MEDICATIONS ;**356**;16 DEC 97;Build 7
 ;Per VHA Directive 2004-038, this routine should not be modified.
 ;
FILDEV(PADATA,ERRMSG) ; File PADE DEVICE to PADE INVENTORY file
 N FDA,PSJPSYS,PSJSCR,PSJSCR
 I '($G(PADATA(2))]"") S ERRMSG="MISSING PADE DEVICE" Q 0
 I $G(PSJPSYS),$G(^PS(58.601,+PSJPSYS,0))]"" S PADATA("SYS IEN")=PSJPSYS
 S PSJPSYS=PADATA("SYS IEN"),PSJSCR="I $S('$G(PSJPSYS):1,1:PSJPSYS=$P(^(0),U,2))"
 I ($G(PADATA(1))=""&$G(PSJPSYS)) S PADATA(1)=$P(^PS(58.601,PSJPSYS,0),"^")
 K ERR S PADATA("DEVICE IEN")=$$FIND1^DIC(58.63,,"X",PADATA(2),,PSJSCR,"ERR") K DIERR ;*356- remove M (multiple index lookup)
 I '$G(PADATA("DEVICE IEN")) D
 .N FDA S FDA(58.63,"?+1,",.01)=PADATA(2)
 .S FDA(58.63,"?+1,",1)=PADATA(1)
 .S FDA(58.63,"?+1,",12)=$$UPPER^PSJPDRUT(PADATA(2))
 .K ERR,DIERR D UPDATE^DIE("E","FDA","","ERR") K DIERR ;*356
 .K ERR,DIERR S PADATA("DEVICE IEN")=$$FIND1^DIC(58.63,,"X",PADATA(2),,PSJSCR,"ERR") K DIERR ;*356- remove M (multiple index lookup)
 I $G(PADATA("DEVICE IEN")) D
 .N FDA S FDA(58.6011,"?+1,"_PADATA("SYS IEN")_",",.01)=PADATA(2) K ERR D UPDATE^DIE("E","FDA","","ERR") K DIERR  ;*356
 .K ERR,DIERR S PADATA("DEVICE IEN")=$$FIND1^DIC(58.6011,","_PADATA("SYS IEN")_",","BX",PADATA(2),,,"ERR") K DIERR ;*356- replaced M (multiple index lookup) with B
 I '$G(PADATA("DEVICE IEN")) S ERRMSG="Unable to file PADE Device "_PADATA(2) Q 0
 Q 1
