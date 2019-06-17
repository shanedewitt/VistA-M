MAGIP221 ;WOIFO/NST - Install code for MAG*3.0*221 ; FEB 25, 2019@09:15AM
 ;;3.0;IMAGING;**221**;Mar 19, 2002;Build 2461;Jan 18, 2012
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
 ; There are no environment checks here but the MAGIP221 has to be
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
 ;--- Link new remote procedures to the Broker context option.
 S CALLBACK="$$ADDRPCS^"_$NA(MAGKIDS1("RPCLSTW^"_$T(+0),"MAG WINDOWS"))
 I $$CP^MAGKIDS("MAG ATTACH RPCS P221 WIN",CALLBACK)<0 D ERROR Q
 ;
 S CALLBACK="$$ADDRPCS^"_$NA(MAGKIDS1("RPCLSTV^"_$T(+0),"MAG DICOM VISA"))
 I $$CP^MAGKIDS("MAG ATTACH RPCS P221 VISA",CALLBACK)<0 D ERROR Q
 ;
 D UPDATE ; Misc updates
 ;
 ;--- Send the notification e-mail
 D BMES^XPDUTL("Post Install Mail Message: "_$$FMTE^XLFDT($$NOW^XLFDT))
 D INS^MAGQBUT4(XPDNM,DUZ,$$NOW^XLFDT,XPDA)
 Q
 ;
 ;***** PRE-INSTALL CODE
PRE ;
 Q
 ;
 ;+++++ LIST OF NEW REMOTE PROCEDURES
 ; have a list in format ;;MAG4 IMAGE LIST
 ;
RPCLSTW ;
 ;;MAGN PRECACHE BY CPT
 ;;MAG STORAGE FETCH SET
 Q
 ;
RPCLSTV ;
 ;;MAGN PRECACHE BY CPT
 Q
 ;
UPDATE ; Misc updates
 N DIK
 L +^MAGV(2006.941):1999999
 S DIK="^MAGV(2006.941,"
 K ^MAGV(2006.941,"B")
 K ^MAGV(2006.941,"C")
 K ^MAGV(2006.941,"H")
 K ^MAGV(2006.941,"I")
 K ^MAGV(2006.941,"T")
 D IXALL^DIK  ; Rebuild all cross-references in MAG WORK ITEM file (#2006.941)
 L -^MAGV(2006.941)
 D MES^MAGKIDS("Rebuild of cross-references in MAG WORK ITEM file (#2006.941) has been completed.")
 Q
