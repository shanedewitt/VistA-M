IBDEI0GX ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,7559,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7559,1,3,0)
 ;;=3^Hematuria,Unspec
 ;;^UTILITY(U,$J,358.3,7559,1,4,0)
 ;;=4^R31.9
 ;;^UTILITY(U,$J,358.3,7559,2)
 ;;=^5019328
 ;;^UTILITY(U,$J,358.3,7560,0)
 ;;=R80.0^^52^506^9
 ;;^UTILITY(U,$J,358.3,7560,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7560,1,3,0)
 ;;=3^Isolated Proteinuria
 ;;^UTILITY(U,$J,358.3,7560,1,4,0)
 ;;=4^R80.0
 ;;^UTILITY(U,$J,358.3,7560,2)
 ;;=^5019595
 ;;^UTILITY(U,$J,358.3,7561,0)
 ;;=R39.14^^52^506^8
 ;;^UTILITY(U,$J,358.3,7561,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7561,1,3,0)
 ;;=3^Incomplete Bladder Emptying
 ;;^UTILITY(U,$J,358.3,7561,1,4,0)
 ;;=4^R39.14
 ;;^UTILITY(U,$J,358.3,7561,2)
 ;;=^5019344
 ;;^UTILITY(U,$J,358.3,7562,0)
 ;;=R31.2^^52^506^10
 ;;^UTILITY(U,$J,358.3,7562,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7562,1,3,0)
 ;;=3^Microscopic Hematuria,Other
 ;;^UTILITY(U,$J,358.3,7562,1,4,0)
 ;;=4^R31.2
 ;;^UTILITY(U,$J,358.3,7562,2)
 ;;=^5019327
 ;;^UTILITY(U,$J,358.3,7563,0)
 ;;=R35.1^^52^506^11
 ;;^UTILITY(U,$J,358.3,7563,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7563,1,3,0)
 ;;=3^Nocturia
 ;;^UTILITY(U,$J,358.3,7563,1,4,0)
 ;;=4^R35.1
 ;;^UTILITY(U,$J,358.3,7563,2)
 ;;=^5019335
 ;;^UTILITY(U,$J,358.3,7564,0)
 ;;=R80.1^^52^506^13
 ;;^UTILITY(U,$J,358.3,7564,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7564,1,3,0)
 ;;=3^Persistent Proteinuria,Unspec
 ;;^UTILITY(U,$J,358.3,7564,1,4,0)
 ;;=4^R80.1
 ;;^UTILITY(U,$J,358.3,7564,2)
 ;;=^5019596
 ;;^UTILITY(U,$J,358.3,7565,0)
 ;;=R35.8^^52^506^14
 ;;^UTILITY(U,$J,358.3,7565,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7565,1,3,0)
 ;;=3^Polyuria,Other
 ;;^UTILITY(U,$J,358.3,7565,1,4,0)
 ;;=4^R35.8
 ;;^UTILITY(U,$J,358.3,7565,2)
 ;;=^5019336
 ;;^UTILITY(U,$J,358.3,7566,0)
 ;;=R80.2^^52^506^12
 ;;^UTILITY(U,$J,358.3,7566,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7566,1,3,0)
 ;;=3^Orthostatic Proteinuria,Unspec
 ;;^UTILITY(U,$J,358.3,7566,1,4,0)
 ;;=4^R80.2
 ;;^UTILITY(U,$J,358.3,7566,2)
 ;;=^5019597
 ;;^UTILITY(U,$J,358.3,7567,0)
 ;;=R80.8^^52^506^15
 ;;^UTILITY(U,$J,358.3,7567,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7567,1,3,0)
 ;;=3^Proteinuria,Other
 ;;^UTILITY(U,$J,358.3,7567,1,4,0)
 ;;=4^R80.8
 ;;^UTILITY(U,$J,358.3,7567,2)
 ;;=^5019598
 ;;^UTILITY(U,$J,358.3,7568,0)
 ;;=R39.16^^52^506^16
 ;;^UTILITY(U,$J,358.3,7568,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7568,1,3,0)
 ;;=3^Straining on Urination
 ;;^UTILITY(U,$J,358.3,7568,1,4,0)
 ;;=4^R39.16
 ;;^UTILITY(U,$J,358.3,7568,2)
 ;;=^5019346
 ;;^UTILITY(U,$J,358.3,7569,0)
 ;;=R35.0^^52^506^18
 ;;^UTILITY(U,$J,358.3,7569,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7569,1,3,0)
 ;;=3^Urinary Frequency
 ;;^UTILITY(U,$J,358.3,7569,1,4,0)
 ;;=4^R35.0
 ;;^UTILITY(U,$J,358.3,7569,2)
 ;;=^5019334
 ;;^UTILITY(U,$J,358.3,7570,0)
 ;;=R39.11^^52^506^19
 ;;^UTILITY(U,$J,358.3,7570,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7570,1,3,0)
 ;;=3^Urinary Hesitancy
 ;;^UTILITY(U,$J,358.3,7570,1,4,0)
 ;;=4^R39.11
 ;;^UTILITY(U,$J,358.3,7570,2)
 ;;=^5019341
 ;;^UTILITY(U,$J,358.3,7571,0)
 ;;=N39.41^^52^506^22
 ;;^UTILITY(U,$J,358.3,7571,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7571,1,3,0)
 ;;=3^Urinary Urge Incontinence
 ;;^UTILITY(U,$J,358.3,7571,1,4,0)
 ;;=4^N39.41
 ;;^UTILITY(U,$J,358.3,7571,2)
 ;;=^5015680
 ;;^UTILITY(U,$J,358.3,7572,0)
 ;;=N13.8^^52^506^20
 ;;^UTILITY(U,$J,358.3,7572,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7572,1,3,0)
 ;;=3^Urinary Obstruction
 ;;^UTILITY(U,$J,358.3,7572,1,4,0)
 ;;=4^N13.8
 ;;^UTILITY(U,$J,358.3,7572,2)
 ;;=^5015588
 ;;^UTILITY(U,$J,358.3,7573,0)
 ;;=R33.8^^52^506^21
