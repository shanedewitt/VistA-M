IBECEAU ;ALB/CPM - Cancel/Edit/Add... Utilities ;11-MAR-93
 ;;2.0;INTEGRATED BILLING;**91,249,402,651**;21-MAR-94;Build 9
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
CHECK(TALK) ; Retrieve the institution and MAS Service pointer.
 ; Input:   TALK  --  1 : do i/o (writes)
 ;                    0 : no i/o
 N IBY,Y S (IBY,Y)=1
 D SITE^IBAUTL I Y<1 S IBY=Y W:$G(TALK) !!,"You must define your facility in the IB SITE PARAMETER file before proceeding!",!
 I IBY>0 D SERV^IBAUTL2 I IBY<1 W:$G(TALK) !!,"You must define the MAS Service Pointer in the IB SITE PARAMETER file",!,"before proceeding!",!
 Q IBY>0
 ;
PAUSE ; Go to end of page to pause.
 N DIR,DIRUT,DUOUT,DTOUT,X,Y
 W ! F Y=$Y:1:21 W !
 S DIR("A")="Press RETURN to process the next charge or to return to the list"
 S DIR(0)="E" D ^DIR K DIR
 Q
 ;
INPT(DAYS) ; Return a description for Billing Clock days.
 ; Input:   DAYS  --  Number of days in a billing clock
 ; Output:  "1st", "2nd", "3rd", "4th"
 Q $S(DAYS>270:"4th",DAYS>180:"3rd",DAYS>90:"2nd",1:"1st")
 ;
LAST(PAR) ; Find last action filed for any parent action.
 ; Input:    PAR  --  Parent IB Action
 ; Output:   Last action filed for parent (or parent if none)
 N IBL,IBLDT,IBLAST
 S IBLAST="",IBLDT=$O(^IB("APDT",PAR,"")) I +IBLDT S IBL=0 F  S IBL=$O(^IB("APDT",PAR,IBLDT,IBL)) Q:'IBL  S IBLAST=IBL
 Q $S(IBLAST:IBLAST,1:PAR)
 ;
BFO(DFN,DATE) ; Patient Billed For OPT Copay on a specified date?
 ; Input:    DFN  --  Pointer to the patient in file #2
 ;          DATE  --  Date of the Outpatient Visit
 ; Output:     0  --  Not billed the OPT copay on the visit date
 ;            >0  --  Pointer to charge in file #350 that was billed
 N IBATYP,IBATYPN,IBL,IBND,IBN,Y
 I '$G(DFN)!'$G(DATE) G BFOQ
 S IBN=0 F  S IBN=$O(^IB("AFDT",DFN,-DATE,IBN)) Q:'IBN  D  I ($P(IBATYPN,"^",11)=4)!($P(IBATYPN,"^",11)=8),"^1^3^"[("^"_$P(IBATYP,"^",5)_"^"),"^1^2^3^4^8^20^"[("^"_+$P(IBND,"^",5)_"^") S Y=IBL Q
 .S IBL=$$LAST(+$P($G(^IB(IBN,0)),"^",9)),IBND=$G(^IB(IBL,0))
 .S IBATYP=$G(^IBE(350.1,+$P(IBND,"^",3),0))
 .S IBATYPN=$G(^IBE(350.1,+$P(IBATYP,"^",9),0))
BFOQ Q +$G(Y)
 ;
CNP(DFN,DATE) ; Did the patient have a C&P Exam on a specified date?
 ; Input:    DFN  --  Pointer to the patient in file #2
 ;          DATE  --  Date of the Outpatient Visit
 ; Output:     0  --  Patient did not have a C&P Exam on the visit date
 ;             1  --  Patient had a C&P Exam on the visit date
 N I,IBD,IBSD,Y,IBVAL,IBCBK,IBFILTER,IBCNP,Z
 I '$G(DFN)!'$G(DATE) G CNPQ
 ; - check appts, stop codes
 S IBVAL("DFN")=DFN,IBVAL("BDT")=DATE,IBVAL("EDT")=DATE+.9999
 ; Only parent appt or add/edit encounters
 S IBFILTER=""
 S IBCBK="I '$P(Y0,U,6),$P(Y0,U,8)<3 N Z S Z=$P(Y0,U,8) I $S(Z=1:$P(Y0,U,10)=1&($P(Y0,U,12)<3),Z=2:$P(Y0,U,10)=1,1:0) S (IBCNP,SDSTOP)=1"
 S IBCNP=0
 D SCAN^IBSDU("PATIENT/DATE",.IBVAL,IBFILTER,IBCBK,1) K ^TMP("DIERR",$J)
 I IBCNP S Y=1
CNPQ Q +$G(Y)
 ;
HDR(OPT) ; Display the header for an action
 ; Input:    OPT  --  Action Header
 N ADD,HDR S ADD=OPT="A D D"
 D CLEAR^VALM1 S IBY=1,HDR=OPT_"   A   C H A R G E"
 I 'ADD S IBIDX=$G(^TMP("IBACMIDX",$J,IBNBR)),IBN=+$P(IBIDX,"^",4),IBND=$G(^IB(IBN,0))
 W !?(80-$L(HDR)\2),HDR W:'ADD !?29,"Processing Charge #",IBNBR
 W !,$$LINE,!?3,"Name: ",$P(IBNAM,"^") W:'ADD ?41,"Type: ",$P(IBIDX,"^",3)
 I ADD W ?41,"** " W:'IBCLDA "NO " W "ACTIVE BILLING CLOCK **"
 W !?5,"ID: ",$P(IBNAM,"^",2) W:'ADD ?42,"Amt:",$P(IBIDX,"^",5)," (",$P(IBIDX,"^",6),")"
 I ADD,IBCLDA W ?44,"Clock Begin Date: ",$$DAT1^IBOUTL(IBCLDT)
 W !,$$LINE,!
 Q
 ;
LINE() ; Write a line.
 Q $TR($J("",80)," ","-")
 ;
CLOCK(IBDOL,IBDAYPR,IBDAY) ; Display and update clock data.
 ; Input:     IBDOL  --  Dollar amount to add or subtract
 ;          IBDAYPR  --  Existing number of inpatient days
 ;            IBDAY  --  Inpatient days to add or subtract
 ; Also assumes that IBCLST,IBNAM, IBCLDA, and IBXA are defined.
 D CLDSP^IBECEAU1(IBCLST,IBNAM) I $P(IBCLST,"^",4)'=1 W !,"** Please note that an active billing clock was not selected for updating **"
 I IBXA=1!(IBXA=2) D CLAMT^IBECEAU1(IBCLST,IBDOL,IBCLDA)
 I IBXA=3 D CLINP^IBECEAU1(IBDAYPR,IBDAY,IBCLDA)
 Q
 ;
 ;IB*2.0*651 - added new duplicate check for medical copays for the date period listed by the copay.
 ;
BFCHK(DFN,DATE) ;
 ; Input:    DFN  --  Pointer to the patient in file #2
 ;         SDATE  --  Start Date of the Patient Visit (inpatient or outpatient)
 ;         EDATE  --  (Optional) End Date of the Patient Visit (inpatient only)
 ;
 ; Output:     0  --  Not billed the OPT copay on the visit date
 ;            >0  --  Pointer to charge in file #350 that was billed
 ;
 N IBATYP,IBATYPN,IBL,IBND,IBN,Y,SDATE,IBFLG,EDATEH,DATEH,IBLPDT
 I '$G(DFN)!'$G(DATE) G BFCHKQ
 S EDATE=$G(IBTO)  ; ensuring optional end date is initialized.
 I EDATE="" S EDATE=DATE    ;define it
 ;
 ;Set the correct starting date for the lookup
 ;S SDATE=$S($D(^IB("AFDT",DFN,-DATE)):-DATE,1:$O(^IB("AFDT",DFN,-DATE)))
 ;
 ; Check for entries within the given start and end date range
 ;convert to internal dates
 S DATEH=$P($$F2H^XLFDT(DATE),","),EDATEH=$P($$F2H^XLFDT(EDATE),",")
 F IBLPDT=DATEH:1:EDATEH D  Q:Y
 . S Y=0
 . ;Convert looping date back to Fileman Date Format
 . S SDATE=$$H2F^XLFDT(IBLPDT)
 . ;Set the correct starting date for the lookup
 . S SDATE=$S($D(^IB("AFDT",DFN,-SDATE)):-SDATE,1:$O(^IB("AFDT",DFN,-SDATE)))
 . Q:SDATE=""
 . S IBN=0 F  S IBN=$O(^IB("AFDT",DFN,SDATE,IBN)) Q:'IBN  D  I 'IBFLG I $P(IBATYPN,"^",11)'=5,"^1^3^"[("^"_$P(IBATYP,"^",5)_"^"),"^1^2^3^4^8^20^"[("^"_+$P(IBND,"^",5)_"^") S Y=IBL Q
 .. S IBFLG=0
 .. S IBL=$$LAST(+$P($G(^IB(IBN,0)),"^",9)),IBND=$G(^IB(IBL,0)),IBFDT=$P(IBND,U,14),IBTDT=$P(IBND,U,15)
 .. S DATEL=-SDATE
 .. I (DATE<IBFDT)!(DATE>IBTDT) S IBFLG=1 Q    ;DATE BEING CHECK
 .. S IBATYP=$G(^IBE(350.1,+$P(IBND,"^",3),0))      ;Grab the action type for the Copay
 .. S IBATYPN=$G(^IBE(350.1,+$P(IBATYP,"^",9),0))   ;Grab the associated new Action Type for the Copay
 .. I IBXA=3,$P(IBATYPN,U,11)<3 S IBFLG=1 Q    ;Allow Inpatient Per Diem on an Inpatient Copay
 ;
BFCHKQ Q +$G(Y)
