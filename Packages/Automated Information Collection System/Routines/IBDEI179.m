IBDEI179 ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,20043,2)
 ;;=^5059559
 ;;^UTILITY(U,$J,358.3,20044,0)
 ;;=W06.XXXD^^94^935^30
 ;;^UTILITY(U,$J,358.3,20044,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20044,1,3,0)
 ;;=3^Fall from Bed,Subs Encntr
 ;;^UTILITY(U,$J,358.3,20044,1,4,0)
 ;;=4^W06.XXXD
 ;;^UTILITY(U,$J,358.3,20044,2)
 ;;=^5059560
 ;;^UTILITY(U,$J,358.3,20045,0)
 ;;=W07.XXXA^^94^935^37
 ;;^UTILITY(U,$J,358.3,20045,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20045,1,3,0)
 ;;=3^Fall from Chair,Init Encntr
 ;;^UTILITY(U,$J,358.3,20045,1,4,0)
 ;;=4^W07.XXXA
 ;;^UTILITY(U,$J,358.3,20045,2)
 ;;=^5059562
 ;;^UTILITY(U,$J,358.3,20046,0)
 ;;=W07.XXXD^^94^935^38
 ;;^UTILITY(U,$J,358.3,20046,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20046,1,3,0)
 ;;=3^Fall from Chair,Subs Encntr
 ;;^UTILITY(U,$J,358.3,20046,1,4,0)
 ;;=4^W07.XXXD
 ;;^UTILITY(U,$J,358.3,20046,2)
 ;;=^5059563
 ;;^UTILITY(U,$J,358.3,20047,0)
 ;;=W10.1XXA^^94^935^81
 ;;^UTILITY(U,$J,358.3,20047,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20047,1,3,0)
 ;;=3^Fall on Sidewalk Curb,Init Encntr
 ;;^UTILITY(U,$J,358.3,20047,1,4,0)
 ;;=4^W10.1XXA
 ;;^UTILITY(U,$J,358.3,20047,2)
 ;;=^5059583
 ;;^UTILITY(U,$J,358.3,20048,0)
 ;;=W10.1XXD^^94^935^82
 ;;^UTILITY(U,$J,358.3,20048,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20048,1,3,0)
 ;;=3^Fall on Sidewalk Curb,Subs Encntr
 ;;^UTILITY(U,$J,358.3,20048,1,4,0)
 ;;=4^W10.1XXD
 ;;^UTILITY(U,$J,358.3,20048,2)
 ;;=^5059584
 ;;^UTILITY(U,$J,358.3,20049,0)
 ;;=W11.XXXA^^94^935^41
 ;;^UTILITY(U,$J,358.3,20049,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20049,1,3,0)
 ;;=3^Fall from Ladder,Init Encntr
 ;;^UTILITY(U,$J,358.3,20049,1,4,0)
 ;;=4^W11.XXXA
 ;;^UTILITY(U,$J,358.3,20049,2)
 ;;=^5059595
 ;;^UTILITY(U,$J,358.3,20050,0)
 ;;=W11.XXXD^^94^935^42
 ;;^UTILITY(U,$J,358.3,20050,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20050,1,3,0)
 ;;=3^Fall from Ladder,Subs Encntr
 ;;^UTILITY(U,$J,358.3,20050,1,4,0)
 ;;=4^W11.XXXD
 ;;^UTILITY(U,$J,358.3,20050,2)
 ;;=^5059596
 ;;^UTILITY(U,$J,358.3,20051,0)
 ;;=W13.0XXA^^94^935^67
 ;;^UTILITY(U,$J,358.3,20051,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20051,1,3,0)
 ;;=3^Fall from/through Balcony,Init Encntr
 ;;^UTILITY(U,$J,358.3,20051,1,4,0)
 ;;=4^W13.0XXA
 ;;^UTILITY(U,$J,358.3,20051,2)
 ;;=^5059601
 ;;^UTILITY(U,$J,358.3,20052,0)
 ;;=W13.0XXD^^94^935^68
 ;;^UTILITY(U,$J,358.3,20052,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20052,1,3,0)
 ;;=3^Fall from/through Balcony,Subs Encntr
 ;;^UTILITY(U,$J,358.3,20052,1,4,0)
 ;;=4^W13.0XXD
 ;;^UTILITY(U,$J,358.3,20052,2)
 ;;=^5059602
 ;;^UTILITY(U,$J,358.3,20053,0)
 ;;=W13.1XXA^^94^935^31
 ;;^UTILITY(U,$J,358.3,20053,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20053,1,3,0)
 ;;=3^Fall from Bridge,Init Encntr
 ;;^UTILITY(U,$J,358.3,20053,1,4,0)
 ;;=4^W13.1XXA
 ;;^UTILITY(U,$J,358.3,20053,2)
 ;;=^5059604
 ;;^UTILITY(U,$J,358.3,20054,0)
 ;;=W13.1XXD^^94^935^32
 ;;^UTILITY(U,$J,358.3,20054,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20054,1,3,0)
 ;;=3^Fall from Bridge,Subs Encntr
 ;;^UTILITY(U,$J,358.3,20054,1,4,0)
 ;;=4^W13.1XXD
 ;;^UTILITY(U,$J,358.3,20054,2)
 ;;=^5059605
 ;;^UTILITY(U,$J,358.3,20055,0)
 ;;=W13.2XXA^^94^935^69
 ;;^UTILITY(U,$J,358.3,20055,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20055,1,3,0)
 ;;=3^Fall from/through Roof,Init Encntr
 ;;^UTILITY(U,$J,358.3,20055,1,4,0)
 ;;=4^W13.2XXA
 ;;^UTILITY(U,$J,358.3,20055,2)
 ;;=^5059607
 ;;^UTILITY(U,$J,358.3,20056,0)
 ;;=W13.2XXD^^94^935^70
 ;;^UTILITY(U,$J,358.3,20056,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20056,1,3,0)
 ;;=3^Fall from/through Roof,Subs Encntr
 ;;^UTILITY(U,$J,358.3,20056,1,4,0)
 ;;=4^W13.2XXD
