IBDEI20I ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,33706,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,33706,1,1,0)
 ;;=1^Comp;High Complexity
 ;;^UTILITY(U,$J,358.3,33706,1,2,0)
 ;;=2^99220
 ;;^UTILITY(U,$J,358.3,33707,0)
 ;;=99234^^152^1689^1
 ;;^UTILITY(U,$J,358.3,33707,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,33707,1,1,0)
 ;;=1^Inpt/OBS Same D Adm/DC-Low
 ;;^UTILITY(U,$J,358.3,33707,1,2,0)
 ;;=2^99234
 ;;^UTILITY(U,$J,358.3,33708,0)
 ;;=99235^^152^1689^2
 ;;^UTILITY(U,$J,358.3,33708,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,33708,1,1,0)
 ;;=1^Inpt/OBS Same D Adm/DC-Mod
 ;;^UTILITY(U,$J,358.3,33708,1,2,0)
 ;;=2^99235
 ;;^UTILITY(U,$J,358.3,33709,0)
 ;;=99236^^152^1689^3
 ;;^UTILITY(U,$J,358.3,33709,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,33709,1,1,0)
 ;;=1^Inpt/OBS Same D Adm/DC-High
 ;;^UTILITY(U,$J,358.3,33709,1,2,0)
 ;;=2^99236
 ;;^UTILITY(U,$J,358.3,33710,0)
 ;;=99251^^152^1690^1
 ;;^UTILITY(U,$J,358.3,33710,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,33710,1,1,0)
 ;;=1^Prob Focused
 ;;^UTILITY(U,$J,358.3,33710,1,2,0)
 ;;=2^99251
 ;;^UTILITY(U,$J,358.3,33711,0)
 ;;=99252^^152^1690^2
 ;;^UTILITY(U,$J,358.3,33711,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,33711,1,1,0)
 ;;=1^Exp Prob Focused
 ;;^UTILITY(U,$J,358.3,33711,1,2,0)
 ;;=2^99252
 ;;^UTILITY(U,$J,358.3,33712,0)
 ;;=99253^^152^1690^3
 ;;^UTILITY(U,$J,358.3,33712,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,33712,1,1,0)
 ;;=1^Detailed
 ;;^UTILITY(U,$J,358.3,33712,1,2,0)
 ;;=2^99253
 ;;^UTILITY(U,$J,358.3,33713,0)
 ;;=99254^^152^1690^4
 ;;^UTILITY(U,$J,358.3,33713,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,33713,1,1,0)
 ;;=1^Comp/Mod MDM
 ;;^UTILITY(U,$J,358.3,33713,1,2,0)
 ;;=2^99254
 ;;^UTILITY(U,$J,358.3,33714,0)
 ;;=99255^^152^1690^5
 ;;^UTILITY(U,$J,358.3,33714,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,33714,1,1,0)
 ;;=1^Comp/High Complex MDM
 ;;^UTILITY(U,$J,358.3,33714,1,2,0)
 ;;=2^99255
 ;;^UTILITY(U,$J,358.3,33715,0)
 ;;=99221^^152^1691^1
 ;;^UTILITY(U,$J,358.3,33715,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,33715,1,1,0)
 ;;=1^Detailed/Comp HX/Exam;Straight MDM
 ;;^UTILITY(U,$J,358.3,33715,1,2,0)
 ;;=2^99221
 ;;^UTILITY(U,$J,358.3,33716,0)
 ;;=99222^^152^1691^2
 ;;^UTILITY(U,$J,358.3,33716,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,33716,1,1,0)
 ;;=1^Detailed/Comp HX/Exam;Mod MDM
 ;;^UTILITY(U,$J,358.3,33716,1,2,0)
 ;;=2^99222
 ;;^UTILITY(U,$J,358.3,33717,0)
 ;;=99223^^152^1691^3
 ;;^UTILITY(U,$J,358.3,33717,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,33717,1,1,0)
 ;;=1^Comp HX/Exam;High Complex MDM
 ;;^UTILITY(U,$J,358.3,33717,1,2,0)
 ;;=2^99223
 ;;^UTILITY(U,$J,358.3,33718,0)
 ;;=99231^^152^1692^1
 ;;^UTILITY(U,$J,358.3,33718,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,33718,1,1,0)
 ;;=1^Prob Foc HX/Exam;Straight MDM
 ;;^UTILITY(U,$J,358.3,33718,1,2,0)
 ;;=2^99231
 ;;^UTILITY(U,$J,358.3,33719,0)
 ;;=99232^^152^1692^2
 ;;^UTILITY(U,$J,358.3,33719,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,33719,1,1,0)
 ;;=1^Exp Prob Foc HX/Exam;Mod MDM
 ;;^UTILITY(U,$J,358.3,33719,1,2,0)
 ;;=2^99232
 ;;^UTILITY(U,$J,358.3,33720,0)
 ;;=99233^^152^1692^3
 ;;^UTILITY(U,$J,358.3,33720,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,33720,1,1,0)
 ;;=1^Comp HS/Exam;High Complex MDM
 ;;^UTILITY(U,$J,358.3,33720,1,2,0)
 ;;=2^99233
 ;;^UTILITY(U,$J,358.3,33721,0)
 ;;=99238^^152^1693^1
 ;;^UTILITY(U,$J,358.3,33721,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,33721,1,1,0)
 ;;=1^D/C Day Mgmt;< 31min
 ;;^UTILITY(U,$J,358.3,33721,1,2,0)
 ;;=2^99238
 ;;^UTILITY(U,$J,358.3,33722,0)
 ;;=99239^^152^1693^2
 ;;^UTILITY(U,$J,358.3,33722,1,0)
 ;;=^358.31IA^2^2