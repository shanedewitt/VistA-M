IBDEI1VK ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,31396,1,1,0)
 ;;=1^EXPAND PROB FOCUS HX & EXAM;SF MDM
 ;;^UTILITY(U,$J,358.3,31396,1,2,0)
 ;;=2^99242
 ;;^UTILITY(U,$J,358.3,31397,0)
 ;;=99243^^137^1411^3
 ;;^UTILITY(U,$J,358.3,31397,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,31397,1,1,0)
 ;;=1^DETAILED HX & EXAM;LOW COMPLEX MDM
 ;;^UTILITY(U,$J,358.3,31397,1,2,0)
 ;;=2^99243
 ;;^UTILITY(U,$J,358.3,31398,0)
 ;;=99244^^137^1411^4
 ;;^UTILITY(U,$J,358.3,31398,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,31398,1,1,0)
 ;;=1^COMPREH HX & EXAM;MOD COMPLEX MDM
 ;;^UTILITY(U,$J,358.3,31398,1,2,0)
 ;;=2^99244
 ;;^UTILITY(U,$J,358.3,31399,0)
 ;;=99245^^137^1411^5
 ;;^UTILITY(U,$J,358.3,31399,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,31399,1,1,0)
 ;;=1^COMPREH HX & EXAM;HIGH COMPLEX MDM
 ;;^UTILITY(U,$J,358.3,31399,1,2,0)
 ;;=2^99245
 ;;^UTILITY(U,$J,358.3,31400,0)
 ;;=99201^^137^1412^1
 ;;^UTILITY(U,$J,358.3,31400,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,31400,1,1,0)
 ;;=1^PROBLEM FOCUSED HX & EXAM;SF MDM
 ;;^UTILITY(U,$J,358.3,31400,1,2,0)
 ;;=2^99201
 ;;^UTILITY(U,$J,358.3,31401,0)
 ;;=99202^^137^1412^2
 ;;^UTILITY(U,$J,358.3,31401,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,31401,1,1,0)
 ;;=1^EXPAND PROB FOCUS HX & EXAM;SF MDM
 ;;^UTILITY(U,$J,358.3,31401,1,2,0)
 ;;=2^99202
 ;;^UTILITY(U,$J,358.3,31402,0)
 ;;=99203^^137^1412^3
 ;;^UTILITY(U,$J,358.3,31402,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,31402,1,1,0)
 ;;=1^DETAILED HX & EXAM;LOW COMPLEX MDM
 ;;^UTILITY(U,$J,358.3,31402,1,2,0)
 ;;=2^99203
 ;;^UTILITY(U,$J,358.3,31403,0)
 ;;=99204^^137^1412^4
 ;;^UTILITY(U,$J,358.3,31403,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,31403,1,1,0)
 ;;=1^COMPREH HX & EXAM;MOD COMPLEX MDM
 ;;^UTILITY(U,$J,358.3,31403,1,2,0)
 ;;=2^99204
 ;;^UTILITY(U,$J,358.3,31404,0)
 ;;=99205^^137^1412^5
 ;;^UTILITY(U,$J,358.3,31404,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,31404,1,1,0)
 ;;=1^COMPREH HX & EXAM;HIGH COMPLEX MDM
 ;;^UTILITY(U,$J,358.3,31404,1,2,0)
 ;;=2^99205
 ;;^UTILITY(U,$J,358.3,31405,0)
 ;;=99251^^137^1413^1
 ;;^UTILITY(U,$J,358.3,31405,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,31405,1,1,0)
 ;;=1^PROBLEM FOCUSED HX & EXAM;SF MDM
 ;;^UTILITY(U,$J,358.3,31405,1,2,0)
 ;;=2^99251
 ;;^UTILITY(U,$J,358.3,31406,0)
 ;;=99252^^137^1413^2
 ;;^UTILITY(U,$J,358.3,31406,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,31406,1,1,0)
 ;;=1^EXPAN PROB FOCUS HX & EXAM;SF MDM
 ;;^UTILITY(U,$J,358.3,31406,1,2,0)
 ;;=2^99252
 ;;^UTILITY(U,$J,358.3,31407,0)
 ;;=99253^^137^1413^3
 ;;^UTILITY(U,$J,358.3,31407,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,31407,1,1,0)
 ;;=1^DETAILED HX & EXAM;LOW COMPLEX MDM
 ;;^UTILITY(U,$J,358.3,31407,1,2,0)
 ;;=2^99253
 ;;^UTILITY(U,$J,358.3,31408,0)
 ;;=99254^^137^1413^4
 ;;^UTILITY(U,$J,358.3,31408,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,31408,1,1,0)
 ;;=1^COMPREH HX & EXAM;MOD COMPLEX MDM
 ;;^UTILITY(U,$J,358.3,31408,1,2,0)
 ;;=2^99254
 ;;^UTILITY(U,$J,358.3,31409,0)
 ;;=99255^^137^1413^5
 ;;^UTILITY(U,$J,358.3,31409,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,31409,1,1,0)
 ;;=1^COMPREH HX & EXAM;HIGH COMPLEX MDM
 ;;^UTILITY(U,$J,358.3,31409,1,2,0)
 ;;=2^99255
 ;;^UTILITY(U,$J,358.3,31410,0)
 ;;=99221^^137^1414^1
 ;;^UTILITY(U,$J,358.3,31410,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,31410,1,1,0)
 ;;=1^DETAILED OR COMPREH HX & EXAM;SF OR LOW COMPLEX MDM
 ;;^UTILITY(U,$J,358.3,31410,1,2,0)
 ;;=2^99221
 ;;^UTILITY(U,$J,358.3,31411,0)
 ;;=99222^^137^1414^2
 ;;^UTILITY(U,$J,358.3,31411,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,31411,1,1,0)
 ;;=1^COMPREH HX & EXAM;MOD COMPLEX MDM
 ;;^UTILITY(U,$J,358.3,31411,1,2,0)
 ;;=2^99222