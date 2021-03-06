MAGSIXG1 ;WOIFO/EdM/GEK/SEB/SG/NST - LIST OF IMAGES RPCS ; JUN 11, 2018@11:43 AM
 ;;3.0;IMAGING;**8,48,59,93,117,221**;Mar 19, 2002;Build 2238;Jul 15, 2011
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
 Q
 ;
 ;+++++ FORMATS RPC ERRORS
ERRORS(RESULTS,RC) ;
 S:$G(RC)'<0 RC=$$FIRSTERR^MAGUERR1()
 D RPCERRS^MAGUERR1(.RESULTS,RC)
 Q
 ;
 ;***** RETURNS THE LIST OF IMAGE DESCRIPTORS
 ; RPC: MAG4 IMAGE LIST
 ;
 ; .MAGOUT       Reference to a local variable where the results
 ;               are returned to.
 ;
 ; FLAGS         Flags that control the execution (can be combined):
 ;
 ;                 C  Capture date range. If this flag is provided,
 ;                    then the remote procedure uses values of the
 ;                    FROMDATE and TODATE parameters to select images
 ;                    that were captured in this date range.
 ;
 ;                    Otherwise, values of those parameters are
 ;                    treated as the date range when procedures were
 ;                    performed.
 ;
 ;                 D  Include only deleted images (file #2005.1)
 ;                 E  Include only existing images (file #2005)
 ;
 ;                 S  Return the sparse subset of images captured by
 ;                    the user defined by the MISCPRMS("SAVEDBY").
 ;                    The latter becomes required in this case.
 ;
 ;                 G  Include Group Images in the list of images returned. 
 ;                    If any image in a group has an image that matches the 
 ;                    status provided in the search criteria then 
 ;                    the group will be returned.
 ;                    
 ;                    If the G flag is not set then only the status of the 
 ;                    Group entry will be checked and the group will be 
 ;                    returned if it passes.
 ;
 ;                    See description of the MAG4 IMAGE LIST remote
 ;                    procedure for details.
 ;
 ;               If neither 'E' nor 'D' flag is provided, then an
 ;               error code is returned.
 ;
 ; [FROMDATE]    Date range for image selection. Dates can be in
 ; [TODATE]      internal or external FileMan format. If a date
 ;               parameter is not defined or empty, then the date
 ;               range remains open on the corresponding side.
 ;
 ;               Time parts of parameter values are ignored and both
 ;               ends of the date range are included in the search.
 ;               For example, in order to search images for May 21,
 ;               2008, the internal value of both parameters should
 ;               be 3080521.
 ;
 ;               If the FROMDATE is after the TODATE, then values of
 ;               the parameters are swapped.
 ;
 ; [MAXNUM]      If this parameter is defined and greater than 0,
 ;               then it determines the maximum number of images
 ;               returned by the call.
 ;
 ;               If the S flag is included in the value of the FLAGS
 ;               parameter, then the MAXNUM parameter must be defined
 ;               and greater than 0. Its value determines percentage
 ;               of preselected images to be returned in the result
 ;               array.
 ;
 ;               See description of the MAG4 IMAGE LIST remote
 ;               procedure for details.
 ;
 ; [.MISCPRMS]   Reference to a local variable that stores misc.
 ;               parameters that define the image selection criteria.
 ;               See the description of the MAG4 IMAGE LIST remote
 ;               procedure for details.
 ;
 ; Return Values
 ; =============
 ;     
 ; If MAGOUT(0) is defined and its 1st '^'-piece is 0, then an error
 ; occurred during execution of the procedure. In this case, the array
 ; is formatted as described in the comments to the RPCERRS^MAGUERR1.
 ;  
 ; See description of the MAG4 IMAGE LIST remote procedure for more
 ; details.
 ;
 ; Notes
 ; =====
 ;
 ; Temporary global nodes ^TMP("MAGSIX1",$J) and ^TMP("MAGSIXG3",$J)
 ; are used by this procedure.
 ;
 ; If the number of images conforming to the filter reaches 76, all
 ; results are stored in the ^TMP("MAGSIXG1",$J) global node, closed
 ; reference is assigned to the MAGOUT parameter, and the type of the
 ; RPC return parameter is changed to 'GLOBAL ARRAY'.
 ;
GETIMGS(MAGOUT,FLAGS,FROMDATE,TODATE,MAXNUM,MISCPRMS) ;RPC [MAG4 IMAGE LIST]
 N MAGDATA       ; Array for passing the data to the callback
 ;               ; function of the image query (including the
 ;               ; image selection criteria).
 ;
 N ERROR,MISC,QF,RC,TMP
 S (MAGDATA("RESCNT"),RC)=0,MAGDATA="MAGOUT"  K MAGOUT
 D CLEAR^MAGUERR(1),NETPLCS^MAGGTU6
 K ^TMP("MAGSIXG3",$J)
 ;
 S MAXNUM=$G(MAXNUM)
 ;=== Validate parameters
 S ERROR=$$VALPARAM(.MAGDATA,FLAGS,.FROMDATE,.TODATE,MAXNUM,.MISCPRMS)
 ;
 ;--- Check for errors
 I ERROR D ERROR^MAGUERR(-30),ERRORS(.MAGOUT)  Q
 ;
 S MAXNUM=+$G(MAXNUM)
 ;
 ;=== Query the image file(s)
 S MAGDATA("FLAGS")=FLAGS,MAGDATA("MAXNUM")=MAXNUM
 S TMP=$S(TODATE<9999999:$$FMADD^XLFDT(TODATE,1),1:TODATE)
 S QF=$$TRFLAGS^MAGUTL05(FLAGS,"CDEG")
 S RC=$$QUERY^MAGGI13("$$QRYCBK^MAGSIXG3",QF,.MAGDATA,FROMDATE,TMP,+$G(MAGDATA("IDFN")))
 I RC<0  D ERRORS(.MAGOUT,RC)  Q
 ;
 ;=== Post-processing for the sparse subset query
 I FLAGS["S"  D  I RC<0  D ERRORS(.MAGOUT,RC)  Q
 . S RC=$$SUBSET^MAGSIXG4()
 . Q
 ;
 ;=== Cleanup
 K ^TMP("MAGSIXG3",$J)
 S TMP=$$FLTDESC^MAGSIXG2(.MAGDATA,FROMDATE(0),TODATE(0),FLAGS)
 I 'MAGDATA("RESCNT")  D ERRORS(.MAGOUT,$$ERROR^MAGUERR(-19,,TMP))  Q
 S @MAGDATA@(0)="1^"_TMP_$S($G(MAGDATA("MAXNUM")):U_(RC>0),1:"")
 S @MAGDATA@(1)=$$BLDHDR^MAGSIXG2()
 Q
 ;
 ;***** GET IMAGES FOR THE PATIENT
 ; RPC: MAG4 PAT GET IMAGES
 ;
 ; .MAGOUT       Reference to a local variable where the results
 ;               are returned to.
 ;
 ; DFN           Patient IEN (DFN)
 ;       
 ; [PKG]         Package index(es)
 ; [CLASS]       Class index(es)
 ; [TYPE]        Type index(es)
 ; [EVENT]       Procedure/Event index(es)
 ; [SPEC]        Speciality/SubSpecialty index(es)
 ;
 ; [FROMDATE]    Date range for image selection. See description
 ; [TODATE]      of the GETIMGS^MAGSIXG1 entry point for details.
 ;
 ; [ORIGIN]      Origin index(es)
 ;
 ; [DATA]        Reserved for future use.
 ;
 ; [FLAGS]       Flags that control the execution (can be combined):
 ;
 ;                 D  Include only deleted images (file #2005.1)
 ;                 E  Include only existing images (file #2005)
 ;
 ;               By default ($G(FLAGS)=""), the "E" value is assumed.
 ; 
 ; Return Values
 ; =============
 ;
 ; See description of the MAG4 PAT GET IMAGES remote procedure.
 ;
PGI(MAGOUT,DFN,PKG,CLASS,TYPE,EVENT,SPEC,FROMDATE,TODATE,ORIGIN,DATA,FLAGS) ;RPC [MAG4 PAT GET IMAGES]
 N I,MISCPRMS
 K MAGOUT  S I=0
 ;--- Check the patient IEN (DFN)
 I $G(DFN)'>0  D ERRORS(.MAGOUT,$$IPVE^MAGUERR("DFN"))  Q
 S I=I+1,MISCPRMS(I)="IDFN^^"_(+DFN)
 ;--- Check the flags
 S:$G(FLAGS)="" FLAGS="E"
 I $TR(FLAGS,"DE")'=""  D ERRORS(.MAGOUT,$$IPVE^MAGUERR("FLAGS"))  Q
 ;--- Pass the filter parameters through
 S:$G(PKG)'="" I=I+1,MISCPRMS(I)="IXPKG^^"_$TR(PKG,",","^")
 S:$G(CLASS)'="" I=I+1,MISCPRMS(I)="IXCLASS^^"_$TR(CLASS,",","^")
 S:$G(TYPE)'="" I=I+1,MISCPRMS(I)="IXTYPE^^"_$TR(TYPE,",","^")
 S:$G(EVENT)'="" I=I+1,MISCPRMS(I)="IXPROC^^"_$TR(EVENT,",","^")
 S:$G(SPEC)'="" I=I+1,MISCPRMS(I)="IXSPEC^^"_$TR(SPEC,",","^")
 S:$G(ORIGIN)'="" I=I+1,MISCPRMS(I)="IXORIGIN^^"_$TR(ORIGIN,",","^")
 ;--- Call the new remote procedure implementation
 D GETIMGS(.MAGOUT,FLAGS,.FROMDATE,.TODATE,,.MISCPRMS)
 Q
 ;
VALPARAM(MAGDATA,FLAGS,FROMDATE,TODATE,MAXNUM,MISCPRMS)  ; Validate input parameters
 N ERROR,MISC,MISCDEFS,RC,TMP
 ;--- Control flags
 S ERROR=0
 S FLAGS=$G(FLAGS)
 I $TR(FLAGS,"CDESG")'=""  D  S ERROR=1
 . D IPVE^MAGUERR("FLAGS")     ; Unknown/Unsupported flag(s)
 . Q
 I $TR(FLAGS,"DE")=FLAGS  D  S ERROR=1
 . D ERROR^MAGUERR(-6,,"D,E")  ; Missing required flag
 . Q
 ;--- Date range
 S:$$DTRANGE^MAGUTL03(.FROMDATE,.TODATE)<0 ERROR=1
 ;--- Miscellaneous parameters
 S RC=$$LDMPDEFS^MAGUTL01(.MISCDEFS,"MISCDEFS^MAGSIXG2")
 I RC<0  S ERROR=1  Q
 S RC=$$RPCMISC^MAGUTL02(.MISCPRMS,.MISC,.MISCDEFS,"UV")
 I RC<0  S ERROR=1  Q
 S:$$VALMISC^MAGSIXG2(.MISC,.MAGDATA)<0 ERROR=1
 ;--- Number/percentage of results
 I $G(MAXNUM)<0  D
 . D IPVE^MAGUERR("MAXNUM")  S ERROR=1
 . Q
 E  I FLAGS["S"  D
 . ;--- Check the percentage
 . S TMP=+$G(MAXNUM)
 . I 'TMP!(TMP>100)  D IPVE^MAGUERR("MAXNUM")  S ERROR=1  Q
 . S MAGDATA("SUBSET%")=TMP,MAXNUM=0
 . ;--- User filter is required for this query
 . S TMP=$NA(MAGDATA("SAVEDBY"))
 . I $G(@TMP)'>0  D ERROR^MAGUERR(-8,,TMP)  S ERROR=1  Q
 . Q
 ;
 Q ERROR
