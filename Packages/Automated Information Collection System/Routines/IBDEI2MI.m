IBDEI2MI ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,44026,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,44026,1,3,0)
 ;;=3^Thyrotoxicosis,Unspec w/o Thyrotoxic Crisis/Storm
 ;;^UTILITY(U,$J,358.3,44026,1,4,0)
 ;;=4^E05.90
 ;;^UTILITY(U,$J,358.3,44026,2)
 ;;=^5002492
 ;;^UTILITY(U,$J,358.3,44027,0)
 ;;=E05.91^^200^2220^57
 ;;^UTILITY(U,$J,358.3,44027,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,44027,1,3,0)
 ;;=3^Thyrotoxicosis,Unspec w/ Thyrotoxic Crisis/Storm
 ;;^UTILITY(U,$J,358.3,44027,1,4,0)
 ;;=4^E05.91
 ;;^UTILITY(U,$J,358.3,44027,2)
 ;;=^5002493
 ;;^UTILITY(U,$J,358.3,44028,0)
 ;;=E89.0^^200^2220^50
 ;;^UTILITY(U,$J,358.3,44028,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,44028,1,3,0)
 ;;=3^Postprocedural Hypothyroidism
 ;;^UTILITY(U,$J,358.3,44028,1,4,0)
 ;;=4^E89.0
 ;;^UTILITY(U,$J,358.3,44028,2)
 ;;=^5003035
 ;;^UTILITY(U,$J,358.3,44029,0)
 ;;=E03.2^^200^2220^32
 ;;^UTILITY(U,$J,358.3,44029,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,44029,1,3,0)
 ;;=3^Hypothyroidism d/t Meds/Oth Exogenous Substances
 ;;^UTILITY(U,$J,358.3,44029,1,4,0)
 ;;=4^E03.2
 ;;^UTILITY(U,$J,358.3,44029,2)
 ;;=^5002471
 ;;^UTILITY(U,$J,358.3,44030,0)
 ;;=E03.9^^200^2220^33
 ;;^UTILITY(U,$J,358.3,44030,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,44030,1,3,0)
 ;;=3^Hypothyroidism,Unspec
 ;;^UTILITY(U,$J,358.3,44030,1,4,0)
 ;;=4^E03.9
 ;;^UTILITY(U,$J,358.3,44030,2)
 ;;=^5002476
 ;;^UTILITY(U,$J,358.3,44031,0)
 ;;=E06.0^^200^2220^53
 ;;^UTILITY(U,$J,358.3,44031,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,44031,1,3,0)
 ;;=3^Thyroiditis,Acute
 ;;^UTILITY(U,$J,358.3,44031,1,4,0)
 ;;=4^E06.0
 ;;^UTILITY(U,$J,358.3,44031,2)
 ;;=^2692
 ;;^UTILITY(U,$J,358.3,44032,0)
 ;;=E06.1^^200^2220^54
 ;;^UTILITY(U,$J,358.3,44032,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,44032,1,3,0)
 ;;=3^Thyroiditis,Subacute
 ;;^UTILITY(U,$J,358.3,44032,1,4,0)
 ;;=4^E06.1
 ;;^UTILITY(U,$J,358.3,44032,2)
 ;;=^119376
 ;;^UTILITY(U,$J,358.3,44033,0)
 ;;=C73.^^200^2220^37
 ;;^UTILITY(U,$J,358.3,44033,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,44033,1,3,0)
 ;;=3^Malig Neop of Thyroid Gland
 ;;^UTILITY(U,$J,358.3,44033,1,4,0)
 ;;=4^C73.
 ;;^UTILITY(U,$J,358.3,44033,2)
 ;;=^267296
 ;;^UTILITY(U,$J,358.3,44034,0)
 ;;=E10.21^^200^2220^8
 ;;^UTILITY(U,$J,358.3,44034,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,44034,1,3,0)
 ;;=3^DM Type 1 w/ Diabetic Nephropathy
 ;;^UTILITY(U,$J,358.3,44034,1,4,0)
 ;;=4^E10.21
 ;;^UTILITY(U,$J,358.3,44034,2)
 ;;=^5002589
 ;;^UTILITY(U,$J,358.3,44035,0)
 ;;=E10.9^^200^2220^12
 ;;^UTILITY(U,$J,358.3,44035,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,44035,1,3,0)
 ;;=3^DM Type 1 w/o Complications
 ;;^UTILITY(U,$J,358.3,44035,1,4,0)
 ;;=4^E10.9
 ;;^UTILITY(U,$J,358.3,44035,2)
 ;;=^5002626
 ;;^UTILITY(U,$J,358.3,44036,0)
 ;;=E11.21^^200^2220^17
 ;;^UTILITY(U,$J,358.3,44036,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,44036,1,3,0)
 ;;=3^DM Type 2 w/ Diabetic Nephropathy
 ;;^UTILITY(U,$J,358.3,44036,1,4,0)
 ;;=4^E11.21
 ;;^UTILITY(U,$J,358.3,44036,2)
 ;;=^5002629
 ;;^UTILITY(U,$J,358.3,44037,0)
 ;;=E11.39^^200^2220^18
 ;;^UTILITY(U,$J,358.3,44037,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,44037,1,3,0)
 ;;=3^DM Type 2 w/ Diabetic Ophthalmic Complication NEC
 ;;^UTILITY(U,$J,358.3,44037,1,4,0)
 ;;=4^E11.39
 ;;^UTILITY(U,$J,358.3,44037,2)
 ;;=^5002643
 ;;^UTILITY(U,$J,358.3,44038,0)
 ;;=E11.43^^200^2220^15
 ;;^UTILITY(U,$J,358.3,44038,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,44038,1,3,0)
 ;;=3^DM Type 2 w/ Diabetic Autonomic Neuropathy
 ;;^UTILITY(U,$J,358.3,44038,1,4,0)
 ;;=4^E11.43
 ;;^UTILITY(U,$J,358.3,44038,2)
 ;;=^5002647
 ;;^UTILITY(U,$J,358.3,44039,0)
 ;;=E11.59^^200^2220^13
