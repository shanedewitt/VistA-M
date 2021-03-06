MPIFDODC ;OAK/ELZ- DOD ACTIVITY CHECK ;6/9/2016
 ;;1.0;MASTER PATIENT INDEX VISTA;**64,66,67**;30 Apr 99;Build 2
 ; Integration Agreements Utilized:
 ;   IA #4433  $$SDAPI^SDAMA301
 ;   IA #4820  RX^PSO52API
 ;   IA #10062 IN5^VADPT and KVAR^VADPT
 ;   IA #92    ^DGPT("B",DFN), ^DGPT(PTF,0), ^DGPT(PTF,70)
 ;   IA #2548  OPEN^SDQ, INDEX^SDQ, PAT^SDQ, DATE^SDQ, SCANCB^SDQ,
 ;             ACTIVE^SDQ, SCAN^SDQ, CLOSE^SDQ
 ;   IA #6420  $$ACTIVITY^FBUTLMVI 
 ;   IA #2028  ^AUPNVSIT(
 ;   IA #3035  $$GETIENS^PXAAVCPT, $$CPT^PXAAVCPT
 ;
 ;
SITECK(RETURN,DFN,MPIDOD) ; - check various packages for activity after the
 ; date of death, called via RPC from the MPI
 ;
 N X,MPI52LST,MPINODE,MPIFB,VRETURN,MPIC,MPISDAR
 S RETURN=0
 ;
 ; Story 718545 (elz) check to make sure patient exists at site and return no activity if they are not there to have activity
 I '$D(^DPT(DFN,0)) Q
 ;
 ; Patients with appointments scheduled for dates after the current date,
 ; appointments that are cancelled should not be included.  The 
 ; appointment status should be set to blank, I, or NT.
 ; NOTE:  BLANK status is translated to R by the SDAMA301 call.
 K ^TMP($J,"SDAMA301")
 S MPISDAR("FLDS")=1
 S MPISDAR("MAX")=1
 S MPISDAR("SORT")="P"
 S MPISDAR(1)=$$FMADD^XLFDT(DT,1)
 S MPISDAR(3)="I;NT;R"
 S MPISDAR(4)=DFN
 S X=$$SDAPI^SDAMA301(.MPISDAR)
 I X S RETURN="1^"_($O(^TMP($J,"SDAMA301",DFN,0))\1)_"^Appointment Found"
 K ^TMP($J,"SDAMA301")
 Q:RETURN
 ;
 ;
 ; Patients with prescription fills requested after death.  The Log In
 ; date is the date the prescription was requested.
 ; Searching back 365 days + 90 days to ensure all possible prescriptions
 ; are included in the query since prescriptions can be set for up to 1
 ; year and initially filed within the first 90 days.
 ;
 S MPI52LST="MPIPSO",MPINODE="0,2,P,R"
 K ^TMP($J,MPI52LST,DFN)
 D RX^PSO52API(DFN,MPI52LST,,,MPINODE,$$FMADD^XLFDT(MPIDOD,-455))
 ; Story 718542 (elz) only use the login date (not time) for the comparison
 S X=0 F  S X=$O(^TMP($J,MPI52LST,DFN,X)) Q:'X!(RETURN)  D
 . N RF,P
 . I $P($P($G(^TMP($J,MPI52LST,DFN,X,21)),"^"),".")>MPIDOD S RETURN="1^"_($P(^(21),"^")\1)_"^Initial Rx Login" Q
 . S RF=0 F  S RF=$O(^TMP($J,MPI52LST,DFN,X,"RF",RF)) Q:'RF!(RETURN)  D
 .. I $P($G(^TMP($J,MPI52LST,DFN,X,"RF",RF,7)),".")>MPIDOD S RETURN="1^"_($P(^(7),"^")\1)_"^Refill Rx Login" Q
 . Q:RETURN
 . S P=0 F  S P=$O(^TMP($J,MPI52LST,DFN,X,"P",P)) Q:'P!(RETURN)  D
 .. I $P($G(^TMP($J,MPI52LST,DFN,X,"P",P,.08)),".")>MPIDOD S RETURN="1^"_($P(^(.08),"^")\1)_"^Partial Rx Login" Q
 I RETURN K ^TMP($J,MPI52LST,DFN) Q
 ;
 ; Rx part #2 (elz) MPIF*1*66
 ; the prescription was requested on or before the date of death, the fill date (FillDateTime)
 ; is after the current date, there is no date of death in the patient record at the
 ; corresponding station(Sta3n), and the prescription status (RxStatus) is ACTIVE, NON-VERIFIED,
 ; REFILL, HOLD, DRUG INTERACTIONS, SUSPENDED, 0, 1, 2, 3, 4, or 5
 ;- If there is no DOD at current site (I'd do this first just to quickly eliminate)
 I '$P($G(^DPT(DFN,.35)),"^") D
 . ;- Then loop through rx's
 . S X=0 F  S X=$O(^TMP($J,MPI52LST,DFN,X)) Q:'X!(RETURN)  D
 .. ; Check status 0,1,2,3,4,5 (also quickly eliminate rx's based on status early
 .. I $P($G(^TMP($J,MPI52LST,DFN,X,100)),"^")'="",$P($G(^TMP($J,MPI52LST,DFN,X,100)),"^")<6 D
 ... N RF,P
 ... ; if Rx initial Rx requested on or before DOD (login date/time #21) AND if Fill Date>DT (#22) return activity
 ... I $P($G(^TMP($J,MPI52LST,DFN,X,21)),".")'>MPIDOD,$G(^(21)),$P($G(^(22)),".")>DT S RETURN="1^"_(^(21)\1)_"^Initial Rx'>DOD,"_(^(22)\1)_">DT" Q
 ... ; loop through refills
 ... S RF=0 F  S RF=$O(^TMP($J,MPI52LST,DFN,X,"RF",RF)) Q:'RF!(RETURN)  D
 .... ;if refill requested on or before DOD (login date/time #7) AND if Fill Date>DT (#.01) return activity
 .... I $P($G(^TMP($J,MPI52LST,DFN,X,"RF",RF,7)),".")'>MPIDOD,$G(^(7)),$P($G(^(.01)),".")>DT S RETURN="1^"_(^(7)\1)_"^Refill'>DOD,"_(^(.01)\1)_">DT" Q
 ... ; loop through partials
 ... S P=0 F  S P=$O(^TMP($J,MPI52LST,DFN,X,"P",P)) Q:'P!(RETURN)  D
 .... ;if partial requested on or before DOD (login date/time #.08) AND if Fill Date>DT (#.01) return activiy
 .... I $P($G(^TMP($J,MPI52LST,DFN,X,"P",P,.08)),".")'>MPIDOD,$G(^(.08)),$P($G(^(.01)),".")>DT S RETURN="1^"_(^(.08)\1)_"Partial'>DOD,"_(^(.01)\1)_">DT" Q
 K ^TMP($J,MPI52LST,DFN)
 Q:RETURN
 ;
 ;
 ; Note: The next two categories are only considered when:
 ;  (1) the VistA patient record being checked for activity has no death
 ;      date or
 ;  (2) the VistA patient record being checked for activity has a death
 ;      date, and the source is other than INPATIENT AT VAMC.
 S X=$G(^DPT(DFN,35)) I 'X!(X&($P(X,"^",3)'=1)) D  Q:RETURN
 . ;
 . N VAIP,MPIARR,PTF
 . ; i. Patients with an inpatient discharge date more than one day after
 . ;    the date of death, VHA facility: The discharge date is more than
 . ;    one day after the date of death or the patient has not been
 . ;    discharged (currently an inpatient).
 . S VAIP("D")="LAST",VAIP("M")=0 D IN5^VADPT
 . I VAIP(1),'VAIP(17) S RETURN="1^^No Discharge Movement" Q
 . I $P(VAIP(17,1),".")>$$FMADD^XLFDT(MPIDOD,1) S RETURN="1^"_(VAIP(17,1)\1)_"^Last Discharge > DOD" Q
 . D KVAR^VADPT
 . ;
 . ;
 . ;ii. Purchased care: The discharge date is more than one day after
 . ;    the date of death. If there is no discharge date, use the
 . ;    admission date.  Have to go to the PTF as the FEE ones don't
 . ;    create movements and don't show in the VADPT calls.
 . ; get the last ptf record.
 . S PTF=$O(^DGPT("B",DFN,":"),-1)_","
 . I PTF D GETS^DIQ(45,PTF_",","2;70","I","MPIARR")
 . ; really we don't care if it was FEE or not, it was after the DOD
 . ; Story 722864 (elz) update return text to include PTF file (#45) IEN=nnnn
 . I $P($G(MPIARR(45,PTF,70,"I")),".")>$$FMADD^XLFDT(MPIDOD,1) S RETURN="1^"_(MPIARR(45,PTF,70,"I")\1)_"^PTF Record with discharge after DOD, PTF file (#45) IEN="_+PTF Q
 . E  I $P($G(MPIARR(45,PTF,2,"I")),".")>$$FMADD^XLFDT(MPIDOD,1) S RETURN="1^"_(MPIARR(45,PTF,2,"I")\1)_"^PTF with admission after DOD, PTF file (#45) IEN="_+PTF
 ;
 ; Patients with two or more of the following health care events after
 ; death
 S MPIC=0
 ; i. Visits that are not historical entries, are not non-count, and have
 ;    a procedure code recorded on the visit
 K ^TMP("DIERR",$J) D
 . N MPIQ
 . D OPEN^SDQ(.MPIQ) Q:'$G(MPIQ)
 . D INDEX^SDQ(.MPIQ,"PATIENT/DATE","SET")
 . D SCANCB^SDQ(.MPIQ,"D CALLBACK^MPIFDODC(Y0)","SET")
 . D PAT^SDQ(.MPIQ,DFN,"SET")
 . D DATE^SDQ(.MPIQ,$$FMADD^XLFDT(MPIDOD,1),9999999,"SET")
 . D ACTIVE^SDQ(.MPIQ,"TRUE","SET")
 . D SCAN^SDQ(.MPIQ,"FORWARD")
 . D CLOSE^SDQ(.MPIQ)
 K ^TMP("DIERR",$J)
 ;
 I MPIC>1,$G(VRETURN) S RETURN=VRETURN Q
 ;
 ; ii. Purchased Care with treatment dates after date of death
 S MPIFB=$$ACTIVITY^FBUTLMVI(DFN,MPIDOD,.MPIFB)
 I MPIFB+MPIC>1 S RETURN="1^"_MPIFB(+$O(MPIFB(0)))
 ;
 Q
 ;
CALLBACK(MPIOE) ; - Called back from the SDQ
 N MPIVISIT,MPICPT,MPICPTV,MPIARR,MPIS
 Q:$P(MPIOE,"^",12)=12  ; non-count encounter
 S MPIVISIT=$P(MPIOE,"^",5)_"," Q:'MPIVISIT
 D GETS^DIQ(9000010,MPIVISIT,".07","I","MPIARR")
 Q:$G(MPIARR(9000010,"4,",.07,"I"))="E"  ; historical
 S MPICPT=$$GETIENS^PXAAVCPT(+MPIVISIT,.MPICPT)
 Q:'MPICPT  ; no procedures found
 S MPIS=0
 S MPICPT=0 F  S MPICPT=$O(MPICPT(MPICPT)) Q:'MPICPT!(MPIS)  D
 . S MPICPTV=$$CPT^PXAAVCPT(MPICPT)
 . Q:$L($T(@MPICPTV))  ; cpt on the exclude list
 . S MPIC=MPIC+1,VRETURN="1^"_(MPIOE\1)_"^Multiple visits found",MPIS=1
 I MPIC>1 S SDSTOP=1
 Q
CPTS ; - list of cpt codes to ignore
98966 ;;HC PRO PHONE CALL 5-10 MIN
98967 ;;HC PRO PHONE CALL 11-20 MIN
98968 ;;HC PRO PHONE CALL 21-30 MIN
99441 ;;PHONE E/M PHYS/QHP 5-10 MIN
99373 ;;PHYSICIAN PHONE CONSULTATION
99442 ;;PHONE E/M PHYS/QHP 11-20 MIN
99371 ;;PHYSICIAN PHONE CONSULTATION
99377 ;;HOSPICE CARE SUPERVISION
99378 ;;HOSPICE CARE SUPERVISION
99372 ;;PHYSICIAN PHONE CONSULTATION
G0182 ;;HOSPICE CARE SUPERVISION
99443 ;;PHONE E/M PHYS/QHP 21-30 MIN
99380 ;;NURSING FAC CARE SUPERVISION
S0320 ;;RN TELEPHONE CALLS TO DMP
99339 ;;DOMICIL/R-HOME CARE SUPERVIS
99447 ;;INTERPROF PHONE/ONLINE 11-20
99448 ;;INTERPROF PHONE/ONLINE 21-30
