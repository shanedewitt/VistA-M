IBDEI30J ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,50508,2)
 ;;=^5004159
 ;;^UTILITY(U,$J,358.3,50509,0)
 ;;=G89.18^^219^2452^1
 ;;^UTILITY(U,$J,358.3,50509,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,50509,1,3,0)
 ;;=3^Acute Postprocedural Pain
 ;;^UTILITY(U,$J,358.3,50509,1,4,0)
 ;;=4^G89.18
 ;;^UTILITY(U,$J,358.3,50509,2)
 ;;=^5004154
 ;;^UTILITY(U,$J,358.3,50510,0)
 ;;=M25.552^^219^2452^3
 ;;^UTILITY(U,$J,358.3,50510,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,50510,1,3,0)
 ;;=3^Left Hip Pain
 ;;^UTILITY(U,$J,358.3,50510,1,4,0)
 ;;=4^M25.552
 ;;^UTILITY(U,$J,358.3,50510,2)
 ;;=^5011612
 ;;^UTILITY(U,$J,358.3,50511,0)
 ;;=M25.562^^219^2452^4
 ;;^UTILITY(U,$J,358.3,50511,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,50511,1,3,0)
 ;;=3^Left Knee Pain
 ;;^UTILITY(U,$J,358.3,50511,1,4,0)
 ;;=4^M25.562
 ;;^UTILITY(U,$J,358.3,50511,2)
 ;;=^5011615
 ;;^UTILITY(U,$J,358.3,50512,0)
 ;;=M25.551^^219^2452^6
 ;;^UTILITY(U,$J,358.3,50512,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,50512,1,3,0)
 ;;=3^Right Hip Pain
 ;;^UTILITY(U,$J,358.3,50512,1,4,0)
 ;;=4^M25.551
 ;;^UTILITY(U,$J,358.3,50512,2)
 ;;=^5011611
 ;;^UTILITY(U,$J,358.3,50513,0)
 ;;=M25.561^^219^2452^7
 ;;^UTILITY(U,$J,358.3,50513,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,50513,1,3,0)
 ;;=3^Right Knee Pain
 ;;^UTILITY(U,$J,358.3,50513,1,4,0)
 ;;=4^M25.561
 ;;^UTILITY(U,$J,358.3,50513,2)
 ;;=^5011614
 ;;^UTILITY(U,$J,358.3,50514,0)
 ;;=J94.1^^219^2453^1
 ;;^UTILITY(U,$J,358.3,50514,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,50514,1,3,0)
 ;;=3^Fibrothorax
 ;;^UTILITY(U,$J,358.3,50514,1,4,0)
 ;;=4^J94.1
 ;;^UTILITY(U,$J,358.3,50514,2)
 ;;=^5008317
 ;;^UTILITY(U,$J,358.3,50515,0)
 ;;=C45.0^^219^2453^2
 ;;^UTILITY(U,$J,358.3,50515,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,50515,1,3,0)
 ;;=3^Pleura Mesothelioma
 ;;^UTILITY(U,$J,358.3,50515,1,4,0)
 ;;=4^C45.0
 ;;^UTILITY(U,$J,358.3,50515,2)
 ;;=^5001095
 ;;^UTILITY(U,$J,358.3,50516,0)
 ;;=J94.8^^219^2453^4
 ;;^UTILITY(U,$J,358.3,50516,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,50516,1,3,0)
 ;;=3^Pleural Conditions NEC
 ;;^UTILITY(U,$J,358.3,50516,1,4,0)
 ;;=4^J94.8
 ;;^UTILITY(U,$J,358.3,50516,2)
 ;;=^5008319
 ;;^UTILITY(U,$J,358.3,50517,0)
 ;;=J94.9^^219^2453^3
 ;;^UTILITY(U,$J,358.3,50517,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,50517,1,3,0)
 ;;=3^Pleural Condition,Unspec
 ;;^UTILITY(U,$J,358.3,50517,1,4,0)
 ;;=4^J94.9
 ;;^UTILITY(U,$J,358.3,50517,2)
 ;;=^5008320
 ;;^UTILITY(U,$J,358.3,50518,0)
 ;;=J91.8^^219^2453^6
 ;;^UTILITY(U,$J,358.3,50518,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,50518,1,3,0)
 ;;=3^Pleural Effusion in Conditions Classified Elsewhere
 ;;^UTILITY(U,$J,358.3,50518,1,4,0)
 ;;=4^J91.8
 ;;^UTILITY(U,$J,358.3,50518,2)
 ;;=^5008311
 ;;^UTILITY(U,$J,358.3,50519,0)
 ;;=J90.^^219^2453^5
 ;;^UTILITY(U,$J,358.3,50519,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,50519,1,3,0)
 ;;=3^Pleural Effusion NEC
 ;;^UTILITY(U,$J,358.3,50519,1,4,0)
 ;;=4^J90.
 ;;^UTILITY(U,$J,358.3,50519,2)
 ;;=^5008310
 ;;^UTILITY(U,$J,358.3,50520,0)
 ;;=J92.0^^219^2453^7
 ;;^UTILITY(U,$J,358.3,50520,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,50520,1,3,0)
 ;;=3^Pleural Plaque w/ Presence of Asbestos
 ;;^UTILITY(U,$J,358.3,50520,1,4,0)
 ;;=4^J92.0
 ;;^UTILITY(U,$J,358.3,50520,2)
 ;;=^5008312
 ;;^UTILITY(U,$J,358.3,50521,0)
 ;;=J92.9^^219^2453^8
 ;;^UTILITY(U,$J,358.3,50521,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,50521,1,3,0)
 ;;=3^Pleural Plaque w/o Asbestos
 ;;^UTILITY(U,$J,358.3,50521,1,4,0)
 ;;=4^J92.9
 ;;^UTILITY(U,$J,358.3,50521,2)
 ;;=^5008313
 ;;^UTILITY(U,$J,358.3,50522,0)
 ;;=R09.1^^219^2453^9
 ;;^UTILITY(U,$J,358.3,50522,1,0)
 ;;=^358.31IA^4^2