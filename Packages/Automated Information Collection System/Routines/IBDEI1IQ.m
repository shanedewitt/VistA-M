IBDEI1IQ ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,25376,1,4,0)
 ;;=4^C50.911
 ;;^UTILITY(U,$J,358.3,25376,2)
 ;;=^5001195
 ;;^UTILITY(U,$J,358.3,25377,0)
 ;;=C50.912^^124^1246^36
 ;;^UTILITY(U,$J,358.3,25377,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,25377,1,3,0)
 ;;=3^Malig Neop of Female Breast,Left
 ;;^UTILITY(U,$J,358.3,25377,1,4,0)
 ;;=4^C50.912
 ;;^UTILITY(U,$J,358.3,25377,2)
 ;;=^5001196
 ;;^UTILITY(U,$J,358.3,25378,0)
 ;;=C50.921^^124^1246^43
 ;;^UTILITY(U,$J,358.3,25378,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,25378,1,3,0)
 ;;=3^Malig Neop of Male Breast,Right
 ;;^UTILITY(U,$J,358.3,25378,1,4,0)
 ;;=4^C50.921
 ;;^UTILITY(U,$J,358.3,25378,2)
 ;;=^5001198
 ;;^UTILITY(U,$J,358.3,25379,0)
 ;;=C50.922^^124^1246^42
 ;;^UTILITY(U,$J,358.3,25379,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,25379,1,3,0)
 ;;=3^Malig Neop of Male Breast,Left
 ;;^UTILITY(U,$J,358.3,25379,1,4,0)
 ;;=4^C50.922
 ;;^UTILITY(U,$J,358.3,25379,2)
 ;;=^5133340
 ;;^UTILITY(U,$J,358.3,25380,0)
 ;;=C46.9^^124^1246^17
 ;;^UTILITY(U,$J,358.3,25380,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,25380,1,3,0)
 ;;=3^Kaposi's Sarcoma,Unspec
 ;;^UTILITY(U,$J,358.3,25380,1,4,0)
 ;;=4^C46.9
 ;;^UTILITY(U,$J,358.3,25380,2)
 ;;=^5001108
 ;;^UTILITY(U,$J,358.3,25381,0)
 ;;=C61.^^124^1246^49
 ;;^UTILITY(U,$J,358.3,25381,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,25381,1,3,0)
 ;;=3^Malig Neop of Prostate
 ;;^UTILITY(U,$J,358.3,25381,1,4,0)
 ;;=4^C61.
 ;;^UTILITY(U,$J,358.3,25381,2)
 ;;=^267239
 ;;^UTILITY(U,$J,358.3,25382,0)
 ;;=C62.10^^124^1246^33
 ;;^UTILITY(U,$J,358.3,25382,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,25382,1,3,0)
 ;;=3^Malig Neop of Descended Testis,Unspec
 ;;^UTILITY(U,$J,358.3,25382,1,4,0)
 ;;=4^C62.10
 ;;^UTILITY(U,$J,358.3,25382,2)
 ;;=^5001233
 ;;^UTILITY(U,$J,358.3,25383,0)
 ;;=C62.90^^124^1246^54
 ;;^UTILITY(U,$J,358.3,25383,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,25383,1,3,0)
 ;;=3^Malig Neop of Testis,Unspec
 ;;^UTILITY(U,$J,358.3,25383,1,4,0)
 ;;=4^C62.90
 ;;^UTILITY(U,$J,358.3,25383,2)
 ;;=^5001236
 ;;^UTILITY(U,$J,358.3,25384,0)
 ;;=C67.9^^124^1246^28
 ;;^UTILITY(U,$J,358.3,25384,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,25384,1,3,0)
 ;;=3^Malig Neop of Bladder,Unspec
 ;;^UTILITY(U,$J,358.3,25384,1,4,0)
 ;;=4^C67.9
 ;;^UTILITY(U,$J,358.3,25384,2)
 ;;=^5001263
 ;;^UTILITY(U,$J,358.3,25385,0)
 ;;=C64.9^^124^1246^39
 ;;^UTILITY(U,$J,358.3,25385,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,25385,1,3,0)
 ;;=3^Malig Neop of Kidney,Except Renal Pelvis,Unspec
 ;;^UTILITY(U,$J,358.3,25385,1,4,0)
 ;;=4^C64.9
 ;;^UTILITY(U,$J,358.3,25385,2)
 ;;=^5001250
 ;;^UTILITY(U,$J,358.3,25386,0)
 ;;=C71.9^^124^1246^29
 ;;^UTILITY(U,$J,358.3,25386,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,25386,1,3,0)
 ;;=3^Malig Neop of Brain,Unspec
 ;;^UTILITY(U,$J,358.3,25386,1,4,0)
 ;;=4^C71.9
 ;;^UTILITY(U,$J,358.3,25386,2)
 ;;=^5001297
 ;;^UTILITY(U,$J,358.3,25387,0)
 ;;=C77.9^^124^1246^56
 ;;^UTILITY(U,$J,358.3,25387,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,25387,1,3,0)
 ;;=3^Malig/Secondary Neop of Lymph Node,Unspec
 ;;^UTILITY(U,$J,358.3,25387,1,4,0)
 ;;=4^C77.9
 ;;^UTILITY(U,$J,358.3,25387,2)
 ;;=^5001333
 ;;^UTILITY(U,$J,358.3,25388,0)
 ;;=C78.01^^124^1246^86
 ;;^UTILITY(U,$J,358.3,25388,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,25388,1,3,0)
 ;;=3^Secondary Malig Neop of Lung,Right
 ;;^UTILITY(U,$J,358.3,25388,1,4,0)
 ;;=4^C78.01
 ;;^UTILITY(U,$J,358.3,25388,2)
 ;;=^5001335
 ;;^UTILITY(U,$J,358.3,25389,0)
 ;;=C78.02^^124^1246^85
 ;;^UTILITY(U,$J,358.3,25389,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,25389,1,3,0)
 ;;=3^Secondary Malig Neop of Lung,Left