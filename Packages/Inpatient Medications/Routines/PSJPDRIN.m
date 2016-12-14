PSJPDRIN ;BIR/MV-MAIN DRIVER PADE INVENTORY REPORT  ;11/15/2015
 ;;5.0;INPATIENT MEDICATIONS;**317**;16 DEC 97;Build 130
 ;
 ; Reference to ^PS(50.7 is supported by DBIA 2180.
 ; Reference to DATA^PSN50P68 is supported by DBIA 4545.
 ; Reference to DIC^PSSDI is supported by DBIA 4551.
 ; Reference to ^%ZTLOAD is supported by DBIA 10063.
 ; Reference to CLEAR^VALM1 is supported by DBIA 10116.
 ; Reference to EN^DDIOL is supported by DBIA 10142.
 ; Reference to ^%ZIS is supported by DBIA 10086.
 ;
 Q
 ;
EN ; Main Entry point
 N PSJSTOP,PSDRG,PSJINP,DTOUT,DUOUT,DA,DIC,DR,DIR
 S PSJSTOP=0
 F  Q:$G(PSJSTOP)<0  D ENLOOP
 Q
 ;
ENLOOP ; Prompt loop
 N PSJINP,ZTSK,ZTDESC,ZTRTN,ZTSAVE
 S PSJSTOP=0
 D ASK(.PSJINP) G:PSJSTOP EXIT
 Q:$G(PSJINP("PSJDEV"))="Q"
START ; Queued entry
 N PSJSTOP S PSJSTOP=0
 K ^TMP("PSJPDRIN",$J)
 D PROCESS(.PSJINP) G:PSJSTOP EXIT
 D EN^PSJPDRIP(.PSJINP)
 I $G(PSJINP("PSJDELM"))="D" D
 .N DIR,X,Y S DIR(0)="EA"
 .S DIR("A",1)=""
 .S DIR("A",2)="The delimited report is complete."
 .S DIR("A")="Please turn logging off, then press return to continue."
 .D ^DIR
 Q
 ;
EXIT ; Clean up
 K ^TMP("PSJPDRIN",$J),ZTSK
 Q
 ;
ASK(PSJINP) ;Prompt for selection criteria.  Quit when PSJSTOP is true
 ;
 N PSJCSUB,PSJSYS,PSJDEV,PSJDIV,PADEV,PSJSUMM,PSJDELIM,PSJDRG,PSDRG
 D CLEAR^VALM1 W !!
 S PSJSTOP=0
 W ?20,"PADE On-Hand Inventory Report",!
 S PSJINP("PSJPSYS")=$$PSYS Q:PSJSTOP
 D DIV^PSJPDRIP(.PSJDIV,.PSJSTOP) Q:PSJSTOP  M PSJINP("PSJDIV")=PSJDIV
 D PADEV(.PADEV,.PSJINP) Q:PSJSTOP  M PSJINP("PADEV")=PADEV
 D PSJCSUB(.PSJINP,.PSJCSUB) Q:PSJSTOP  M PSJINP("PSJCSUB")=PSJCSUB
 D DRUG(.PSDRG,.PSJINP) Q:PSJSTOP  M PSJINP("PSDRG")=PSDRG
 S PSJINP("PSJSUM")=$$SUMM Q:PSJSTOP
 S PSJINP("PSJDELM")=$$DELIM Q:PSJSTOP
 S PSJINP("PSJDEV")=$$SELDEV(,.PSJINP) S:$G(DUOUT)!$G(DTOUT) PSJSTOP=1 Q:PSJSTOP
 Q
 ;
PSYS() ; Get PADE Inventory System
 N PSYS
 S PSYS=$$PSYS^PSJPDRUT()
 Q PSYS
 ;
DIV() ; Get Division
 N PSDIV,DIC,X,Y
 S DIC("S")="I $D(^PS(58.63,""D"",+Y))"
 S DIC=40.8,DIC(0)="QAE",DIC("A")="Select Division: " D ^DIC
 S PSDIV=$S(Y>0:+Y,1:"")
 I $G(DUOUT)!$G(DTOUT)!(PSDIV="") S PSJSTOP=1
 Q PSDIV
 ;
PADEV(PADEV,PSJINP) ; Get PADE dispensing device(s), screen for Division and PADE Inventory System
 ;Requires PSJINP("PSJDIV"),PSJINP("PSJPSYS")
 N PADNAM,PADIEN,PADTMP
 D PADEV^PSJPDRTR(.PADEV,.PSJINP,1)
 Q:($D(PADEV)<10)
 M PADTMP=PADEV
 K PADEV
 S PADNAM=0 F  S PADNAM=$O(PADTMP(PADNAM)) Q:PADNAM=""  D
 .Q:'$G(PADTMP(PADNAM))
 .S PADEV(PADTMP(PADNAM))=PADNAM
 Q
 ;
CAB(PSJINP,PADEV) ; Get PADE (cabinets) 
 N PSCAB,DIC,X,Y,PSJDIV,PSJPSYS,PSJSCR,PSCABHLP,PSJX
 S PSJDIV=$G(PSJINP("PSJDIV"))
 S PSJPSYS=$G(PSJINP("PSJPSYS"))
 S PSCABHLP="Select one or more PADE Dispensing Devices, or enter '^ALL' to select all."
 S DIC("S")="I ($D(PSJINP(""PSJDIV"",+$G(^PS(58.63,+Y,2)))))&('$$EMPTY^PSJPADPT(+Y))"
 S DIC=58.63,DIC(0)="QABE",DIC("A")="Select PADE Dispensing Device: "_$S($D(PADEV)<10:"^ALL// ",1:"")
 S DIC("W")="N PSJPADST S PSJPADST=$P($G(^PS(58.63,+$G(Y),0)),""^"",4),PSJPADST=$S(PSJPADST=""I"":"" (INACTIVE)"",1:"""") W PSJPADST"
 D ^DIC S PSJX=X
 S:$E(PSJX)="^" Y=$$XALL^PSJPDRIP(PSJX)
 I X="",$D(PADEV)<10 S Y="ALL"
 S:Y=-1 Y=""
 S PSCAB=Y
 S:($G(DUOUT)&(PSCAB'="ALL"))!$G(DTOUT) PSJSTOP=1
 Q PSCAB
 ;
PSJCSUB(PSJINP,PSJCSUB) ; Get Controlled Subs (CS) Schedules
 N DIR,X,Y,PSJDONE,SCHED,SCHLST
 K PSJCSUB
 W ! D EN^DDIOL("  Enter '^ALL' to select all Controlled substance")
 D EN^DDIOL("   schedules and all non-controlled substances.") W !
 S DIR("A")="Enter (C)S or (N)on-CS: ^ALL//",DIR(0)="SAO^C:Controlled Substances;N:Non-Controlled Substances;ALL:All CS Schedules and Non-CS"
 D ^DIR S:X="" Y="ALL"
 I $E(X)="^" S Y=$$XALL^PSJPDRIP(X)
 S PSJCSUB=Y
 I PSJCSUB'="ALL"&($G(DUOUT)!$G(DTOUT)!(Y="")) S PSJSTOP=1 Q
 S:PSJCSUB="N"!(PSJCSUB="ALL") PSJCSUB(0)="Unscheduled"
 Q:PSJCSUB="N"
 ; If YES to Controlled Subs, get CS Schedule
 S SCHLST="1:Schedule I;2:Schedule II;2n:Schedule II Non-Narcotics;3:Schedule III;3n:Schedule III Non-Narcotics;4:Schedule IV;5:Schedule V"
 I PSJCSUB="ALL" D ALLSCHED^PSJPDRIP(.PSJCSUB,SCHLST) S PSJCSUB="ALL" Q
 K PSJDONE,PSJCSUB
 N DIR,X,Y,SCNT
 F  Q:$G(PSJSTOP)!$G(PSJDONE)  D SELCSUB^PSJPDRTR(.PSJCSUB)
 Q
 ;
DRUG(DRUG,PSJINP) ; Allow user to select appropriate subset of drug items
 N PSDONE,DIC,X,Y,GETDRG,LSTCNT,PSJCSUB,DRGARAY,PSJPSYS,PADEV,PSJDRC
 S PSJCSUB=$G(PSJINP("PSJCSUB"))
 S PSJPSYS=$G(PSJINP("PSJPSYS"))
 M PADEV=PSJINP("PADEV")
 D DRCAB(.PSJINP,.PSJDRC)         ; Get drugs linked to cabinet(s)
 D DRUGSEL^PSJPDRTR(.PSJINP,.PSJDRC,.DRUG,,.PSJSTOP) ; Prompt for drug items
 Q
 ;
SUMM() ; Prompt user for Detailed or Summary report
 N SUMM,DIR,X,Y
 S DIR(0)="S^D:Detailed Report;S:Summary Report"
 S DIR("A")="Select (D)etail or (S)ummary Report "
 S DIR("B")="S",DIR("?")="You may select 'D'  for a detailed report or 'S' for a Summary report."
 D ^DIR S:$G(DUOUT)!$G(DTOUT) PSJSTOP=1
 Q Y
 ;
DELIM() ; Prompt user for delimited output or formatted report.
 N DELIM,DIR,X,Y
 S DIR(0)="S^R:Report;D:Delimited Output"
 S DIR("A")="Select (R)eport or (D)elimited output "
 S DIR("B")="R",DIR("?")="You may select 'R' for a report or 'D' for CSV delimited output (for spreadsheet)"
 D ^DIR S:$G(DUOUT)!$G(DTOUT) PSJSTOP=1
 S DELIM=Y
 Q DELIM
 ;
GETCLASS(DRGIEN) ; Get Controlled Substance Federal Schedule from VA PRODUCT FILE for DRUG FILE (#50) entry DRGIEN
 ;  Input :  pointer to DRUG (#50) file
 ; Output : Value from CS FEDERAL SCHEDULE field (#19) in VA PRODUCT (#50.68) file
 N PSJDPROD,PSJCLASS,PSJNDF
 Q:'$G(DRGIEN) "-1"
 K ^TMP($J,"PSJCLASS")
 S PSJNDF=$P($G(^PSDRUG(+DRGIEN,"ND")),"^",3) I '$G(PSJNDF) Q 0
 D DATA^PSN50P68(PSJNDF,,"PSJCLASS")
 S PSJCLASS=+$G(^TMP($J,"PSJCLASS",+PSJNDF,19))
 S PSJCLASS=$S(PSJCLASS]"":PSJCLASS,1:0)
 K ^TMP($J,"PSJCLASS")
 Q PSJCLASS
 ;
LISTDRG(SCREEN,DRGARAY) ; Get list of drugs from drug file screened by SCREEN, outpat DRGARAY
 K DRGARAY
 N DIC,X,Y
 D LIST^DIC(50,,,"P",,,,,SCREEN,,"DRGARAY")
 Q
 ;
PROCESS(PSJINP) ; Gather report data, store in ^TMP
 I PSJINP("PSJSUM")="S" D PROCSUM(.PSJINP) Q
 I PSJINP("PSJSUM")'="S" D PROCDET(.PSJINP)
 Q
 ;
PROCSUM(PSJINP) ; Gather SUMMARY report data
 N PSJCAB,PSJDRG,CC,LNCNT,TABMAR,PSJPSYS,PSJCABNM,PSJQTY,PSJDFORM,PSJII,PSJOI,PSJDFIEN,PSJCABST,PSJDRGX,PSJDNAM
 S PSJINP("PSPGTOT")=1,LNCNT=1
 S $P(TABMAR," ",40)=" "
 S PSJPSYS=+PSJINP("PSJPSYS")
 M PSJCAB=PSJINP("PADEV")
 M PSJDRG=PSJINP("PSDRG")
 S PSJCAB=0 F CC=0:1 S PSJCAB=$O(PSJCAB(PSJCAB)) Q:'PSJCAB  D
 .S PSJCABNM=$P($G(^PS(58.63,PSJCAB,0)),"^"),PSJCABST=$P($G(^PS(58.63,PSJCAB,0)),"^",4),PSJCABST=$S(PSJCABST="I":"(I)",1:"")
 .N PSJDRGX D ALPHADRG(PSJPSYS,PSJCAB,.PSJDRG,.PSJDRGX)
 .I PSJINP("PSJDELM")="R" D
 ..Q:'$D(PSJDRGX)
 ..I $G(CC) S ^TMP("PSJPDRIN",$J,LNCNT)="^",LNCNT=LNCNT+1
 ..S ^TMP("PSJPDRIN",$J,LNCNT)=PSJCABNM_PSJCABST,LNCNT=LNCNT+1
 .S PSJDNAM="" F PSJII=1:1 S PSJDNAM=$O(PSJDRGX(PSJDNAM)) Q:PSJDNAM=""  S PSJDRG=0 S PSJDRG=$O(PSJDRGX(PSJDNAM,PSJDRG)) Q:'PSJDRG  D
 ..S PSJCABNM=$S(PSJINP("PSJDELM")="D":PSJCABNM,1:"")
 ..S PSJQTY=$$QTY(PSJPSYS,PSJCAB,PSJDRG)
 ..S PSJOI=+$G(^PSDRUG(PSJDRG,2))
 ..S PSJDFORM=$E($$DFORM(PSJPSYS,PSJCAB,PSJDRG),1,11)
 ..I PSJDFORM="" S PSJDFIEN=$P($G(^PS(50.7,PSJOI,0)),"^",2) I PSJDFIEN D
 ...N X,Y,DIC
 ...S DIC(0)="XN",DIC="^PS(50.606,",X=+PSJDFIEN
 ...D DIC^PSSDI(50.606,"PSJ",.DIC,.X)
 ...S PSJDFORM=$P($G(Y),"^",2)
 ..S ^TMP("PSJPDRIN",$J,LNCNT)=PSJCABNM_"^"_PSJDNAM_" ("_PSJDRG_")"_"^"_PSJDFORM_"^"_$S(PSJINP("PSJDELM")="R":$J(PSJQTY,4),1:PSJQTY),LNCNT=LNCNT+1
 Q
 ;
PROCDET(PSJINP) ; Gather DETAIL report data
 N PSJCAB,PSJDRG,CC,LNCNT,TABMAR,PSJPSYS,PSJCABNM,DRGTOT,QTY,PSJDFORM,PSJOI,PSJII,QTY,PSJCOL,PCKNAM
 N PSJDFIEN,PSJDRNAM,PSJDRIEN,DRCNTOT
 S PSJINP("PSPGTOT")=1,LNCNT=1
 S $P(TABMAR," ",40)=" "
 S PSJPSYS=+PSJINP("PSJPSYS")
 M PSJCAB=PSJINP("PADEV")
 M PSJDRG=PSJINP("PSDRG")
 D SETCOLS^PSJPDRIP(.PSJINP,.PSJCOL)
 S PSJDRIEN=0 F  S PSJDRIEN=$O(PSJDRG(PSJDRIEN)) Q:'PSJDRIEN  S PSJDRNAM=$P(PSJDRG(PSJDRIEN),"^") D
 .S PSJDRNAM(PSJDRNAM_"^"_PSJDRIEN)=""
 S PSJDRNAM="" F  S PSJDRNAM=$O(PSJDRNAM(PSJDRNAM)) Q:PSJDRNAM=""  D
 .S PSJDRG=$P(PSJDRNAM,"^",2)
 .N DRWPCK,PSBFLAG
 .S:PSJINP("PSJDELM")="R" ^TMP("PSJPDRIN",$J,LNCNT)=" ^ ",LNCNT=LNCNT+1
 .S DRGTOT=0,DRCNTOT=0
 .S PSBFLAG=0     ; If a Patient Specific Bin is included in the list, set flag
 .S PSJCAB=0 F  S PSJCAB=$O(PSJCAB(PSJCAB)) Q:'PSJCAB  I $D(^PS(58.601,"DEV",PSJCAB,PSJDRG)) D
 ..N PSDRGLEN,PSJCABST,DRWPCK
 ..S PSJCABST=$P($G(^PS(58.63,PSJCAB,0)),"^",4),PSJCABST=$S(PSJCABST="I":"(I)",1:"")
 ..S PSJCABNM=$P($G(^PS(58.63,PSJCAB,0)),"^")_PSJCABST
 ..S PSJQTY=$$QTY(PSJPSYS,PSJCAB,PSJDRG)
 ..S DRGTOT=$G(DRGTOT)+PSJQTY
 ..S PSJOI=+$G(^PSDRUG(PSJDRG,2))
 ..S PSJDFIEN=$P($G(^PS(50.7,PSJOI,0)),"^",2)
 ..S PSJDFORM=$$DFORM(PSJPSYS,PSJCAB,PSJDRG)
 ..I PSJDFORM="" S PSJDFIEN=$P($G(^PS(50.7,PSJOI,0)),"^",2) I PSJDFIEN D
 ...N X,Y,DIC
 ...S DIC(0)="XN",DIC="^PS(50.606,",X=+PSJDFIEN
 ...D DIC^PSSDI(50.606,"PSJ",.DIC,.X)
 ...S PSJDFORM=$P($G(Y),"^",2)
 ..D POCKDRG^PSJPDRIP(PSJPSYS,PSJCAB,PSJDRG,.DRWPCK)
 ..N CC D  Q
 ...S PCKNAM="" F CC=1:1 S PCKNAM=$O(DRWPCK(PSJDRG,PCKNAM)) Q:PCKNAM=""  D
 ....N QTY,FMTQTY S QTY=+DRWPCK(PSJDRG,PCKNAM)
 ....S DRCNTOT=$G(DRCNTOT)+QTY                           ; *Requires individual pocket balances for multi-pocket drugs*
 ....N PSJDTRUN  ;  Handle max length drug names
 ....S PSJDTRUN=$P($G(^PSDRUG(PSJDRG,0)),"^")
 ....I $L(PSJDTRUN)>33 S PSJDTRUN=$E(PSJDTRUN,1,33)
 ....S PSJDTRUN=PSJDTRUN_"("_PSJDRG_")"
 ....S FMTQTY=$S(PCKNAM["PSB":"*"_QTY,$E(PCKNAM,$L(PCKNAM)-1,$L(PCKNAM))="RB":"*"_QTY,1:QTY)
 ....I FMTQTY["*" D
 .....S PSBFLAG("PSB")=$S($E(PCKNAM,$L(PCKNAM)-2,$L(PCKNAM))["PSB":1,1:$G(PSBFLAG("PSB")))
 .....S PSBFLAG("RB")=$S($E(PCKNAM,$L(PCKNAM)-1,$L(PCKNAM))["RB":1,1:$G(PSBFLAG("RB")))
 ....S ^TMP("PSJPDRIN",$J,LNCNT)=PSJDTRUN_"^"_PSJDFORM_"^"_$S(PSJINP("PSJDELM")="R":$J(FMTQTY,4),1:FMTQTY)_"^"_PSJCABNM_"^"_PCKNAM,LNCNT=LNCNT+1
 ...I CC=1 N QTY,PSCABIEN,PSDRGIEN S PSCABIEN=$O(^PS(58.601,PSJPSYS,"DEVICE","B",PSJCAB,"")) D
 ....S QTY="-" I PSCABIEN S PSDRGIEN=$O(^PS(58.601,PSJPSYS,"DEVICE",PSCABIEN,"DRUG","B",PSJDRG,""))
 ....N PSJDTRUN  ;  Handle max length drug names
 ....S PSJDTRUN=$P($G(^PSDRUG(PSJDRG,0)),"^")
 ....I $L(PSJDTRUN)>33 S PSJDTRUN=$E(PSJDTRUN,1,33) S:$E(PSJDTRUN,$L(PSJDTRUN))=" " PSJDTRUN=$E(PSJDTRUN,1,$L(PSJDTRUN)-1)
 ....S PSJDTRUN=PSJDTRUN_" ("_PSJDRG_")"
 ....S ^TMP("PSJPDRIN",$J,LNCNT)=PSJDTRUN_"^"_PSJDFORM_"^"_$S(PSJINP("PSJDELM")="R":$J(QTY,4),1:QTY)_"^"_PSJCABNM_"^UNK",LNCNT=LNCNT+1
 .I PSJINP("PSJDELM")="R" D
 ..S ^TMP("PSJPDRIN",$J,LNCNT)=$E(TABMAR,1,34)_"^^----",LNCNT=LNCNT+1
 ..S ^TMP("PSJPDRIN",$J,LNCNT)=$E(TABMAR,1,34)_"^SUB TOTAL:^"_$J(DRCNTOT,4),LNCNT=$G(LNCNT)+1
 ..S ^TMP("PSJPDRIN",$J,LNCNT)=$E(TABMAR,1,24)_" REPORTED CABINET"_"^ TOTAL:^"_$J(DRGTOT,4),LNCNT=$G(LNCNT)+1
 ..I $G(PSBFLAG("PSB")) S ^TMP("PSJPDRIN",$J,LNCNT)="* Patient Specific Bin counts not included in Reported Cabinet Total.",LNCNT=$G(LNCNT)+1
 ..I $G(PSBFLAG("RB")) S ^TMP("PSJPDRIN",$J,LNCNT)="* Return Bin counts not included in Reported Cabinet Total.",LNCNT=$G(LNCNT)+1
 Q
 ;
QTY(SYS,PSJCAB,PSJDRG) ; Return quantity of drug PSJDRG in cabinet PSJCAB
 N QTY,PSYSIEN,PDEVIEN,PDRGIEN
 S PSYSIEN=$O(^PS(58.601,"DEV",PSJCAB,PSJDRG,""))
 S PDEVIEN=$O(^PS(58.601,"DEV",PSJCAB,PSJDRG,PSYSIEN,""))
 S PDRGIEN=$O(^PS(58.601,"DEV",PSJCAB,PSJDRG,PSYSIEN,PDEVIEN,""))
 S QTY=+$P($G(^PS(58.601,PSYSIEN,"DEVICE",PDEVIEN,"DRUG",PDRGIEN,0)),"^",3)
 Q QTY
 ;
DFORM(SYS,PSJCAB,PSJDRG) ; Return Dose Form of drug PSJDRG in cabinet PSJCAB
 N FORM,PSYSIEN,PDEVIEN,PDRGIEN
 S PSYSIEN=$O(^PS(58.601,"DEV",PSJCAB,PSJDRG,""))
 S PDEVIEN=$O(^PS(58.601,"DEV",PSJCAB,PSJDRG,PSYSIEN,""))
 S PDRGIEN=$O(^PS(58.601,"DEV",PSJCAB,PSJDRG,PSYSIEN,PDEVIEN,""))
 S FORM=$P($G(^PS(58.601,PSYSIEN,"DEVICE",PDEVIEN,"DRUG",PDRGIEN,0)),"^",5)
 Q FORM
 ;
DRCAB(PSJINP,PSJDRCAB) ; Return list of drugs in each cabinet in PSJINP("PADEV")
 ;   Input = PSJINP("PADEV",CABINET IEN) - Cabinet IEN points to PADE DISPENSING DEVICE file 58.63
 ;  Output = PSJDRCAB(DRUG IEN)          - Drug IEN points to DRUG file 50
 K PSJDRCAB
 N CAB,CABDA,PSJPSYS,DRGDA,DRG
 S PSJPSYS=$G(PSJINP("PSJPSYS"))
 M CAB=PSJINP("PADEV")
 S CAB=0 F  S CAB=$O(CAB(CAB)) Q:'CAB  S CABDA=$O(^PS(58.601,PSJPSYS,"DEVICE","B",CAB,0)) I CABDA D
 .S DRGDA=0 F  S DRGDA=$O(^PS(58.601,PSJPSYS,"DEVICE",CABDA,"DRUG",DRGDA)) Q:'DRGDA  S DRG=+$G(^(DRGDA,0)) I DRG D
 ..Q:$D(PSJDRCAB(DRG))
 ..I '($G(PSJINP("PSJCSUB"))="ALL") Q:'$D(PSJINP("PSJCSUB",$$GETCLASS(DRG)))
 ..S PSJDRCAB(DRG)=$P($G(^PSDRUG(+$G(DRG),0)),"^")
 Q
 ;
LISTALL(DRGLIST) ; Write list of drugs in DRGLIST("IEN",DRUG IEN)
 N II,DRGNAME,DRGIEN,TAB
 S $P(TAB," ",80)=""
 S DRGIEN=0 F  S DRGIEN=$O(DRGLIST("IEN",DRGIEN)) Q:'DRGIEN  D
 .W !,$E(TAB,1,8-$L(DRGIEN))_DRGIEN_"  "_DRGLIST("IEN",DRGIEN)
 Q
 ;
DRUGLIST(PSJINP,DRGLIST) ; Return DRGLIST array with "IEN" and "NAME" cross referenced
 N I,DRG,DLST
 S DRG=0 F I=1:1 S DRG=$O(DRGLIST(DRG)) Q:'DRG  D
 .N DRGNAME S DRGNAME=$G(DRGLIST(DRG))
 .S DRGLIST("IEN",DRG)=DRGNAME
 .S DRGLIST("NAME",DRGNAME)=DRG
 Q
 ;
SELDEV(RTN,PSJINP,PSJWIDE,ZTSK) ; Select Device
 ;
 N PSJDONE
 ;
 I $G(PSJINP("PSJDELM"))="D" D
 .N DIR,X,Y
 .S DIR("A",1)=""
 .S DIR("A",2)="     ************************************************************"
 .S DIR("A",3)="     **  You selected a Delimited report. Please verify you    **"
 .S DIR("A",4)="     **  you have turned logging on to capture the output.     **"
 .S DIR("A",5)="     **                                                        **"
 .S DIR("A",6)="     **  To avoid undesired wrapping, please enter '0;512;999' **"
 .S DIR("A",7)="     **  at the 'DEVICE:' prompt. You may need to set your     **"
 .S DIR("A",8)="     **  Terminal Session display settings to 512 columns.     **"
 .S DIR("A",9)="     ************************************************************"
 .S DIR("A",10)=""
 .S DIR("A",11)="",DIR("A",12)=""
 .S DIR("A")=" Press return to continue"
 .S DIR(0)="EA" D ^DIR W !
 ;
 W !,"This report is designed for a "_$S($G(PSJWIDE):132,1:80)_" column format."
 W !,"You may queue this report to print at a later time.",!
 F  Q:$G(PSJSTOP)!$G(PSJDONE)  D
 .K %ZIS,IOP,POP,ZTSK N I S PSJION=$I,%ZIS="QM"
 .D ^%ZIS K %ZIS
 .I POP S IOP=PSJION D ^%ZIS K IOP,PSJION D  Q
 ..N DIR,X,Y
 ..S DIR(0)="YA",DIR("A",1)="  ** No Device Selected **",DIR("A")="Select a different device? (Y/N) " D ^DIR
 ..S:'Y PSJSTOP=1
 .S PSJDONE=1
 ;
 K PSJION I $D(IO("Q")) D  Q "Q"
 .S ZTDESC="PADE Inventory Report",ZTRTN=$S($G(RTN)]"":$G(RTN),1:"START^PSJPDRIN")
 .F I="PSJINP(","IO" S ZTSAVE(I)=""
 .K IO("Q") D ^%ZTLOAD W:$D(ZTSK) !,"Report is Queued to print!"
 Q ""
 ;
CONT(PGCNT,PSJQUIT,TMPLN) ; Press return to continue
 N DIR
 I ($E($G(IOST))="C") W ! D
 .S:'$D(DIR("A")) DIR("A")="Press Return to continue or '^' to exit"
 .S DIR(0)="FO"
 .D ^DIR K DIR
 .I $G(DTOUT)!$G(DUOUT) S PSJSTOP=1
 Q
 ;
ALPHADRG(SYS,CAB,DRG,DRGX)  ; Alphabetize drug names DRGNAME in DRG(IEN)=DRGNAME, return in DRG(DRGNAME,IEN)=""
 N DRGIEN,DRGNAME
 S DRGIEN=0 F  S DRGIEN=$O(DRG(DRGIEN)) Q:'DRGIEN  S DRGNAME=$G(DRG(DRGIEN)) I DRGNAME]"" D
 .Q:'$D(^PS(58.601,"DEV",CAB,DRGIEN))
 .S DRGX(DRGNAME,DRGIEN)=""
 Q
 ;
POCKET(PSJINP,PSDRG,OUTPOCK) ; Get pocket(s)
 ;
 N DRAWER,POCKET,DRGPCK,PSJPSYS,PADIEN,PADEV,DRGDEV,DRWIEN,DRGDRW,SUB,SUBID
 S PSJPSYS=$G(PSJINP("PSJPSYS")),PADEV=$G(PSJINP("PADEV"))
 S PADIEN=$O(^PS(58.601,+PSJPSYS,"DEVICE","B",+PADEV,""))
 Q:'$G(PSDRG)!'$G(PSJPSYS)!'$G(PADIEN)
 ;
 S OUTPOCK=PSDRG
 S DRWIEN=0 F  S DRWIEN=$O(^PS(58.601,+PSJPSYS,"DEVICE",+PADIEN,"DRAWER",DRWIEN)) Q:'DRWIEN  D
 .S SUB=0 F  S SUB=$O(^PS(58.601,PSJPSYS,"DEVICE",PADIEN,"DRAWER",DRWIEN,"SUB",SUB)) Q:'SUB  D
 ..S DRGPCK=$P(^PS(58.601,PSJPSYS,"DEVICE",PADIEN,"DRAWER",DRWIEN,"SUB",SUB,0),"^",5),POCKET=$P(^(0),"^",3),SUBID=$P($G(^(0)),"^",4)
 ..Q:'(DRGPCK=$G(PSDRG))
 ..S DRAWER=$G(^PS(58.601,+PSJPSYS,"DEVICE",+PADIEN,"DRAWER",DRWIEN,0))
 ..S:DRAWER="" DRAWER="~~"
 ..S POCKET=DRAWER_"_"_POCKET
 ..S DRGDRW=$O(^PS(58.601,PSJPSYS,"DEVICE",PADIEN,"DRAWER",DRWIEN,"DRUG","B",PSDRG,""))
 ..S OUTPOCK(DRGPCK,DRWIEN,SUB)=POCKET_"^"_DRGDRW_"^"_DRAWER_$S($L(SUBID):"^"_SUBID,1:"")
 S DRGDEV=$O(^PS(58.601,PSJPSYS,"DEVICE",PADIEN,"DRUG","B",PSDRG,""))
 S OUTPOCK(PSDRG,"DRGDEV")=DRGDEV
 Q