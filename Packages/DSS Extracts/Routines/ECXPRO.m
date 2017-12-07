ECXPRO ;ALB/GTS - Prosthetics Extract for DSS ;11/8/17  14:51
 ;;3.0;DSS EXTRACTS;**9,13,15,21,24,33,39,46,71,92,105,120,127,132,136,144,149,154,161,166,169**;Dec 22, 1997;Build 2
BEG ;entry point from option
 D SETUP I ECFILE="" Q
 D:+ECINST>0 ^ECXTRAC D ^ECXKILL
 Q
 ;
START ;start package specific extract
 ;
 ; Input
 ;  ECSD1   - FM formatted Beginning Date (Set by ECXTRAC)
 ;  ECED    - FM formatted End Date (Set by ECXTRAC)
 ;  ECSDN   - Externally formatted Start Date (Set by ECXTRAC)
 ;  ECEDN   - Externally formatted End Date (Set by ECXTRAC)
 ;  EC      - IEN from file #727 (Set by ECXTRAC)
 ;  ECXYM   - Year and Month of extract (YYYYMM)
 ;  ECXINST - IEN for division in file #4
 ;  ECINST  - Station number of selected division
 ;
 N ECXLNE,ECXCT,ECXDACT,ECX0,ECXLB,ECXED1,ECINSTSV,ECXLNSTR,ECXP
 N ECXICD10P,ECXICD101,ECXICD102,ECXICD103,ECXICD104
 N DIC,DR,DA,DIQ,CPTCODE,ECXNPRFI
 N ECXESC,ECXCLST,ECXECL,ECXUI ;144,166
 D ECXBUL^ECXPRO2(.ECXLNE,ECSDN,ECEDN,EC)
 S QFLG=0,ECXLNSTR=ECXLNE,ECXED1=ECED+.9999,ECXCT=ECSD1
 F  S ECXCT=$O(^RMPR(660,"CT",ECXCT)) Q:(ECXCT>ECXED1)!('ECXCT)!(QFLG=1)  D
 .S ECXDACT=0
 .F  S ECXDACT=$O(^RMPR(660,"CT",ECXCT,ECXDACT)) Q:('ECXDACT)!(QFLG=1)  D
 ..;* initialize variables
 ..S (ECXDFN,ECXPNM,ECXSSN,ECXSEX,ECXSTAT,ECXDATE,ECXTYPE,ECXSRCE)=""
 ..S (ECXHCPCS,ECXPHCPC,ECXRQST,ECXRCST,ECXFORM,ECXCTAMT,ECXLLC)=""
 ..S (ECXLMC,ECXGRPR,ECXBILST,ECXQTY,ECXFELOC,ECXFEKEY,ECXA,ECXLH,ECXLC,ECXMC)=""
 ..S (ECPTTM,ECPTPR,ECXAST,ECXRST,ECXEST,ECXELIG,ECXVET,ECXZIP,ECXVNS,ECXCLST)="" ;144
 ..S (ECXDOB,ECXDSSD,ECXICD9,ECXICD10P,ECXAOL,ECXHNCI,ECXSHADI,ECXETH,ECXRC1,ECXMST)=""
 ..F I=1:1:4 S @("ECXICD9"_I)=""
 ..F I=1:1:4 S @("ECXICD10"_I)=""
 ..Q:'$D(^RMPR(660,ECXDACT,0))
 ..S ECX0=^RMPR(660,ECXDACT,0),ECXLB=$G(^RMPR(660,ECXDACT,"LB"))
 ..K ECXP S DIC="^RMPR(660,",DR=".02;11;45",DA=ECXDACT,DIQ(0)="EI"
 ..S DIQ="ECXP" D EN^DIQ1
 ..S ECXDIV=$$GET1^DIQ(660,ECXDACT,8,"I")
 ..S ECXDFN=$G(ECXP(660,ECXDACT,.02,"I"))
 ..S ECXFORM=$G(ECXP(660,ECXDACT,11,"E"))_U_$G(ECXP(660,ECXDACT,11,"I"))
 ..S ECXLH=$G(ECXP(660,ECXDACT,45,"I"))
 ..S ECXUI=$$GET1^DIQ(660,ECXDACT,78) ;166 get unit of issue
 ..Q:'$$PATDEM^ECXUTL2(ECXDFN,ECXCT)
 ..S OK=$$PAT^ECXUTL3(ECXDFN,ECXDATE,"1;5",.ECXPAT)
 ..I 'OK S ECXERR=1 K ECXPAT Q
 ..;OEF/OIF data
 ..S ECXOEF=ECXPAT("ECXOEF")
 ..S ECXOEFDT=ECXPAT("ECXOEFDT")
 ..S ECXVNS=ECXPAT("VIETNAM") ; 144 VIETNAM STATUS
 ..S ECXCLST=ECXPAT("CL STAT") ;144 Camp Lejeune Status
 ..S ECXSVCI=ECXPAT("COMBSVCI") ;149 COMBAT SVC IND
 ..S ECXSVCL=ECXPAT("COMBSVCL") ;149 COMBAT SVC LOC
 ..Q:'$$NTEG^ECXPRO1(ECXDFN,.ECXLNE,ECXDACT,ECX0,ECXLB,ECINST,ECXFORM)
 ..D PROSINFO^ECXPRO1(ECXDACT,ECXLB,ECX0,ECXFORM)
 ..S CPTCODE=$E(ECXHCPCS,1,5)
 ..;nppd entry date
 ..S ECXNPPDT=$$ECXDATE^ECXUTL($P(ECX0,U,1),ECXYM)
 ..;
 ..;Get production division ;p-46
 ..N ECXPDIV S ECXPDIV=$$RADDIV^ECXDEPT(ECXDIV) ;p-46
 ..;- Observation patient indicator (YES/NO)
 ..S ECXOBS=$$OBSPAT^ECXUTL4(ECXA,ECXTS)
 ..;
 ..;- CNH status (YES/NO)
 ..S ECXCNH=$$CNHSTAT^ECXUTL4(ECXDFN)
 ..;
 ..;get encounter classifications
 ..S (ECXAO,ECXECE,ECXHNC,ECXMIL,ECXIR,ECXSHAD,ECXESC,ECXECL)="" ;144
 ..S ECXVISIT=$$GET1^DIQ(660,ECXDACT,8.12,"I") I ECXVISIT'="" D
 ...D VISIT^ECXSCX1(ECXDFN,ECXVISIT,.ECXVIST,.ECXERR) I ECXERR K ECXERR Q
 ...S ECXAO=$G(ECXVIST("AO")),ECXECE=$G(ECXVIST("PGE")),ECXSHAD=$G(ECXVIST("SHAD"))
 ...S ECXHNC=$G(ECXVIST("HNC")),ECXMIL=$G(ECXVIST("MST")),ECXIR=$G(ECXVIST("IR"))
 ...S ECXESC=ECXVIST("ENCSC"),ECXECL=ECXVIST("ENCCL") ;144
 ..; - Head and Neck Cancer Indicator
 ..S ECXHNCI=$$HNCI^ECXUTL4(ECXDFN)
 ..;
 ..; - Proj 112/SHAD Indicator
 ..S ECXSHADI=$$SHAD^ECXUTL4(ECXDFN)
 ..;
 ..; ******* - PATCH 127, ADD PATCAT CODE  ********
 ..S ECXPATCAT=$$PATCAT^ECXUTL(ECXDFN)
 ..; - set national patient record flag if exist
 ..D NPRF^ECXUTL5
 ..;
 ..;- If no encounter number don't file record
 ..S ECXENC=$$ENCNUM^ECXUTL4(ECXA,ECXSSN,ECXADMDT,ECXDATE,ECXTS,ECXOBS,ECHEAD,,) Q:ECXENC=""
 ..I ECXFORM["-3" F ECXLAB="LAB","ORD" D
 ...S ECINSTSV=ECXRQST I ECINSTSV="" S ECINSTSV=ECXPDIV  ;166,169 tjl
 ...D FEEDINFO^ECXPRO2(ECXSRCE,CPTCODE,ECXTYPE,ECXSTAT2,ECXRQST,ECXRCST,ECXLAB,ECXNPPDC)
 ...Q:ECXFELOC=""  D FILE
 ..I ECXFORM'["-3" S ECXLAB="NONL" D
 ...S ECINSTSV=ECXSTAT2 I ECINSTSV="" S ECINSTSV=ECXPDIV  ;166,169 tjl
 ...D FEEDINFO^ECXPRO2(ECXSRCE,CPTCODE,ECXTYPE,ECXSTAT2,ECXRQST,ECXRCST,ECXLAB,ECXNPPDC)
 ...Q:ECXFELOC=""  D FILE
 ;* Send the Exception message
 I ECXLNSTR<ECXLNE DO
 .K XMY S XMY("G.DSS-"_ECGRP_"@"_^XMB("NETNAME"))=""
 .S XMDUZ=.5
 .S XMSUB=ECINST_" - Prosthetics DSS Exception Message",XMN=0
 .S XMTEXT="^TMP(""ECX-PRO EXC"",$J,"
 .D ^XMD
 K ^TMP("ECX-PRO EXC",$J),XMDUZ,XMSUB,XMTEXT,XMY,XMN
 Q
 ;
FILE ;file extract record
 ;node0
 ;facility^dfn (ECXDFN)^ssn (ECXSSN)^name (ECXPNM)^in/out (ECXA)^
 ;day^feeder location^
 ;feeder key^qty^pc team^pc provider^hcpcs^Placeholder (ECXICD9)^
 ;Placeholder (ECXICD91)^Placeholder (ECXICD92)^Placeholder (ECXICD93)^
 ;Placeholder (ECXICD94)^agent orange^radiation^env contam^eligibility^
 ;cost^lab labor cost^lab matl cost^billing status^
 ;vet^transaction type^req station^rec station^file#661.1 ien
 ;node1
 ;zip^dob^sex^amis grouper^placeholder^mpi^placeholder ECXDSSD^
 ;pc prov person class^race^pow status^pow loc^
 ;sharing agree payor^sharing agree ins^mst status^
 ;enroll loc^state^county^assoc pc provider^
 ;assoc pc prov person class^placeholder
 ;dom (ECXDOM)^purple heart indicator (ECXPHI)^
 ;enrollment Category (ECXCAT)^enrollment status (ECXSTAT)^
 ;enrollment priority (ECXPRIOR)^purple heart ind (ECXPHI)^
 ;period of serv (ECXPOS)^observ pat ind (ECXOBS)^encounter num (ECXENC)^
 ;ao loc (ECXAOL)^CNH status (ECXCNH)^production division ECXPDIV^
 ;head & neck canc. ind. (ECXHNCI)^ethnicity (ECXETH)^race1 (ECXRC1)^
 ;^enrollment priority (ECXPRIOR)_enrollment sub-
 ;group (ECXSBGRP)^user enrollee (ECXUESTA)^patient type ECXPTYPE
 ;^combat vet elig ECXCVE^combat vet elig end date ECXCVEDT^enc cv
 ;eligible ECXCVENC^national patient record flag ECXNPRFI^
 ;emergency response indicator(FEMA) ECXERI^agent orange indicator ECXAO
 ;^environ contam ECXECE^head/neck cancer ECXHNC^encntr mst ECXMIL^
 ;radiation ECXIR
 ;NODE2
 ;OEF/OIF ECXOEF^OEF/OIF return date ECXOEFDT^
 ;nppd code ECXNPPDC^nppd entry date ECXNPPDT
 ;assoc pc provider npi ECASNPI^primary care provider npi ECPTNPI^
 ;country ECXCNTRY^shad indicator ECXSHADI^shad encounter ECXSHAD^
 ;labor hours ECXLH^
 ;PATCAT^EXCPATCAT^
 ;primary ICD-10 code (currently null)ECXICD10P^Secondary ICD-10 Code #1 (currently null)ECXICD101^
 ;Secondary ICD-10 Code #2 (currently null)ECXICD102^Secondary ICD-10 Code #3 (currently null)ECXICD103^
 ;Secondary ICD-10 Code #4 (currently null)ECXICD104^Encounter SC ECXEXC^Vietnam Status ECXVNS^Camp Lejeune Status ECXCLST^Encounter Camp Lejeune ECXECL^
 ;Combat Service Indicator (ECXSVCI)^Combat Service Location (ECXSVCL)^
 ;Form Requested On (ECXFORM)^Unit of Issue (ECXUI)
 N DA,DIK
 S EC7=$O(^ECX(ECFILE,999999999),-1),EC7=EC7+1
 S ECODE=EC7_U_EC23_U_ECINSTSV_U_ECXDFN_U_ECXSSN_U_ECXPNM_U_ECXA_U  ;169 tjl
 S ECODE=ECODE_$$ECXDATE^ECXUTL(ECXDATE,ECXYM)_U_ECXFELOC_U
 S ECODE=ECODE_ECXFEKEY_U_ECXQTY_U_ECPTTM_U_ECPTPR_U_ECXHCPCS_U
 S ECODE=ECODE_ECXICD9_U_ECXICD91_U_ECXICD92_U_ECXICD93_U_ECXICD94_U
 S ECODE=ECODE_ECXAST_U_ECXRST_U_ECXEST_U_ECXELIG_U_ECXCTAMT_U_ECXLLC_U
 S ECODE=ECODE_ECXLMC_U_ECXBILST_U_ECXVET_U_ECXTYPE_U_ECXRQST_U_ECXRCST_U
 S ECODE=ECODE_ECXPHCPC_U
 S ECODE1=ECXZIP_U_ECXDOB_U_ECXSEX_U_ECXGRPR_U_U_ECXMPI_U
 S ECODE1=ECODE1_ECXDSSD_U_ECCLAS_U_ECXRACE_U_ECXPST_U_ECXPLOC_U
 S ECODE1=ECODE1_U_U_ECXMST_U_ECXENRL_U_ECXSTATE_U
 S ECODE1=ECODE1_ECXCNTY_U_ECASPR_U_ECCLAS2_U_U_ECXDOM_U
 S ECODE1=ECODE1_ECXCAT_U_ECXSTAT_U_$S(ECXLOGIC<2005:ECXPRIOR,1:"")_U_ECXPHI_U_ECXPOS_U
 S ECODE1=ECODE1_ECXOBS_U_ECXENC_U_ECXAOL_U_ECXCNH_U_ECXPDIV_U
 S ECODE1=ECODE1_ECXHNCI_U_ECXETH_U_ECXRC1_U
 I ECXLOGIC>2004 S ECODE1=ECODE1_U_ECXPRIOR_ECXSBGRP_U_ECXUESTA_U_ECXPTYPE_U_ECXCVE_U_ECXCVEDT_U_ECXCVENC_U_ECXNPRFI
 I ECXLOGIC>2006 S ECODE1=ECODE1_U_ECXERI_U_ECXAO_U_ECXECE_U_ECXHNC_U_ECXMIL_U_ECXIR_U
 I ECXLOGIC>2007 S ECODE2=ECXOEF_U_ECXOEFDT_U_ECXNPPDC_U_ECXNPPDT_U_ECASNPI_U_ECPTNPI
 I ECXLOGIC>2009 S ECODE2=ECODE2_U_ECXCNTRY
 I ECXLOGIC>2010 S ECODE2=ECODE2_U_ECXSHADI_U_ECXSHAD_U_ECXLH_U_ECXPATCAT
 I ECXLOGIC>2012 S ECODE2=ECODE2_U_ECXICD10P_U_ECXICD101_U_ECXICD102_U_ECXICD103_U_ECXICD104
 I ECXLOGIC>2013 S ECODE2=ECODE2_U_ECXESC_U_ECXVNS_U_ECXCLST_U_ECXECL ;144
 I ECXLOGIC>2014 S ECODE2=ECODE2_U_ECXSVCI_U_ECXSVCL ;149
 I ECXLOGIC>2015 S ECODE2=ECODE2_U_$P(ECXFORM,U,2) ;154
 I ECXLOGIC>2017 S ECODE2=ECODE2_U_$G(ECXUI) ;166
 S ^ECX(ECFILE,EC7,0)=ECODE,^ECX(ECFILE,EC7,1)=ECODE1,^ECX(ECFILE,EC7,2)=$G(ECODE2),ECRN=ECRN+1
 S DA=EC7,DIK="^ECX("_ECFILE_"," D IX1^DIK K DIK,DA
 I $D(ZTQUEUED),$$S^%ZTLOAD S QFLG=1
 Q
 ;
SETUP ;Set required input for ECXTRAC
 S ECHEAD="PRO"
 D ECXDEF^ECXUTL2(ECHEAD,.ECPACK,.ECGRP,.ECFILE,.ECRTN,.ECPIECE,.ECVER)
 S ECINST=$$PDIV^ECXPUTL
 Q
 ;
 ;**Note: LOCAL and QUE are carry over from protocols set by other
 ;        routines.
LOCAL ;to extract nightly for local use not to be transmitted to TSI
 ;QUEUE with 1D frequency
 D SETUP,^ECXTLOCL,^ECXKILL Q
 ;
QUE ; entry point for the background requeuing handled by ECXTAUTO
 D SETUP,QUE^ECXTAUTO,^ECXKILL Q
