IBDEI06S ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,2586,0)
 ;;=64550^^24^220^1^^^^1
 ;;^UTILITY(U,$J,358.3,2586,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,2586,1,2,0)
 ;;=2^Apply Neurostimulator
 ;;^UTILITY(U,$J,358.3,2586,1,3,0)
 ;;=3^64550
 ;;^UTILITY(U,$J,358.3,2587,0)
 ;;=97012^^24^220^11^^^^1
 ;;^UTILITY(U,$J,358.3,2587,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,2587,1,2,0)
 ;;=2^Mechanical Traction Therapy 
 ;;^UTILITY(U,$J,358.3,2587,1,3,0)
 ;;=3^97012
 ;;^UTILITY(U,$J,358.3,2588,0)
 ;;=97035^^24^220^21^^^^1
 ;;^UTILITY(U,$J,358.3,2588,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,2588,1,2,0)
 ;;=2^Ultrasound Therapy,Ea 15min
 ;;^UTILITY(U,$J,358.3,2588,1,3,0)
 ;;=3^97035
 ;;^UTILITY(U,$J,358.3,2589,0)
 ;;=97028^^24^220^22^^^^1
 ;;^UTILITY(U,$J,358.3,2589,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,2589,1,2,0)
 ;;=2^Ultraviolet Therapy
 ;;^UTILITY(U,$J,358.3,2589,1,3,0)
 ;;=3^97028
 ;;^UTILITY(U,$J,358.3,2590,0)
 ;;=97110^^24^220^20^^^^1
 ;;^UTILITY(U,$J,358.3,2590,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,2590,1,2,0)
 ;;=2^Therapeutic Exercises,Ea 15min
 ;;^UTILITY(U,$J,358.3,2590,1,3,0)
 ;;=3^97110
 ;;^UTILITY(U,$J,358.3,2591,0)
 ;;=97112^^24^220^12^^^^1
 ;;^UTILITY(U,$J,358.3,2591,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,2591,1,2,0)
 ;;=2^Neuromuscular Re-Education
 ;;^UTILITY(U,$J,358.3,2591,1,3,0)
 ;;=3^97112
 ;;^UTILITY(U,$J,358.3,2592,0)
 ;;=97140^^24^220^9^^^^1
 ;;^UTILITY(U,$J,358.3,2592,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,2592,1,2,0)
 ;;=2^Manual Therapy,Ea 15min
 ;;^UTILITY(U,$J,358.3,2592,1,3,0)
 ;;=3^97140
 ;;^UTILITY(U,$J,358.3,2593,0)
 ;;=97039^^24^220^2^^^^1
 ;;^UTILITY(U,$J,358.3,2593,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,2593,1,2,0)
 ;;=2^Cold Laser Therapy
 ;;^UTILITY(U,$J,358.3,2593,1,3,0)
 ;;=3^97039
 ;;^UTILITY(U,$J,358.3,2594,0)
 ;;=97026^^24^220^8^^^^1
 ;;^UTILITY(U,$J,358.3,2594,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,2594,1,2,0)
 ;;=2^Infrared Heat to 1 or more areas
 ;;^UTILITY(U,$J,358.3,2594,1,3,0)
 ;;=3^97026
 ;;^UTILITY(U,$J,358.3,2595,0)
 ;;=29540^^24^220^13^^^^1
 ;;^UTILITY(U,$J,358.3,2595,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,2595,1,2,0)
 ;;=2^Strapping/Taping,Ankle and/or Foot
 ;;^UTILITY(U,$J,358.3,2595,1,3,0)
 ;;=3^29540
 ;;^UTILITY(U,$J,358.3,2596,0)
 ;;=29260^^24^220^14^^^^1
 ;;^UTILITY(U,$J,358.3,2596,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,2596,1,2,0)
 ;;=2^Strapping/Taping,Elbow/Wrist
 ;;^UTILITY(U,$J,358.3,2596,1,3,0)
 ;;=3^29260
 ;;^UTILITY(U,$J,358.3,2597,0)
 ;;=29520^^24^220^16^^^^1
 ;;^UTILITY(U,$J,358.3,2597,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,2597,1,2,0)
 ;;=2^Strapping/Taping,Hip
 ;;^UTILITY(U,$J,358.3,2597,1,3,0)
 ;;=3^29520
 ;;^UTILITY(U,$J,358.3,2598,0)
 ;;=29530^^24^220^17^^^^1
 ;;^UTILITY(U,$J,358.3,2598,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,2598,1,2,0)
 ;;=2^Strapping/Taping,Knee
 ;;^UTILITY(U,$J,358.3,2598,1,3,0)
 ;;=3^29530
 ;;^UTILITY(U,$J,358.3,2599,0)
 ;;=29240^^24^220^18^^^^1
 ;;^UTILITY(U,$J,358.3,2599,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,2599,1,2,0)
 ;;=2^Strapping/Taping,Shoulder
 ;;^UTILITY(U,$J,358.3,2599,1,3,0)
 ;;=3^29240
 ;;^UTILITY(U,$J,358.3,2600,0)
 ;;=29550^^24^220^19^^^^1
 ;;^UTILITY(U,$J,358.3,2600,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,2600,1,2,0)
 ;;=2^Strapping/Taping,Toes
 ;;^UTILITY(U,$J,358.3,2600,1,3,0)
 ;;=3^29550
 ;;^UTILITY(U,$J,358.3,2601,0)
 ;;=29280^^24^220^15^^^^1
 ;;^UTILITY(U,$J,358.3,2601,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,2601,1,2,0)
 ;;=2^Strapping/Taping,Hand or Finger
 ;;^UTILITY(U,$J,358.3,2601,1,3,0)
 ;;=3^29280
 ;;^UTILITY(U,$J,358.3,2602,0)
 ;;=97799^^24^220^3^^^^1
