IBDEI1VG ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,31335,0)
 ;;=90834^^136^1399^2^^^^1
 ;;^UTILITY(U,$J,358.3,31335,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,31335,1,2,0)
 ;;=2^90834
 ;;^UTILITY(U,$J,358.3,31335,1,3,0)
 ;;=3^PSYTX PT/FAM 38-52 MIN
 ;;^UTILITY(U,$J,358.3,31336,0)
 ;;=90837^^136^1399^3^^^^1
 ;;^UTILITY(U,$J,358.3,31336,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,31336,1,2,0)
 ;;=2^90837
 ;;^UTILITY(U,$J,358.3,31336,1,3,0)
 ;;=3^PSYTX PT/FAM 53-89 MIN
 ;;^UTILITY(U,$J,358.3,31337,0)
 ;;=90785^^136^1400^1^^^^1
 ;;^UTILITY(U,$J,358.3,31337,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,31337,1,2,0)
 ;;=2^90785
 ;;^UTILITY(U,$J,358.3,31337,1,3,0)
 ;;=3^PSYTX INTERACTIVE COMPLEXITY
 ;;^UTILITY(U,$J,358.3,31338,0)
 ;;=90833^^136^1401^1^^^^1
 ;;^UTILITY(U,$J,358.3,31338,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,31338,1,2,0)
 ;;=2^90833
 ;;^UTILITY(U,$J,358.3,31338,1,3,0)
 ;;=3^PSYTX PT/FAM 16-37 MIN-REPORT W/ E&M CODE
 ;;^UTILITY(U,$J,358.3,31339,0)
 ;;=90836^^136^1401^2^^^^1
 ;;^UTILITY(U,$J,358.3,31339,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,31339,1,2,0)
 ;;=2^90836
 ;;^UTILITY(U,$J,358.3,31339,1,3,0)
 ;;=3^PSYTX PT/FAM 38-52 MIN-REPORT W/ E&M CODE
 ;;^UTILITY(U,$J,358.3,31340,0)
 ;;=90838^^136^1401^3^^^^1
 ;;^UTILITY(U,$J,358.3,31340,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,31340,1,2,0)
 ;;=2^90838
 ;;^UTILITY(U,$J,358.3,31340,1,3,0)
 ;;=3^PSYTX PT/FAM 53-89 MIN-REPORT W/ E&M CODE
 ;;^UTILITY(U,$J,358.3,31341,0)
 ;;=90839^^136^1402^1^^^^1
 ;;^UTILITY(U,$J,358.3,31341,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,31341,1,2,0)
 ;;=2^90839
 ;;^UTILITY(U,$J,358.3,31341,1,3,0)
 ;;=3^PSYTX CRISIS INITIAL 30-74 MIN
 ;;^UTILITY(U,$J,358.3,31342,0)
 ;;=90840^^136^1402^2^^^^1
 ;;^UTILITY(U,$J,358.3,31342,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,31342,1,2,0)
 ;;=2^90840
 ;;^UTILITY(U,$J,358.3,31342,1,3,0)
 ;;=3^PSYTX CRISIS EA ADDL 30 MIN
 ;;^UTILITY(U,$J,358.3,31343,0)
 ;;=99354^^136^1403^3^^^^1
 ;;^UTILITY(U,$J,358.3,31343,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,31343,1,2,0)
 ;;=2^99354
 ;;^UTILITY(U,$J,358.3,31343,1,3,0)
 ;;=3^PROLONGED SVC,OTPT,1ST HR
 ;;^UTILITY(U,$J,358.3,31344,0)
 ;;=99355^^136^1403^4^^^^1
 ;;^UTILITY(U,$J,358.3,31344,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,31344,1,2,0)
 ;;=2^99355
 ;;^UTILITY(U,$J,358.3,31344,1,3,0)
 ;;=3^PROLONGED SVC,OTPT,EA ADDL 30MIN
 ;;^UTILITY(U,$J,358.3,31345,0)
 ;;=99356^^136^1403^1^^^^1
 ;;^UTILITY(U,$J,358.3,31345,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,31345,1,2,0)
 ;;=2^99356
 ;;^UTILITY(U,$J,358.3,31345,1,3,0)
 ;;=3^PROLONGED SVC,INPT/OBS,1ST HR
 ;;^UTILITY(U,$J,358.3,31346,0)
 ;;=99357^^136^1403^2^^^^1
 ;;^UTILITY(U,$J,358.3,31346,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,31346,1,2,0)
 ;;=2^99357
 ;;^UTILITY(U,$J,358.3,31346,1,3,0)
 ;;=3^PROLONGED SVC,INPT/OBS,EA ADDL 30MIN
 ;;^UTILITY(U,$J,358.3,31347,0)
 ;;=90656^^136^1404^5^^^^1
 ;;^UTILITY(U,$J,358.3,31347,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,31347,1,2,0)
 ;;=2^90656
 ;;^UTILITY(U,$J,358.3,31347,1,3,0)
 ;;=3^FLU VACCINE,NO PRESERVATIVES
 ;;^UTILITY(U,$J,358.3,31348,0)
 ;;=90658^^136^1404^4^^^^1
 ;;^UTILITY(U,$J,358.3,31348,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,31348,1,2,0)
 ;;=2^90658
 ;;^UTILITY(U,$J,358.3,31348,1,3,0)
 ;;=3^FLU VACCINE
 ;;^UTILITY(U,$J,358.3,31349,0)
 ;;=90471^^136^1404^1^^^^1
 ;;^UTILITY(U,$J,358.3,31349,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,31349,1,2,0)
 ;;=2^90471
 ;;^UTILITY(U,$J,358.3,31349,1,3,0)
 ;;=3^IMMUNIZATION ADMIN,IM
 ;;^UTILITY(U,$J,358.3,31350,0)
 ;;=J2680^^136^1404^6^^^^1
 ;;^UTILITY(U,$J,358.3,31350,1,0)
 ;;=^358.31IA^3^2