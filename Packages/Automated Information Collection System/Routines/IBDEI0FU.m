IBDEI0FU ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,7002,1,4,0)
 ;;=4^D04.8
 ;;^UTILITY(U,$J,358.3,7002,2)
 ;;=^5001924
 ;;^UTILITY(U,$J,358.3,7003,0)
 ;;=L72.0^^46^459^40
 ;;^UTILITY(U,$J,358.3,7003,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7003,1,3,0)
 ;;=3^Cyst,Epidermal
 ;;^UTILITY(U,$J,358.3,7003,1,4,0)
 ;;=4^L72.0
 ;;^UTILITY(U,$J,358.3,7003,2)
 ;;=^5009277
 ;;^UTILITY(U,$J,358.3,7004,0)
 ;;=L72.11^^46^459^42
 ;;^UTILITY(U,$J,358.3,7004,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7004,1,3,0)
 ;;=3^Cyst,Pilar
 ;;^UTILITY(U,$J,358.3,7004,1,4,0)
 ;;=4^L72.11
 ;;^UTILITY(U,$J,358.3,7004,2)
 ;;=^5009278
 ;;^UTILITY(U,$J,358.3,7005,0)
 ;;=L72.12^^46^459^44
 ;;^UTILITY(U,$J,358.3,7005,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7005,1,3,0)
 ;;=3^Cyst,Trichodermal
 ;;^UTILITY(U,$J,358.3,7005,1,4,0)
 ;;=4^L72.12
 ;;^UTILITY(U,$J,358.3,7005,2)
 ;;=^5009279
 ;;^UTILITY(U,$J,358.3,7006,0)
 ;;=L72.3^^46^459^43
 ;;^UTILITY(U,$J,358.3,7006,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7006,1,3,0)
 ;;=3^Cyst,Sebaceous
 ;;^UTILITY(U,$J,358.3,7006,1,4,0)
 ;;=4^L72.3
 ;;^UTILITY(U,$J,358.3,7006,2)
 ;;=^5009281
 ;;^UTILITY(U,$J,358.3,7007,0)
 ;;=A63.0^^46^459^36
 ;;^UTILITY(U,$J,358.3,7007,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7007,1,3,0)
 ;;=3^Condyloma
 ;;^UTILITY(U,$J,358.3,7007,1,4,0)
 ;;=4^A63.0
 ;;^UTILITY(U,$J,358.3,7007,2)
 ;;=^5000360
 ;;^UTILITY(U,$J,358.3,7008,0)
 ;;=L84.^^46^459^1
 ;;^UTILITY(U,$J,358.3,7008,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7008,1,3,0)
 ;;=3^Callus
 ;;^UTILITY(U,$J,358.3,7008,1,4,0)
 ;;=4^L84.
 ;;^UTILITY(U,$J,358.3,7008,2)
 ;;=^271920
 ;;^UTILITY(U,$J,358.3,7009,0)
 ;;=L03.314^^46^459^22
 ;;^UTILITY(U,$J,358.3,7009,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7009,1,3,0)
 ;;=3^Cellulitis of Groin
 ;;^UTILITY(U,$J,358.3,7009,1,4,0)
 ;;=4^L03.314
 ;;^UTILITY(U,$J,358.3,7009,2)
 ;;=^5009050
 ;;^UTILITY(U,$J,358.3,7010,0)
 ;;=A63.0^^46^459^37
 ;;^UTILITY(U,$J,358.3,7010,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7010,1,3,0)
 ;;=3^Condyloma
 ;;^UTILITY(U,$J,358.3,7010,1,4,0)
 ;;=4^A63.0
 ;;^UTILITY(U,$J,358.3,7010,2)
 ;;=^5000360
 ;;^UTILITY(U,$J,358.3,7011,0)
 ;;=M71.30^^46^459^39
 ;;^UTILITY(U,$J,358.3,7011,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7011,1,3,0)
 ;;=3^Cyst,Digital Mucous
 ;;^UTILITY(U,$J,358.3,7011,1,4,0)
 ;;=4^M71.30
 ;;^UTILITY(U,$J,358.3,7011,2)
 ;;=^5013149
 ;;^UTILITY(U,$J,358.3,7012,0)
 ;;=B07.0^^46^460^2
 ;;^UTILITY(U,$J,358.3,7012,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7012,1,3,0)
 ;;=3^Wart,Plantar
 ;;^UTILITY(U,$J,358.3,7012,1,4,0)
 ;;=4^B07.0
 ;;^UTILITY(U,$J,358.3,7012,2)
 ;;=^336720
 ;;^UTILITY(U,$J,358.3,7013,0)
 ;;=B07.8^^46^460^3
 ;;^UTILITY(U,$J,358.3,7013,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7013,1,3,0)
 ;;=3^Wart,Viral
 ;;^UTILITY(U,$J,358.3,7013,1,4,0)
 ;;=4^B07.8
 ;;^UTILITY(U,$J,358.3,7013,2)
 ;;=^5000518
 ;;^UTILITY(U,$J,358.3,7014,0)
 ;;=A63.0^^46^460^1
 ;;^UTILITY(U,$J,358.3,7014,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7014,1,3,0)
 ;;=3^Wart,Anogenital
 ;;^UTILITY(U,$J,358.3,7014,1,4,0)
 ;;=4^A63.0
 ;;^UTILITY(U,$J,358.3,7014,2)
 ;;=^5000360
 ;;^UTILITY(U,$J,358.3,7015,0)
 ;;=D23.9^^46^461^33
 ;;^UTILITY(U,$J,358.3,7015,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7015,1,3,0)
 ;;=3^Benign Neop Skin,Unspec
 ;;^UTILITY(U,$J,358.3,7015,1,4,0)
 ;;=4^D23.9
 ;;^UTILITY(U,$J,358.3,7015,2)
 ;;=^5002076
 ;;^UTILITY(U,$J,358.3,7016,0)
 ;;=D21.9^^46^461^19
 ;;^UTILITY(U,$J,358.3,7016,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,7016,1,3,0)
 ;;=3^Benign Neop Connective/Soft Tissue,Unspec
 ;;^UTILITY(U,$J,358.3,7016,1,4,0)
 ;;=4^D21.9
 ;;^UTILITY(U,$J,358.3,7016,2)
 ;;=^5002040