IBDEI16F ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,19660,2)
 ;;=^5019251
 ;;^UTILITY(U,$J,358.3,19661,0)
 ;;=R19.30^^94^928^2
 ;;^UTILITY(U,$J,358.3,19661,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,19661,1,3,0)
 ;;=3^Abdominal Rigidity,Unspec Site
 ;;^UTILITY(U,$J,358.3,19661,1,4,0)
 ;;=4^R19.30
 ;;^UTILITY(U,$J,358.3,19661,2)
 ;;=^5019266
 ;;^UTILITY(U,$J,358.3,19662,0)
 ;;=R19.4^^94^928^45
 ;;^UTILITY(U,$J,358.3,19662,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,19662,1,3,0)
 ;;=3^Bowel Habit Changes
 ;;^UTILITY(U,$J,358.3,19662,1,4,0)
 ;;=4^R19.4
 ;;^UTILITY(U,$J,358.3,19662,2)
 ;;=^5019273
 ;;^UTILITY(U,$J,358.3,19663,0)
 ;;=R19.8^^94^928^59
 ;;^UTILITY(U,$J,358.3,19663,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,19663,1,3,0)
 ;;=3^Digestive System/Abdomen Symptoms NEC
 ;;^UTILITY(U,$J,358.3,19663,1,4,0)
 ;;=4^R19.8
 ;;^UTILITY(U,$J,358.3,19663,2)
 ;;=^5019277
 ;;^UTILITY(U,$J,358.3,19664,0)
 ;;=R20.0^^94^928^35
 ;;^UTILITY(U,$J,358.3,19664,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,19664,1,3,0)
 ;;=3^Anesthesia of Skin
 ;;^UTILITY(U,$J,358.3,19664,1,4,0)
 ;;=4^R20.0
 ;;^UTILITY(U,$J,358.3,19664,2)
 ;;=^5019278
 ;;^UTILITY(U,$J,358.3,19665,0)
 ;;=R20.1^^94^928^87
 ;;^UTILITY(U,$J,358.3,19665,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,19665,1,3,0)
 ;;=3^Hypoesthesia of Skin
 ;;^UTILITY(U,$J,358.3,19665,1,4,0)
 ;;=4^R20.1
 ;;^UTILITY(U,$J,358.3,19665,2)
 ;;=^5019279
 ;;^UTILITY(U,$J,358.3,19666,0)
 ;;=R20.2^^94^928^131
 ;;^UTILITY(U,$J,358.3,19666,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,19666,1,3,0)
 ;;=3^Paresthesia of Skin
 ;;^UTILITY(U,$J,358.3,19666,1,4,0)
 ;;=4^R20.2
 ;;^UTILITY(U,$J,358.3,19666,2)
 ;;=^5019280
 ;;^UTILITY(U,$J,358.3,19667,0)
 ;;=R20.3^^94^928^83
 ;;^UTILITY(U,$J,358.3,19667,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,19667,1,3,0)
 ;;=3^Hyperesthesia
 ;;^UTILITY(U,$J,358.3,19667,1,4,0)
 ;;=4^R20.3
 ;;^UTILITY(U,$J,358.3,19667,2)
 ;;=^60011
 ;;^UTILITY(U,$J,358.3,19668,0)
 ;;=R21.^^94^928^145
 ;;^UTILITY(U,$J,358.3,19668,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,19668,1,3,0)
 ;;=3^Rash
 ;;^UTILITY(U,$J,358.3,19668,1,4,0)
 ;;=4^R21.
 ;;^UTILITY(U,$J,358.3,19668,2)
 ;;=^5019283
 ;;^UTILITY(U,$J,358.3,19669,0)
 ;;=R22.0^^94^928^105
 ;;^UTILITY(U,$J,358.3,19669,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,19669,1,3,0)
 ;;=3^Localized Swelling/Mass/Lump,Head
 ;;^UTILITY(U,$J,358.3,19669,1,4,0)
 ;;=4^R22.0
 ;;^UTILITY(U,$J,358.3,19669,2)
 ;;=^5019284
 ;;^UTILITY(U,$J,358.3,19670,0)
 ;;=R22.1^^94^928^108
 ;;^UTILITY(U,$J,358.3,19670,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,19670,1,3,0)
 ;;=3^Localized Swelling/Mass/Lump,Neck
 ;;^UTILITY(U,$J,358.3,19670,1,4,0)
 ;;=4^R22.1
 ;;^UTILITY(U,$J,358.3,19670,2)
 ;;=^5019285
 ;;^UTILITY(U,$J,358.3,19671,0)
 ;;=R22.2^^94^928^111
 ;;^UTILITY(U,$J,358.3,19671,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,19671,1,3,0)
 ;;=3^Localized Swelling/Mass/Lump,Trunk
 ;;^UTILITY(U,$J,358.3,19671,1,4,0)
 ;;=4^R22.2
 ;;^UTILITY(U,$J,358.3,19671,2)
 ;;=^5019286
 ;;^UTILITY(U,$J,358.3,19672,0)
 ;;=R22.31^^94^928^110
 ;;^UTILITY(U,$J,358.3,19672,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,19672,1,3,0)
 ;;=3^Localized Swelling/Mass/Lump,Right Upper Limb
 ;;^UTILITY(U,$J,358.3,19672,1,4,0)
 ;;=4^R22.31
 ;;^UTILITY(U,$J,358.3,19672,2)
 ;;=^5019288
 ;;^UTILITY(U,$J,358.3,19673,0)
 ;;=R22.32^^94^928^107
 ;;^UTILITY(U,$J,358.3,19673,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,19673,1,3,0)
 ;;=3^Localized Swelling/Mass/Lump,Left Upper Limb
 ;;^UTILITY(U,$J,358.3,19673,1,4,0)
 ;;=4^R22.32
 ;;^UTILITY(U,$J,358.3,19673,2)
 ;;=^5019289
 ;;^UTILITY(U,$J,358.3,19674,0)
 ;;=R22.33^^94^928^103