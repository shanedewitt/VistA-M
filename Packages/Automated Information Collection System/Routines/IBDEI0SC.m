IBDEI0SC ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,13040,1,3,0)
 ;;=3^Breakdown of Ocular Prosthetic Device/Implant/Graft,Init Encntr
 ;;^UTILITY(U,$J,358.3,13040,1,4,0)
 ;;=4^T85.318A
 ;;^UTILITY(U,$J,358.3,13040,2)
 ;;=^5055541
 ;;^UTILITY(U,$J,358.3,13041,0)
 ;;=T85.328A^^80^753^59
 ;;^UTILITY(U,$J,358.3,13041,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,13041,1,3,0)
 ;;=3^Displacement of Ocular Prosthetic Device/Implant/Graft,Init Encntr
 ;;^UTILITY(U,$J,358.3,13041,1,4,0)
 ;;=4^T85.328A
 ;;^UTILITY(U,$J,358.3,13041,2)
 ;;=^5055550
 ;;^UTILITY(U,$J,358.3,13042,0)
 ;;=H11.013^^80^753^2
 ;;^UTILITY(U,$J,358.3,13042,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,13042,1,3,0)
 ;;=3^Amyloid Pterygium,Bilateral
 ;;^UTILITY(U,$J,358.3,13042,1,4,0)
 ;;=4^H11.013
 ;;^UTILITY(U,$J,358.3,13042,2)
 ;;=^5004722
 ;;^UTILITY(U,$J,358.3,13043,0)
 ;;=H21.513^^80^753^6
 ;;^UTILITY(U,$J,358.3,13043,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,13043,1,3,0)
 ;;=3^Anterior Synechiae,Bilateral
 ;;^UTILITY(U,$J,358.3,13043,1,4,0)
 ;;=4^H21.513
 ;;^UTILITY(U,$J,358.3,13043,2)
 ;;=^5005241
 ;;^UTILITY(U,$J,358.3,13044,0)
 ;;=H18.423^^80^753^12
 ;;^UTILITY(U,$J,358.3,13044,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,13044,1,3,0)
 ;;=3^Band Keratopathy,Bilateral
 ;;^UTILITY(U,$J,358.3,13044,1,4,0)
 ;;=4^H18.423
 ;;^UTILITY(U,$J,358.3,13044,2)
 ;;=^5005068
 ;;^UTILITY(U,$J,358.3,13045,0)
 ;;=H10.503^^80^753^19
 ;;^UTILITY(U,$J,358.3,13045,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,13045,1,3,0)
 ;;=3^Blepharoconjunctivitis,Bilateral,Unspec
 ;;^UTILITY(U,$J,358.3,13045,1,4,0)
 ;;=4^H10.503
 ;;^UTILITY(U,$J,358.3,13045,2)
 ;;=^5004699
 ;;^UTILITY(U,$J,358.3,13046,0)
 ;;=H18.13^^80^753^23
 ;;^UTILITY(U,$J,358.3,13046,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,13046,1,3,0)
 ;;=3^Bullous Keratopathy,Bilateral
 ;;^UTILITY(U,$J,358.3,13046,1,4,0)
 ;;=4^H18.13
 ;;^UTILITY(U,$J,358.3,13046,2)
 ;;=^5005034
 ;;^UTILITY(U,$J,358.3,13047,0)
 ;;=H17.13^^80^753^26
 ;;^UTILITY(U,$J,358.3,13047,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,13047,1,3,0)
 ;;=3^Central Corneal Opacity,Bilateral
 ;;^UTILITY(U,$J,358.3,13047,1,4,0)
 ;;=4^H17.13
 ;;^UTILITY(U,$J,358.3,13047,2)
 ;;=^5004993
 ;;^UTILITY(U,$J,358.3,13048,0)
 ;;=H16.013^^80^753^29
 ;;^UTILITY(U,$J,358.3,13048,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,13048,1,3,0)
 ;;=3^Central Corneal Ulcer,Bilateral
 ;;^UTILITY(U,$J,358.3,13048,1,4,0)
 ;;=4^H16.013
 ;;^UTILITY(U,$J,358.3,13048,2)
 ;;=^5004872
 ;;^UTILITY(U,$J,358.3,13049,0)
 ;;=H11.123^^80^753^32
 ;;^UTILITY(U,$J,358.3,13049,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,13049,1,3,0)
 ;;=3^Conjunctival Concretions,Bilateral
 ;;^UTILITY(U,$J,358.3,13049,1,4,0)
 ;;=4^H11.123
 ;;^UTILITY(U,$J,358.3,13049,2)
 ;;=^5004751
 ;;^UTILITY(U,$J,358.3,13050,0)
 ;;=H11.443^^80^753^35
 ;;^UTILITY(U,$J,358.3,13050,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,13050,1,3,0)
 ;;=3^Conjunctival Cysts,Bilateral
 ;;^UTILITY(U,$J,358.3,13050,1,4,0)
 ;;=4^H11.443
 ;;^UTILITY(U,$J,358.3,13050,2)
 ;;=^5004799
 ;;^UTILITY(U,$J,358.3,13051,0)
 ;;=H11.33^^80^753^38
 ;;^UTILITY(U,$J,358.3,13051,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,13051,1,3,0)
 ;;=3^Conjunctival Hemorrhage,Bilateral
 ;;^UTILITY(U,$J,358.3,13051,1,4,0)
 ;;=4^H11.33
 ;;^UTILITY(U,$J,358.3,13051,2)
 ;;=^5004784
 ;;^UTILITY(U,$J,358.3,13052,0)
 ;;=H10.403^^80^753^44
 ;;^UTILITY(U,$J,358.3,13052,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,13052,1,3,0)
 ;;=3^Conjunctivitis,Bilateral,Chronic,Unspec
 ;;^UTILITY(U,$J,358.3,13052,1,4,0)
 ;;=4^H10.403
 ;;^UTILITY(U,$J,358.3,13052,2)
 ;;=^5004683
 ;;^UTILITY(U,$J,358.3,13053,0)
 ;;=H10.33^^80^753^41