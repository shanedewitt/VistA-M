PSJPDRTR ;BIR/JH-MAIN DRIVER PADE TRANSACTION REPORT  ;18 JUN 96 / 2:58 PM
 ;;5.0;INPATIENT MEDICATIONS;**317**;16 DEC 97;Build 130
 ;
 ; Reference to ^%DT is supported by DBIA 10003.
 ; Reference to CLEAR^VALM1 is supported by DBIA 10116.
 ; Reference to ^XLFDT is supported by DBIA 10103.
 ; Reference to ^DPT supported by DBIA 10035
 ; Reference to ^PSDRUG supported by DBIA 2192
 Q
 ;
EN ; Main Entry point
 N PSJSTOP,PSDRG,PSJINP,DTOUT,DUOUT
 S PSJSTOP=0
 F  Q:$G(PSJSTOP)<0  D ENLOOP
 Q
 ;
ENLOOP ; Prompt loop
 N PSJINP,ZTSK,DIR,DIC,ZTSK,PSJTSK
 K ^TMP($J,"PSJPTLST"),^TMP($J,"PSJPAT")
 S PSJSTOP=0
 D ASK(.PSJINP) G:PSJSTOP EXIT
 Q:$G(PSJINP("PSJDEV"))="Q"
START ; Queued entry
 N PSJSTOP,PSJDLRJ S PSJSTOP=0
 S PSJDLRJ=$J
 I $G(ZTSK) S (PSJDLRJ,PSJINP("PSJTSK"))=ZTSK
 K ^TMP($J,"PSJPDRTR"),^TMP($J,"TSCREEN")
 D PROCESS(.PSJINP) G:PSJSTOP EXIT
 D EN^PSJPDRTP(.PSJINP)
 I $G(PSJINP("PSJDELM"))="D" D
 .N DIR,X,Y S DIR(0)="EA"
 .S DIR("A",1)=""
 .S DIR("A",2)="The delimited report is complete."
 .S DIR("A")="Please turn logging off, then press return to continue."
 .D ^DIR
 Q
 ;
EXIT ; Clean up
 K ^TMP($J,"TSCREEN")
 K ^TMP($J,"PSJPDRTR")
 K ^TMP($J,"PSJPTLST")
 K ^TMP($J,"PSJPAT")
 Q
 ;
ASK(PSJINP) ;Prompt for selection criteria.  Quit if PSJSTOP is true
 N PSJCSUB,PSJSYS,PSJDEV,PSJDIV,PADEV,PSJSUMM,PSJDELIM,PSJDRG,PSDRG,PSJUSER,PSJTRANS,PSJOVR,PSJDONE,PSJSYSE,PSJPAT,PSJPSYSE,PSJTRX
 D CLEAR^VALM1 W !!
 S PSJSTOP=0
 W ?20,"PADE Transaction Report",!
 S PSJINP("PSJPSYS")=$$PSYS^PSJPDRIN() Q:PSJSTOP
 S PSJINP("PSJPSYSE")=$P($G(^PS(58.601,+$G(PSJINP("PSJPSYS")),0)),"^")
 D DIV^PSJPDRIP(.PSJDIV,.PSJSTOP) Q:PSJSTOP  M PSJINP("PSJDIV")=PSJDIV
 S PSJINP("PSJBDT")=$$DATE^PSJPDRUT("B",.PSJSTOP) Q:PSJSTOP
 S PSJINP("PSJEDT")=$$DATE^PSJPDRUT("E",.PSJSTOP,.PSJINP) Q:PSJSTOP
 D PADEV(.PADEV,.PSJINP) Q:PSJSTOP  M PSJINP("PADEV")=PADEV
 D PSJCSUB^PSJPDRIN(.PSJINP,.PSJCSUB) Q:PSJSTOP  M PSJINP("PSJCSUB")=PSJCSUB
 D DRUG(.PSDRG,.PSJINP) Q:PSJSTOP  M PSJINP("PSDRG")=PSDRG
 D PATIENT(.PSJINP,.PSJPAT) Q:PSJSTOP  M PSJINP("PSJPAT")=PSJPAT M ^TMP($J,"PSJPAT")=^TMP($J,"PSJPTLST","SELPAT") K ^TMP($J,"PSJPTLST")
 D TRANS(.PSJINP,.PSJTRANS,.PSJOVR) Q:PSJSTOP  M PSJINP("PSJTRANS")=PSJTRANS S PSJINP("PSJOVR")=$G(PSJOVR)
 D USER(.PSJINP,.PSJUSER) Q:PSJSTOP  M PSJINP("PSJUSER")=PSJUSER
 S PSJINP("PSJDELM")=$$DELIM^PSJPDRIN Q:PSJSTOP
 S PSJINP("PSJDEV")=$$SELDEV^PSJPDRIN("START^PSJPDRTR",.PSJINP,1,.PSJTSK) D  Q:PSJSTOP
 .I $G(PSJTSK) S PSJINP("PSJTSK")=PSJTSK M ^TMP(PSJTSK,"PSJPAT")=^TMP($J,"PSJPAT")
 .S:$G(DUOUT)!$G(DTOUT) PSJSTOP=1
 Q
 ;
PADEV(PADEV,PSJINP,PSJ58601) ; Get list of PADE device(s)
 N PADE,PSJI,PSJPSYS,BDT,EDT,PADEDT,PSJDONE,PADEX,PSJPSYSI,PADEVTMP
 S BDT=$G(PSJINP("PSJBDT")),EDT=$G(PSJINP("PSJEDT"))
 S PSJPSYS=$P($G(^PS(58.601,+$G(PSJINP("PSJPSYS")),0)),"^")
 S PSJPSYSI=$G(PSJINP("PSJPSYS"))
 D PADELST(.PSJINP,.PADE,.PADEX,$G(PSJ58601))
 ;
 I $D(PADE)<10 D  Q
 .S PSJSTOP=1
 .W !!,"PADE Dispensing Device: "
 .W !,"  No PADE dispensing device available for selection..",!
 .S DIR(0)="E" D ^DIR
 W ! D EN^DDIOL("  Enter '^ALL' to select all PADE dispensing devices.") W !
 S PSJPSYS=PSJPSYSI
 F  Q:$G(PSJDONE)!$G(PSJSTOP)  D SELPADE(.PADE,.PADEV,.PADEX,$G(PSJ58601))
 Q:$G(PSJSTOP)
 S PADE="" F  S PADE=$O(PADEV(PADE)) Q:PADE=""  D
 .N PADVALS S PADVALS(1)=PADE,PADVALS(2)=PSJPSYS
 .S PADEV(PADE)=$$FIND1^DIC(58.63,,"X",PADE)
 Q
 ;
PADELST(PSJINP,PADE,PADEX,PSJ58601) ; Find selectable PADE devices for PADE Inbound System PSJPSYS 
 ;                          and PADE transactions between PSJINP("PSJBDT") and PSJINP("EDT")
 ; INPUT: PSJINP("PSJPSYS")
 ;        PSJINP("PSJBDT")
 ;        PSJINP("PSJEDT")
 ; OUPUT: PADE(PADE NAME)=n
 ;        PADE(n)=PADE NAME
 ;
 N PSJDIV,PSJHTM,PSJDOTS,PSPDIEN,PADETMP,PADETMPX,II
 S PSJHTM=$P($H,",",2),PSJDOTS=""
 S BDT=$G(PSJINP("PSJBDT")),EDT=$G(PSJINP("PSJEDT"))
 S PSJPSYS=$P($G(^PS(58.601,+$G(PSJINP("PSJPSYS")),0)),"^")
 S PSJPSYSI=$G(PSJINP("PSJPSYS"))
 S PSJI=1
 I '$G(PSJ58601) S PADE="" F  S PADE=$O(^PS(58.6,"DEV",PSJPSYS,PADE)) Q:PADE=""  D
 .Q:$D(PADE(PADE))
 .S PADEDT=BDT F  S PADEDT=$O(^PS(58.6,"DEV",PSJPSYS,PADE,PADEDT)) Q:'PADEDT  D
 ..D DISPDOTS^PSJPDRUT(.PSJHTM,.PSJDOTS,1)
 ..Q:PADEDT>EDT
 ..D PADELST2(.PSJINP,.PADE,.PADEX)
 I $G(PSJ58601) S PSPDIEN=0 F  S PSPDIEN=$O(^PS(58.601,+PSJPSYSI,"DEVICE","B",PSPDIEN)) Q:'PSPDIEN  D
 .S PADE=$P($G(^PS(58.63,+PSPDIEN,0)),"^")
 .Q:PADE=""!'$$DEVSCRN^PSJPDRUT(.PSJINP,PSPDIEN)
 .D PADELST2(.PSJINP,.PADE,.PADEX)
 I $D(PADEX)>1 N PADETMP,PADETMPX M PADETMP=PADE,PADETMPX=PADEX K PADE,PADEX D
 .N PADNAME,PADIEN
 .S PADNAME="" F II=1:1 S PADNAME=$O(PADETMP(PADNAME)) Q:PADNAME=""  S PADE(PADNAME)=II,PADEX(II)=PADNAME
 Q
 ;
PADELST2(PSJINP,PADE,PADEX)  ; Continue building PADE device list
 Q:$D(PADE(PADE))
 N PADIEN,PADESTAT,PSJPSYS
 S PSJPSYS=PSJPSYSI
 S PADIEN=$$FIND1^DIC(58.63,,"O",PADE) I PADIEN S PADESTAT=$P($G(^PS(58.63,+PADIEN,0)),"^",4),PADESTAT=$S(PADESTAT="I":" (INACTIVE)",1:"")
 K PSJDIV D GETS^DIQ(58.63,PADIEN,"2","I","PSJDIV")
 S PSJDIV=+$G(PSJDIV("58.63",PADIEN_",",2,"I"))
 Q:'$D(PSJINP("PSJDIV",PSJDIV))
 S PADE(PADE)=PSJI
 S PADEX(PSJI)=PADE_"^"_$G(PADESTAT),PSJI=PSJI+1
 Q
 ;
SELPADE(PADE,PADEV,PADEX,PS58601) ; Prompt for one PADE device (or ALL)
 N DIR,X,Y,DEVNAME,PSJY,PSJLSTA,PSFOUND,PADEUP,NOXREF
 N PSJPART,II,PSELMSG,PLSTMSG,PADXDATA,PSALLPC
 S PLSTMSG(1)="Transactions matching the entered Date Range and Division "
 S PLSTMSG(2)="exist for the PADE Dispensing devices listed below."
 S DIR(0)="FAO^1:30",DIR("?")="^D LIST^PSJPDRTR(.PADEX,.PLSTMSG,15,.PSJLSTA)"
 S DIR("A")="Select PADE Dispensing Device: "_$S($D(PADEV)>1:"",1:" ^ALL// ")
 D ^DIR
 I X="",($D(PADEV)<10) S Y="ALL"
 I $E(X)="^" S Y=$$XALL^PSJPDRIP(X)
 I $G(DUOUT)!$G(DTOUT) S PSJSTOP=1 Q
 I Y="ALL" M PADEV=PADE S PADEV="ALL",PSJDONE=1 Q
 I Y="" D  Q
 .I $D(PADEV)>1 S PSJDONE=1 Q
 .W !!?2,"Select a single Item, several Items or enter ^ALL to select all Items."
 S PSJY=Y
 D PADEUP^PSJPDRUT(.PADE,.PADEUP)
 I $D(PADE(PSJY))&$$UNIQUE^PSJPDRUT(PSJY,.PADE) D  Q
 .W "  ",PSJY,$P($G(PADEX(PADE(PSJY))),"^",2) S PADEV(PSJY)=""
 I $D(PADEUP($$UPPER^HLFNC(PSJY)))&$$UNIQUE^PSJPDRUT($$UPPER^HLFNC(PSJY),.PADE) D  Q:($P($G(PADXDATA),"^")]"")
 .S PADXDATA=$G(PADEX(PADEUP($$UPPER^HLFNC(PSJY))))
 .W "  ",$P(PADXDATA,"^"),$P(PADXDATA,"^",2) I $P(PADXDATA,"^")]"" S PADEV($P(PADXDATA,"^"))=""
 ; If "?" list executed, check integers in PADEX list
 I $G(PSJLSTA) I $D(PADEX(PSJY)) D  Q
 .N PADENAME S PADENAME=$P($G(PADEX(PSJY)),"^") I PADENAME="" W "  ???" Q   ; Null cabinet/device name? (impossible?!?!)
 .W "   ",$P($G(PADEX(PSJY)),"^") S PADEV(PADENAME)=""
 S PSELMSG="Select a PADE device"
 S NOXREF=1,PSALLPC=1  ; don't use cross refs, return all data from partial lookup
 D PARTIAL^PSJPADPT(PSJY,.PADE,.PADEV,,PSELMSG,.PADEX,.PSFOUND,NOXREF,PSALLPC)
 Q:$G(PSFOUND)
 W "  ?? (No match found)"
 Q
 ;
SELCSUB(PSJCSUB) ; Prompt for one controlled subs schedule or (ALL)
 N X,Y,SCHED,SCHLST,SCNT,I,PSJPAD,PSJTMP
 S $P(PSJPAD," ",80)=""
 W ! D EN^DDIOL("  Enter '^ALL' to select all Controlled substance schedules.") W !
 S SCHLST="1:Schedule I;2:Schedule II;2n:Schedule II Non-Narcotics;3:Schedule III;3n:Schedule III Non-Narcotics;4:Schedule IV;5:Schedule V;ALL:All CS Schedules"
 F I=1:1:$L(SCHLST,";") S PSJTMP=$L($P($P(SCHLST,";",I),":")) D
 .S DIR("A",I)=$E(PSJPAD,1,12-PSJTMP)_$P($P(SCHLST,";",I),":",1)_$E(PSJPAD,1,6)_$P($P(SCHLST,";",I),":",2)
 S DIR(0)="SAO^"_SCHLST
 S DIR("A")="Select CS Schedule: "_$S($D(PSJCSUB)<10:"^ALL//",1:"")
 D ^DIR I X="",$D(PSJCSUB)<10 S Y="ALL"
 I $E(X)="^" S Y=$$XALL^PSJPDRIP(X)
 S SCHED=Y
 I $G(DUOUT)!$G(DTOUT) S PSJSTOP=1 Q
 I SCHED="ALL" D ALLSCHED^PSJPDRIP(.PSJCSUB,SCHLST) S PSJCSUB="CS (ALL)",PSJDONE=1 Q
 I SCHED="" D  Q
 .I $D(PSJCSUB)>1 S PSJDONE=1 Q
 .W " Select a CS Schedule"
 S PSJCSUB(SCHED)=""
 Q
 ;
DRUG(DRUG,PSJINP) ; Allow user to select appropriate subset of drug items
 N PSDONE,DIC,X,Y,GETDRG,LSTCNT,DRGARAY,PSJPSYS,PADEV,PSJDRC
 M PADEV=PSJINP("PADEV")
 D DRCAB(.PSJINP,.PSJDRC)         ; Get drugs linked to cabinet(s)
 D DRUGSEL^PSJPDRTR(.PSJINP,.PSJDRC,.DRUG,,.PSJSTOP)  ; Prompt fo drug item, allow drugs not on file
 Q
 ;
DRCAB(PSJINP,PSJDRCAB) ; Return list of drugs in each cabinet in PSJINP("PADEV")
 ;   Input = PSJINP("PADEV",CABINET NAME) - Cabinet IEN points to PADE DISPENSING DEVICE file 58.63
 ;  Output = PSJDRCAB(DRUG IEN)          - Drug IEN points to DRUG file 50
 K PSJDRCAB
 N CAB,CABDA,PSJPSYS,DRGDA,DRG,DRGDT,BDT,EDT,PSJPSYSE,PSDRGIEN,PSJHTM,PSJDOTS
 S PSJHTM=$P($H,",",2),PSJDOTS=""
 S PSJPSYS=$G(PSJINP("PSJPSYS"))
 S PSJPSYSE=$G(PSJINP("PSJPSYSE"))
 I PSJPSYSE="" S PSJPSYSE=$P($G(^PS(58.601,+PSJPSYS,0)),"^"),PSJINP("PSJPSYSE")=PSJPSYSE
 S BDT=$G(PSJINP("PSJBDT")),EDT=$G(PSJINP("PSJEDT"))
 M CAB=PSJINP("PADEV")
 S CAB="" F  S CAB=$O(CAB(CAB)) Q:CAB=""  D
 .S DRG=0 F  S DRG=$O(^PS(58.6,"DEVD",PSJPSYSE,CAB,DRG)) Q:'DRG  D
 ..D DISPDOTS^PSJPDRUT(.PSJHTM,.PSJDOTS,1)
 ..Q:$D(PSJDRCAB(DRG))
 ..I '($G(PSJINP("PSJCSUB"))="ALL") Q:'$D(PSJINP("PSJCSUB",$$GETCLASS^PSJPDRIN(DRG)))
 ..S DRGDT=$O(^PS(58.6,"DEVD",PSJPSYSE,CAB,DRG,BDT))
 ..Q:'DRGDT!(DRGDT>EDT)
 ..S PSJDRCAB(DRG)=$P($G(^PSDRUG(+DRG,0)),"^")
 S CAB="" F  S CAB=$O(CAB(CAB)) Q:CAB=""  D
 .S DRG=0 F  S DRG=$O(^PS(58.6,"MDRG",PSJPSYSE,CAB,DRG)) Q:DRG=""  D
 ..Q:$D(PSJDRCAB("*"_+DRG))
 ..S DRGDT=$O(^PS(58.6,"MDRG",PSJPSYSE,CAB,DRG,BDT))
 ..Q:'DRGDT!(DRGDT>EDT)
 ..N PSTRANS,PSALTID
 ..S PSTRANS=+$O(^PS(58.6,"MDRG",PSJPSYSE,CAB,DRG,DRGDT,""))
 ..Q:'PSTRANS
 ..S PSDRGIEN=$P($G(^PS(58.6,+PSTRANS,0)),"^",3)
 ..Q:PSDRGIEN
 ..S PSALTID=$P($G(^PS(58.6,+PSTRANS,1)),"^",7)
 ..S PSJDRCAB("*"_DRG)=$G(PSALTID)
 Q
 ;
DRUGSEL(PSJINP,INDRUG,OUTDRUG,DRWPCK,PSJSTOP) ; Select drug(s)
 N COUNT,PSJCNT,DIR,X,Y,PSJDONE,DRGLIST,DRGNAME,PSJY,DRGN,PSJTMP,SELDRG,PSFOUND,PSALLPC
 K DRWPCK
 M DRGLIST=INDRUG
 S COUNT=0,PSJDONE=0,OUTDRUG=""
 D DRUGLIST^PSJPDRIN(.PSJINP,.DRGLIST)
 I $D(DRGLIST)<10 D  Q
 .S PSJSTOP=1
 .W !!,"Drug Item: "
 .W !,"  No Drug Items available for selection..",!
 .S DIR(0)="E" D ^DIR
 I '$G(PSJINP("MANUNLOD")) W ! D EN^DDIOL("  Enter '^ALL' to select all available drug items") W !
 F  Q:$G(DUOUT)!$G(DTOUT)!$G(PSJDONE)!$G(PSJSTOP)  D
 .N PSJPART,II
 .N DIR,X,Y,DUOUT
 .S DIR(0)="FOA",DIR("A")="Select Drug Item: "_$S($D(OUTDRUG)>1:"",$G(PSJINP("MANUNLOD")):"",1:"^ALL// ")
 .S DIR("?")="^D LIST^PSJPDRTR(.INDRUG,,15)"
 .D ^DIR I X=""&($D(OUTDRUG)<10)&'$G(PSJINP("MANUNLOD")) S Y="ALL"
 .I $E(X)="^" S Y=$$XALL^PSJPDRIP(X)
 .I $G(DUOUT)!$G(DTOUT) S PSJSTOP=1 Q
 .I Y="" D  Q
 ..I $D(OUTDRUG)>1!$G(PSJINP("MANUNLOD")) S PSJDONE=1 Q
 ..W !!?2,"Select a single Item, several Items or enter ^ALL to select all Items."
 .S PSJY=Y
 .I PSJY="ALL" S OUTDRUG="ALL",PSJDONE=1 D  Q
 ..I $G(PSJINP("MANUNLOD")) S DRWPCK="ALL" Q
 ..N DRGIEN S DRGIEN=0 F  S DRGIEN=$O(INDRUG(DRGIEN)) Q:DRGIEN=""  D
 ...S OUTDRUG(DRGIEN)=$S(DRGIEN["*":$P(DRGIEN,"*",2),1:$P($G(^PSDRUG(+DRGIEN,0)),"^"))
 .I $D(DRGLIST("IEN",+PSJY)) D  Q
 ..W "  ",DRGLIST("IEN",+PSJY)
 ..S OUTDRUG(+PSJY)=$P($G(^PSDRUG(+PSJY,0)),"^")
 ..I $G(PSJINP("MANUNLOD")) D POCKET^PSJPDRIN(.PSJINP,+PSJY,.DRWPCK) S PSJDONE=1
 .S PSALLPC=0  ; don't return all data pieces from partial lookup
 .D PARTIAL^PSJPADPT(.PSJY,.DRGLIST,.SELDRG,1,,,.PSFOUND,,PSALLPC)
 .M OUTDRUG=SELDRG
 .I $G(PSJINP("MANUNLOD")) D  Q
 ..S PSJY=$O(SELDRG(0))
 ..I $G(PSJY) D POCKET^PSJPDRIN(.PSJINP,+PSJY,.DRWPCK) S PSJDONE=1 Q
 ..W "  ??"
 .I '$G(PSFOUND) W "  ?? (No match found)" S PSJDONE=0
 Q
 ;
PATIENT(PSJINP,SELPAT) ; Get list of patients
 D PATIENT^PSJPDRU1(.PSJINP)
 Q
 ;
USER(PSJINP,PSJUSER) ; Get Vista Users (e.g., nurses) involved in PADE transactions
 N PSJDONE,USER,USERX,SELUSER K PSJUSER
 D USERLIST^PSJPDRUT(.PSJINP,.USER,.USERX)
 ;
 F  Q:$G(PSJDONE)!$G(PSJSTOP)  D
 .D SELUSER^PSJPDRUT(.PSJINP,.USER,.SELUSER,.USERX,.PSJSTOP)
 S PSJUSER=$G(SELUSER)
 S USER="" F  S USER=$O(SELUSER(USER)) Q:USER=""  D
 .S PSJUSER(USER)=SELUSER(USER)
 Q
 ;
TRANS(PSJINP,PSJTRANS,PSJOVR) ; Get Transaction Types of PADE transactions
 N PSJDONE K PSJTRANS,PSJOVR,PSJTRX
 F  Q:$G(PSJSTOP)!$G(PSJDONE)  D SELTRANS(.PSJTRANS,.PSJTRX)
 Q:$G(PSJSTOP)
 ; Prompt for override only if a Vend (PSJTRANS(1)) or Return (PSJTRANS(7)) was selected
 I $D(PSJTRX("Dispense"))!$D(PSJTRX("Return"))!$D(PSJTRX("Waste")) S PSJOVR=$$OVRTRAN()
 Q
 ;
OVRTRAN() ; Prompt if only override transactions - only prompt if DISPENSE/VEND type was selected
 N DIR
 S DIR(0)="YA",DIR("B")="N"
 S DIR("A")="Select Override Transaction only? "
 S DIR("?",1)="  Select 'Y' to display transactions where the user"
 S DIR("?",2)="  dispensed an item without an order. Otherwise ALL"
 S DIR("?")="  entries will be displayed."
 D ^DIR I $G(DUOUT)!$G(DTOUT) S PSJSTOP=1 Q ""
 Q Y
 ;
SELTRANS(TRANS,TRANSX) ; Prompt for one transaction type (or ALL)
 N DIR
 W ! D EN^DDIOL("  Enter '^ALL' to select all Transaction Types.") W !
 ;
 D TRANLIST(.PSJINP,.DIR)
 D ^DIR I X="",$D(TRANS)<10 S Y="ALL"
 I $E(X)["^" S Y=$$XALL^PSJPDRIP(X)
 I $G(DTOUT)!$G(DUOUT) S PSJSTOP=1 Q
 I Y="",$D(TRANS)>1 S PSJDONE=1 Q
 I Y="ALL" S PSJDONE=1 D  Q
 .N PADLIST,CNT,TXPIECE
 .S PADLIST=$P(DIR(0),"^",2)
 .F CNT=1:1:$L(PADLIST,";") S TXPIECE=$P(PADLIST,";",CNT) S TRANS($P(TXPIECE,":"))=$P(TXPIECE,":",2),TRANSX($P(TXPIECE,":",2))=$P(TXPIECE,":")
 .S TRANS="ALL"
 I Y>0 D
 .N PADLIST,CNT,TXPIECE
 .S PADLIST=$P(DIR(0),"^",2)
 .F CNT=1:1:$L(PADLIST,";") S TXPIECE=$P(PADLIST,";",CNT) I +TXPIECE=+Y S TRANS($P(TXPIECE,":"))=$P(TXPIECE,":",2),TRANSX($P(TXPIECE,":",2))=$P(TXPIECE,":")
 Q
 ;
LIST(NLIST,MSG,MAX,AUDIT) ; Write list in LIST(ID1)=ID1
 N II,NAME,NUMBER,TAB,NAME,ID1,ID2,PSCNT,DUOUT,DTOUT,DIR,X,Y,LIST,LISTX
 K AUDIT S AUDIT=1  ; Return evidence this was called
 S $P(TAB," ",80)=""
 S PSCNT=0
 Q:$D(NLIST)<10
 I $L($G(MSG)) W !,MSG,!
 I $D(MSG)>1 D  W !
 .S II=0 F  S II=$O(MSG(II)) Q:'II  W !,MSG(II)
 S ID2="" F  S ID2=$O(NLIST(ID2)) Q:ID2=""  S NAME=$G(NLIST(ID2)) S:NAME="" NAME="UNKNOWN" D
 .S LIST($P(NAME,"^")_"^"_ID2)=$P(NAME,"^",2),LISTX(ID2)=$P(NAME,"^")_"^"_ID2
 S II="" F  S II=$O(LISTX(II)) Q:II=""!$G(DTOUT)!$G(DUOUT)  D
 .S ID1=LISTX(II)
 .N PSJMARG
 .S PSJMARG=" "
 .S PSJMARG=$S($E(ID1)="*":$E(TAB,1,17),$E(II)="*":$E(TAB,1,17),1:$E(TAB,1,12-$L($P(ID1,"^",2))))
 .W !,"   "_$P(ID1,"^",2)_PSJMARG_$P(ID1,"^")_" "_$P(LIST(ID1),"^")
 .S PSCNT=$G(PSCNT)+1
 .I $G(MAX),(PSCNT>$G(MAX)) W !! S DIR(0)="E" D ^DIR S PSCNT=0 W !!
 Q
 ;
PROCESS(PSJINP) ; Gather report data, store in ^TMP
 N PSJBDT,PSJSCR,TSCREEN
 S PSJBDT=$G(PSJINP("PSJBDT"))
 S PSJSCR="I $$TSCREEN^PSJPDRTP(Y,.PSJINP)"
 D LIST^DIC(58.6,,"@;2;1;23;10;.01I;4;15;12;3;16;14I;6.1;6.2;7.1;7.2;21;25;18;19;1.2;11;13","P",,PSJBDT,,"B",PSJSCR,,"^TMP($J,""TSCREEN"")")
 D PROCSUM^PSJPDRTP(.PSJINP) Q
 K ^TMP(PSJDLRJ,"TSCREEN")
 Q
 ;
DIVSTR(PSJINP)  ; Return Divisions in PSJINP("PSJDIV") in string
 N DIVSTR,DIV,II,DIVNAM
 S DIVSTR=""
 I PSJINP("PSJDIV")="ALL" Q "ALL"
 ;
 S DIV="" F II=0:1 S DIV=$O(PSJINP("PSJDIV",DIV)) Q:DIV=""  D
 .S DIVNAM=$P($G(^DG(40.8,+DIV,0)),"^")
 .S DIVSTR=DIVSTR_$S(II:",",1:"")_DIVNAM
 Q DIVSTR
 ;
TRANLIST(PSJINP,DIR)  ; Set selectable transactions into DIR based on patient selection
 N PATFLG,PADLIST,CNT,TXPIECE,LAST,PSJPSYS,PSJBDT,PSJEDT
 S PATFLG=0
 S PSJPSYS=+$G(PSJINP("PSJPSYS")),PSJBDT=+$G(PSJINP("PSJBDT")),PSJEDT=+$G(PSJINP("PSJEDT"))
 ; Filter to include ONLY transactions that have received from this vendor during this date range
 S DIR(0)="SOA^"_$$TTYPDIR^PSJPDRUT(PSJPSYS,PSJBDT,PSJEDT)
 I '$P(DIR(0),"^",2) D  Q
 .K DIR S DIR("A")="No recognized Transaction types have been received for this vendor system."
 .S PSJSTOP=-1
 S DIR("A")="Select Transaction Type: "_$S($D(TRANS)>1:"",1:"^ALL//")
 S DIR("A",1)="Select one of the following transaction types:"
 S PADLIST=$P(DIR(0),"^",2)
 F CNT=1:1:$L(PADLIST,";") S TXPIECE=$P(PADLIST,";",CNT) D
 .S DIR("A",CNT+1)="    "_$P(TXPIECE,":")_"  "_$P(TXPIECE,":",2)
 S LAST=$O(DIR("A",999999),-1)
 S DIR("A",LAST+1)=" or ^ALL for all Transactions."
 Q
