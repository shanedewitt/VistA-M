IBDEI0O5 ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,11041,1,4,0)
 ;;=4^A69.20
 ;;^UTILITY(U,$J,358.3,11041,2)
 ;;=^5000375
 ;;^UTILITY(U,$J,358.3,11042,0)
 ;;=A69.22^^68^677^52
 ;;^UTILITY(U,$J,358.3,11042,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11042,1,3,0)
 ;;=3^Neurologic Disorders d/t Lyme Disease
 ;;^UTILITY(U,$J,358.3,11042,1,4,0)
 ;;=4^A69.22
 ;;^UTILITY(U,$J,358.3,11042,2)
 ;;=^5000377
 ;;^UTILITY(U,$J,358.3,11043,0)
 ;;=A69.21^^68^677^51
 ;;^UTILITY(U,$J,358.3,11043,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11043,1,3,0)
 ;;=3^Meningitis d/t Lyme Disease
 ;;^UTILITY(U,$J,358.3,11043,1,4,0)
 ;;=4^A69.21
 ;;^UTILITY(U,$J,358.3,11043,2)
 ;;=^5000376
 ;;^UTILITY(U,$J,358.3,11044,0)
 ;;=A69.29^^68^677^18
 ;;^UTILITY(U,$J,358.3,11044,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11044,1,3,0)
 ;;=3^Conditions d/t Lyme Disease
 ;;^UTILITY(U,$J,358.3,11044,1,4,0)
 ;;=4^A69.29
 ;;^UTILITY(U,$J,358.3,11044,2)
 ;;=^5000379
 ;;^UTILITY(U,$J,358.3,11045,0)
 ;;=A69.23^^68^677^5
 ;;^UTILITY(U,$J,358.3,11045,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11045,1,3,0)
 ;;=3^Arthritis d/t Lyme Disease
 ;;^UTILITY(U,$J,358.3,11045,1,4,0)
 ;;=4^A69.23
 ;;^UTILITY(U,$J,358.3,11045,2)
 ;;=^5000378
 ;;^UTILITY(U,$J,358.3,11046,0)
 ;;=A51.0^^68^677^29
 ;;^UTILITY(U,$J,358.3,11046,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11046,1,3,0)
 ;;=3^Genital Syphilis,Primary
 ;;^UTILITY(U,$J,358.3,11046,1,4,0)
 ;;=4^A51.0
 ;;^UTILITY(U,$J,358.3,11046,2)
 ;;=^5000272
 ;;^UTILITY(U,$J,358.3,11047,0)
 ;;=A52.3^^68^677^54
 ;;^UTILITY(U,$J,358.3,11047,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11047,1,3,0)
 ;;=3^Neurosyphilis,Unspec
 ;;^UTILITY(U,$J,358.3,11047,1,4,0)
 ;;=4^A52.3
 ;;^UTILITY(U,$J,358.3,11047,2)
 ;;=^5000298
 ;;^UTILITY(U,$J,358.3,11048,0)
 ;;=A52.10^^68^677^53
 ;;^UTILITY(U,$J,358.3,11048,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11048,1,3,0)
 ;;=3^Neurosyphilis Symptomatic,Unspec
 ;;^UTILITY(U,$J,358.3,11048,1,4,0)
 ;;=4^A52.10
 ;;^UTILITY(U,$J,358.3,11048,2)
 ;;=^5000291
 ;;^UTILITY(U,$J,358.3,11049,0)
 ;;=A52.9^^68^677^49
 ;;^UTILITY(U,$J,358.3,11049,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11049,1,3,0)
 ;;=3^Late Syphilis,Unspec
 ;;^UTILITY(U,$J,358.3,11049,1,4,0)
 ;;=4^A52.9
 ;;^UTILITY(U,$J,358.3,11049,2)
 ;;=^5000308
 ;;^UTILITY(U,$J,358.3,11050,0)
 ;;=A53.9^^68^677^79
 ;;^UTILITY(U,$J,358.3,11050,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11050,1,3,0)
 ;;=3^Syphilis,Unspec
 ;;^UTILITY(U,$J,358.3,11050,1,4,0)
 ;;=4^A53.9
 ;;^UTILITY(U,$J,358.3,11050,2)
 ;;=^5000310
 ;;^UTILITY(U,$J,358.3,11051,0)
 ;;=B37.3^^68^677^17
 ;;^UTILITY(U,$J,358.3,11051,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11051,1,3,0)
 ;;=3^Candidiasis Vulva/Vagina
 ;;^UTILITY(U,$J,358.3,11051,1,4,0)
 ;;=4^B37.3
 ;;^UTILITY(U,$J,358.3,11051,2)
 ;;=^5000615
 ;;^UTILITY(U,$J,358.3,11052,0)
 ;;=B58.9^^68^677^82
 ;;^UTILITY(U,$J,358.3,11052,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11052,1,3,0)
 ;;=3^Toxoplasmosis,Unspec
 ;;^UTILITY(U,$J,358.3,11052,1,4,0)
 ;;=4^B58.9
 ;;^UTILITY(U,$J,358.3,11052,2)
 ;;=^5000733
 ;;^UTILITY(U,$J,358.3,11053,0)
 ;;=A59.01^^68^677^83
 ;;^UTILITY(U,$J,358.3,11053,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11053,1,3,0)
 ;;=3^Trichomonal Vulvovaginitis
 ;;^UTILITY(U,$J,358.3,11053,1,4,0)
 ;;=4^A59.01
 ;;^UTILITY(U,$J,358.3,11053,2)
 ;;=^121763
 ;;^UTILITY(U,$J,358.3,11054,0)
 ;;=B59.^^68^677^66
 ;;^UTILITY(U,$J,358.3,11054,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11054,1,3,0)
 ;;=3^Pneumocystosis
 ;;^UTILITY(U,$J,358.3,11054,1,4,0)
 ;;=4^B59.
 ;;^UTILITY(U,$J,358.3,11054,2)
 ;;=^5000734
 ;;^UTILITY(U,$J,358.3,11055,0)
 ;;=H83.09^^68^677^48