IBDEI0GN ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,7424,1,2,0)
 ;;=2^90935
 ;;^UTILITY(U,$J,358.3,7424,1,3,0)
 ;;=3^HEMODIALYSIS SINGLE EVAL
 ;;^UTILITY(U,$J,358.3,7425,0)
 ;;=90937^^51^497^2^^^^1
 ;;^UTILITY(U,$J,358.3,7425,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7425,1,2,0)
 ;;=2^90937
 ;;^UTILITY(U,$J,358.3,7425,1,3,0)
 ;;=3^HEMODIALYSIS REPEATED EVAL
 ;;^UTILITY(U,$J,358.3,7426,0)
 ;;=Z49.31^^52^498^1
 ;;^UTILITY(U,$J,358.3,7426,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7426,1,3,0)
 ;;=3^Adequacy Testing for Hemodialysis
 ;;^UTILITY(U,$J,358.3,7426,1,4,0)
 ;;=4^Z49.31
 ;;^UTILITY(U,$J,358.3,7426,2)
 ;;=^5063058
 ;;^UTILITY(U,$J,358.3,7427,0)
 ;;=N18.6^^52^498^3
 ;;^UTILITY(U,$J,358.3,7427,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7427,1,3,0)
 ;;=3^ESRD
 ;;^UTILITY(U,$J,358.3,7427,1,4,0)
 ;;=4^N18.6
 ;;^UTILITY(U,$J,358.3,7427,2)
 ;;=^303986
 ;;^UTILITY(U,$J,358.3,7428,0)
 ;;=Z99.2^^52^498^2
 ;;^UTILITY(U,$J,358.3,7428,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7428,1,3,0)
 ;;=3^Dependence on Renal Dialysis
 ;;^UTILITY(U,$J,358.3,7428,1,4,0)
 ;;=4^Z99.2
 ;;^UTILITY(U,$J,358.3,7428,2)
 ;;=^5063758
 ;;^UTILITY(U,$J,358.3,7429,0)
 ;;=Z91.15^^52^498^4
 ;;^UTILITY(U,$J,358.3,7429,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7429,1,3,0)
 ;;=3^Patient's Noncompliance w/ Renal Dialysis
 ;;^UTILITY(U,$J,358.3,7429,1,4,0)
 ;;=4^Z91.15
 ;;^UTILITY(U,$J,358.3,7429,2)
 ;;=^5063617
 ;;^UTILITY(U,$J,358.3,7430,0)
 ;;=Z49.32^^52^499^1
 ;;^UTILITY(U,$J,358.3,7430,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7430,1,3,0)
 ;;=3^Adequacy Testing for Peritoneal Dialysis
 ;;^UTILITY(U,$J,358.3,7430,1,4,0)
 ;;=4^Z49.32
 ;;^UTILITY(U,$J,358.3,7430,2)
 ;;=^5063059
 ;;^UTILITY(U,$J,358.3,7431,0)
 ;;=N18.6^^52^499^2
 ;;^UTILITY(U,$J,358.3,7431,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7431,1,3,0)
 ;;=3^ESRD
 ;;^UTILITY(U,$J,358.3,7431,1,4,0)
 ;;=4^N18.6
 ;;^UTILITY(U,$J,358.3,7431,2)
 ;;=^303986
 ;;^UTILITY(U,$J,358.3,7432,0)
 ;;=I25.10^^52^500^3
 ;;^UTILITY(U,$J,358.3,7432,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7432,1,3,0)
 ;;=3^Athscl Hrt Disease,Native Coronary Artery w/o Angina Pectoris
 ;;^UTILITY(U,$J,358.3,7432,1,4,0)
 ;;=4^I25.10
 ;;^UTILITY(U,$J,358.3,7432,2)
 ;;=^5007107
 ;;^UTILITY(U,$J,358.3,7433,0)
 ;;=I42.8^^52^500^7
 ;;^UTILITY(U,$J,358.3,7433,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7433,1,3,0)
 ;;=3^Cardiomyopathy,Other
 ;;^UTILITY(U,$J,358.3,7433,1,4,0)
 ;;=4^I42.8
 ;;^UTILITY(U,$J,358.3,7433,2)
 ;;=^5007199
 ;;^UTILITY(U,$J,358.3,7434,0)
 ;;=I48.91^^52^500^4
 ;;^UTILITY(U,$J,358.3,7434,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7434,1,3,0)
 ;;=3^Atrial Fibrillation,Unspec
 ;;^UTILITY(U,$J,358.3,7434,1,4,0)
 ;;=4^I48.91
 ;;^UTILITY(U,$J,358.3,7434,2)
 ;;=^5007229
 ;;^UTILITY(U,$J,358.3,7435,0)
 ;;=I49.8^^52^500^6
 ;;^UTILITY(U,$J,358.3,7435,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7435,1,3,0)
 ;;=3^Cardiac Arrhythmias,Other Spec
 ;;^UTILITY(U,$J,358.3,7435,1,4,0)
 ;;=4^I49.8
 ;;^UTILITY(U,$J,358.3,7435,2)
 ;;=^5007236
 ;;^UTILITY(U,$J,358.3,7436,0)
 ;;=R00.1^^52^500^5
 ;;^UTILITY(U,$J,358.3,7436,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7436,1,3,0)
 ;;=3^Bradycardia,Unspec
 ;;^UTILITY(U,$J,358.3,7436,1,4,0)
 ;;=4^R00.1
 ;;^UTILITY(U,$J,358.3,7436,2)
 ;;=^5019164
 ;;^UTILITY(U,$J,358.3,7437,0)
 ;;=I50.9^^52^500^13
 ;;^UTILITY(U,$J,358.3,7437,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7437,1,3,0)
 ;;=3^Heart Failure,Unspec
 ;;^UTILITY(U,$J,358.3,7437,1,4,0)
 ;;=4^I50.9
 ;;^UTILITY(U,$J,358.3,7437,2)
 ;;=^5007251
 ;;^UTILITY(U,$J,358.3,7438,0)
 ;;=I95.1^^52^500^14
 ;;^UTILITY(U,$J,358.3,7438,1,0)
 ;;=^358.31IA^4^2