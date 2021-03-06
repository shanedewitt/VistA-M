MAGIP208 ;WOIFO/PMK - Install code for MAG*3.0*208 ;25 Sep 2018 7:24 AM
 ;;3.0;IMAGING;**208**;Mar 19, 2002;Build 6
 ;; Per VHA Directive 2004-038, this routine should not be modified.
 ;; +---------------------------------------------------------------+
 ;; | Property of the US Government.                                |
 ;; | No permission to copy or redistribute this software is given. |
 ;; | Use of unreleased versions of this software requires the user |
 ;; | to execute a written test agreement with the VistA Imaging    |
 ;; | Development Office of the Department of Veterans Affairs,     |
 ;; | telephone (301) 734-0100.                                     |
 ;; | The Food and Drug Administration classifies this software as  |
 ;; | a medical device.  As such, it may not be changed in any way. |
 ;; | Modifications to this software may result in an adulterated   |
 ;; | medical device under 21CFR820, the use of which is considered |
 ;; | to be a violation of US Federal Statutes.                     |
 ;; +---------------------------------------------------------------+
 ;;
 ; Supported IA #10103 reference $$FMTE^XLFDT function call
 ; Supported IA #10103 reference $$NOW^XLFDT function call
 ; Supported IA #10141 reference BMES^XPDUTL routine call
 ;
 ; There are no environment checks here but the MAGIP208 has to be
 ; referenced by the "Environment Check Routine" field of the KIDS
 ; build so that entry points of the routine are available to the
 ; KIDS during all installation phases.
 Q
 ;
 ;+++++ INSTALLATION ERROR HANDLING
ERROR ;
 S:$D(XPDNM) XPDABORT=1
 ;--- Display the messages and store them to the INSTALL file
 D DUMP^MAGUERR1(),ABTMSG^MAGKIDS()
 Q
 ;
 ;***** POST-INSTALL CODE
POS ;
 N CALLBACK
 D CLEAR^MAGUERR(1)
 ;
 W !!!,"Setting DICOM Text Gateway to use Radiology HL7 V2.4 protocols -- PASS 1"
 W !!,"Removing MAG SEND ORU subscriber(s) from RA RPT, RA RPT 2.3 and RA RPT 2.4"
 D MAGIP208^MAGDHPS ; set the Radiology HL7 V2.4 for MAG SEND ORM
 W !!!,"Setting DICOM Text Gateway to use Radiology HL7 V2.4 protocols -- PASS 2"
 D MAGIP208^MAGDHPS ; run twice to remove any incorrect settings
 ;
 ;
 ;--- Send the notification e-mail
 D BMES^XPDUTL("Post Install Mail Message: "_$$FMTE^XLFDT($$NOW^XLFDT))
 D INS^MAGQBUT4(XPDNM,DUZ,$$NOW^XLFDT,XPDA)
 Q
 ;
 ;***** PRE-INSTALL CODE
PRE ;
 Q
