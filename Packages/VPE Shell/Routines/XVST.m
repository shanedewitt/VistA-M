XVST ; Paideia/SMH - VPE handle timeout ;2017-08-16  10:59 AM
 ;;15.1;VICTORY PROG ENVIRONMENT;;Jun 19, 2019
 ; (c) 2010-2016 Sam Habiel
 S XVVSHC=$G(^XVEMS("QU",XVV("ID"),"TO"))
 Q:XVVSHC=""
 S:XVVSHC="HALT"!(XVVSHC="halt") XVVSHC="^"
