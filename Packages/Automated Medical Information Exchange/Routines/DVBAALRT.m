DVBAALRT ;ALB/THM-ALERT RO REPORTS THAT ARE READY ; 1/16/91  7:11 AM
 ;;2.7;AMIE;**193**;Apr 10, 1995;Build 84
EN I '$D(IOF) D HOME^%ZIS
 D DUZ2^DVBAUTIL I $D(DVBAQUIT) K DVBAQUIT,DVBAD2 Q
 I $D(^DVB(396.2,"C",DVBAD2,"R")) W !!,*7,"You have new NOTICES OF DISCHARGE to print.",! H 2
 ;AJF;Request Status conversion
 I $D(^DVB(396.3,"AF",4,DUZ(2))) W !!,*7,"You have new C&P EXAM REPORTS to print.",! H 2
 I $D(^DVB(396,"AC",DVBAD2,"R")) W !!,*7,"You have new 21-DAY CERTIFICATES to print.",! H 2
 Q
