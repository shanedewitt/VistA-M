IBDEI1E8 ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,23245,2)
 ;;=^5003806
 ;;^UTILITY(U,$J,358.3,23246,0)
 ;;=G30.9^^110^1107^4
 ;;^UTILITY(U,$J,358.3,23246,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,23246,1,3,0)
 ;;=3^Alzheimer's Disease,Unspec
 ;;^UTILITY(U,$J,358.3,23246,1,4,0)
 ;;=4^G30.9
 ;;^UTILITY(U,$J,358.3,23246,2)
 ;;=^5003808
 ;;^UTILITY(U,$J,358.3,23247,0)
 ;;=G10.^^110^1107^19
 ;;^UTILITY(U,$J,358.3,23247,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,23247,1,3,0)
 ;;=3^Huntington's Disease w/ Dementia w/ Behav Disturb
 ;;^UTILITY(U,$J,358.3,23247,1,4,0)
 ;;=4^G10.
 ;;^UTILITY(U,$J,358.3,23247,2)
 ;;=^5003751^F02.81
 ;;^UTILITY(U,$J,358.3,23248,0)
 ;;=G10.^^110^1107^20
 ;;^UTILITY(U,$J,358.3,23248,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,23248,1,3,0)
 ;;=3^Huntington's Disease w/ Dementia w/o Behav Disturb
 ;;^UTILITY(U,$J,358.3,23248,1,4,0)
 ;;=4^G10.
 ;;^UTILITY(U,$J,358.3,23248,2)
 ;;=^5003751^F02.80
 ;;^UTILITY(U,$J,358.3,23249,0)
 ;;=G90.3^^110^1107^21
 ;;^UTILITY(U,$J,358.3,23249,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,23249,1,3,0)
 ;;=3^Multi-System Degeneration of the Autonomic Nervous System
 ;;^UTILITY(U,$J,358.3,23249,1,4,0)
 ;;=4^G90.3
 ;;^UTILITY(U,$J,358.3,23249,2)
 ;;=^5004162
 ;;^UTILITY(U,$J,358.3,23250,0)
 ;;=G91.2^^110^1107^22
 ;;^UTILITY(U,$J,358.3,23250,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,23250,1,3,0)
 ;;=3^NPH w/ Dementia w/ Behav Disturb
 ;;^UTILITY(U,$J,358.3,23250,1,4,0)
 ;;=4^G91.2
 ;;^UTILITY(U,$J,358.3,23250,2)
 ;;=^5004174^F02.81
 ;;^UTILITY(U,$J,358.3,23251,0)
 ;;=G91.2^^110^1107^23
 ;;^UTILITY(U,$J,358.3,23251,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,23251,1,3,0)
 ;;=3^NPH w/ Dementia w/o Behav Disturb
 ;;^UTILITY(U,$J,358.3,23251,1,4,0)
 ;;=4^G91.2
 ;;^UTILITY(U,$J,358.3,23251,2)
 ;;=^5004174^F02.80
 ;;^UTILITY(U,$J,358.3,23252,0)
 ;;=G30.8^^110^1107^5
 ;;^UTILITY(U,$J,358.3,23252,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,23252,1,3,0)
 ;;=3^Alzheimer's Diseases NEC
 ;;^UTILITY(U,$J,358.3,23252,1,4,0)
 ;;=4^G30.8
 ;;^UTILITY(U,$J,358.3,23252,2)
 ;;=^5003807
 ;;^UTILITY(U,$J,358.3,23253,0)
 ;;=G31.09^^110^1107^16
 ;;^UTILITY(U,$J,358.3,23253,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,23253,1,3,0)
 ;;=3^Frontotemporal Dementia NEC
 ;;^UTILITY(U,$J,358.3,23253,1,4,0)
 ;;=4^G31.09
 ;;^UTILITY(U,$J,358.3,23253,2)
 ;;=^329916
 ;;^UTILITY(U,$J,358.3,23254,0)
 ;;=G20.^^110^1107^24
 ;;^UTILITY(U,$J,358.3,23254,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,23254,1,3,0)
 ;;=3^Parkinson's Disease w/ Dementia w/ Behav Disturb
 ;;^UTILITY(U,$J,358.3,23254,1,4,0)
 ;;=4^G20.
 ;;^UTILITY(U,$J,358.3,23254,2)
 ;;=^5003770^F02.81
 ;;^UTILITY(U,$J,358.3,23255,0)
 ;;=G20.^^110^1107^25
 ;;^UTILITY(U,$J,358.3,23255,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,23255,1,3,0)
 ;;=3^Parkinson's Disease w/ Dementia w/o Behav Disturb
 ;;^UTILITY(U,$J,358.3,23255,1,4,0)
 ;;=4^G20.
 ;;^UTILITY(U,$J,358.3,23255,2)
 ;;=^5003770^F02.80
 ;;^UTILITY(U,$J,358.3,23256,0)
 ;;=G31.01^^110^1107^26
 ;;^UTILITY(U,$J,358.3,23256,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,23256,1,3,0)
 ;;=3^Pick's Disease
 ;;^UTILITY(U,$J,358.3,23256,1,4,0)
 ;;=4^G31.01
 ;;^UTILITY(U,$J,358.3,23256,2)
 ;;=^329915
 ;;^UTILITY(U,$J,358.3,23257,0)
 ;;=G23.1^^110^1107^28
 ;;^UTILITY(U,$J,358.3,23257,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,23257,1,3,0)
 ;;=3^Progressive Supranuclear Ophthalmoplegia
 ;;^UTILITY(U,$J,358.3,23257,1,4,0)
 ;;=4^G23.1
 ;;^UTILITY(U,$J,358.3,23257,2)
 ;;=^5003780
 ;;^UTILITY(U,$J,358.3,23258,0)
 ;;=99211^^111^1108^1
 ;;^UTILITY(U,$J,358.3,23258,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,23258,1,1,0)
 ;;=1^Brief Office Visit