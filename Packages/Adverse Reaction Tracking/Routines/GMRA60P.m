GMRA60P ;BP/KAM - ALLERGY/ADVERSE REACTION PATCH GMRA*4.0*60 POST-INSTALL ; 7/12/19 2:26pm
 ;;4.0;Adverse Reaction Tracking;**60**;Mar 29, 1996;Build 13
 ; Post Install routine to review the 120.86 file for mismatches
 ; between the Record IEN and the .01 Field and email the results
 ; to the installer and holders of the GMRA-ALLERGY VERIFY and
 ; GMRA-SUPERVISOR keys
 Q 
EN ; Compare file IEN and .01 Field for mismatches
 N GMRAIEN,GMRAFLD1,CNT,FOUND,XMY,XMDUZ,XMSUB,XMTEXT,DIFROM,MSG
 S GMRAFLD1=0,CNT=15,FOUND=0
 D EMAILHDR
 F  S GMRAFLD1=$O(^GMR(120.86,"B",GMRAFLD1)) Q:GMRAFLD1=""  D
 . S GMRAIEN=0
 . F  S GMRAIEN=$O(^GMR(120.86,"B",GMRAFLD1,GMRAIEN)) Q:GMRAIEN=""  D
 .. I GMRAFLD1'=GMRAIEN S FOUND=1 D EMAILDET
 I 'FOUND D EMAILNF
 D EMAILSND
 K GMRAIEN,GMRAFLD1,CNT,FOUND
 Q
EMAILHDR ; Send email to Installer denoting any mismatches between Field 1 and the record subscript.
 S XMSUB="GMRA*4.0*60 - ADVERSE REACTION ASSESSMENT file Mismatch Check"
 S XMDUZ="Patch GMRA*4.0*60"
 S XMY(DUZ)="" ; Installer as recipient
 D CHKKEYS
 S MSG($J,"GMRA60P",1)="This email has been generated by a post-"
 S MSG($J,"GMRA60P",2)="install routine from patch GMRA*4.0*60"
 S MSG($J,"GMRA60P",3)="for the purpose of alerting the installer to"
 S MSG($J,"GMRA60P",4)="mismatches between the IEN and the NAME (#.01) field"
 S MSG($J,"GMRA60P",5)="in the ADVERSE REACTION ASSESSMENT (#120.86) file."
 S MSG($J,"GMRA60P",6)="     "
 S MSG($J,"GMRA60P",7)="This email is also being delivered to holders of"
 S MSG($J,"GMRA60P",8)="the GMRA-ALLERGY VERIFY and GMRA-SUPERVISOR keys"
 S MSG($J,"GMRA60P",9)="for informational purposes only."
 S MSG($J,"GMRA60P",10)="     "
 S MSG($J,"GMRA60P",11)="These records need to be reviewed for deletion via FileMan."
 S MSG($J,"GMRA60P",12)="Please review the Patch Description for GMRA*4.0*60 for additional details."
 S MSG($J,"GMRA60P",13)="     "
 S MSG($J,"GMRA60P",14)="Record Number (IEN)"_"        "_"NAME(#.01) field"
 S MSG($J,"GMRA60P",15)="     "
 Q
EMAILDET ;
 S CNT=CNT+1
 S MSG($J,"GMRA60P",CNT)="     "_$G(GMRAIEN)_"                "_$G(GMRAFLD1)
 Q
EMAILNF ;
 S MSG($J,"GMRA60P",16)="No mismatches found."
 Q
EMAILSND ;
 S XMTEXT="MSG($J,""GMRA60P"","
 D ^XMD
 K MSG($J,"GMRA60P"),XMY,XMDUZ,XMSUB,XMTEXT
 Q
CHKKEYS ; Check to see who holds the GMRA-ALLERGY VERIFY and/or the
 ; GMRA-SUPERVISOR keys and add to the XMY array as an email recipient
 N VAIEN,ZEROREC,KEY1,KEY2
 S KEY1="",KEY1=$O(^DIC(19.1,"B","GMRA-ALLERGY VERIFY",KEY1))
 S KEY2="",KEY2=$O(^DIC(19.1,"B","GMRA-SUPERVISOR",KEY2))
 S VAIEN=0
 F  S VAIEN=$O(^VA(200,VAIEN)) Q:VAIEN=""  D
 . S ZEROREC=$G(^VA(200,VAIEN,0))
 . I $P(ZEROREC,"^",7)=1 Q  ; Disusered (no email)
 . I $P(ZEROREC,"^",11)'="" Q  ;Termination Date Found (no email)
 . ; Check for keys (GMRA-ALLERGY VERIFY/GMRA-SUPERVISOR)
 . I ($D(^VA(200,VAIEN,51,KEY1)))!($D(^VA(200,VAIEN,51,KEY2))) D
 .. S XMY(VAIEN)=""
 Q
