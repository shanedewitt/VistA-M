IBDEI0LR ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,9924,2)
 ;;=^5003909
 ;;^UTILITY(U,$J,358.3,9925,0)
 ;;=H91.90^^68^659^25
 ;;^UTILITY(U,$J,358.3,9925,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,9925,1,3,0)
 ;;=3^Hearing Loss,Unspecified Ear
 ;;^UTILITY(U,$J,358.3,9925,1,4,0)
 ;;=4^H91.90
 ;;^UTILITY(U,$J,358.3,9925,2)
 ;;=^5006943
 ;;^UTILITY(U,$J,358.3,9926,0)
 ;;=H91.91^^68^659^24
 ;;^UTILITY(U,$J,358.3,9926,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,9926,1,3,0)
 ;;=3^Hearing Loss,Right Ear
 ;;^UTILITY(U,$J,358.3,9926,1,4,0)
 ;;=4^H91.91
 ;;^UTILITY(U,$J,358.3,9926,2)
 ;;=^5133553
 ;;^UTILITY(U,$J,358.3,9927,0)
 ;;=H91.92^^68^659^23
 ;;^UTILITY(U,$J,358.3,9927,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,9927,1,3,0)
 ;;=3^Hearing Loss,Left Ear
 ;;^UTILITY(U,$J,358.3,9927,1,4,0)
 ;;=4^H91.92
 ;;^UTILITY(U,$J,358.3,9927,2)
 ;;=^5133554
 ;;^UTILITY(U,$J,358.3,9928,0)
 ;;=H91.93^^68^659^22
 ;;^UTILITY(U,$J,358.3,9928,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,9928,1,3,0)
 ;;=3^Hearing Loss,Bilateral
 ;;^UTILITY(U,$J,358.3,9928,1,4,0)
 ;;=4^H91.93
 ;;^UTILITY(U,$J,358.3,9928,2)
 ;;=^5006944
 ;;^UTILITY(U,$J,358.3,9929,0)
 ;;=I10.^^68^659^29
 ;;^UTILITY(U,$J,358.3,9929,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,9929,1,3,0)
 ;;=3^Hypertension
 ;;^UTILITY(U,$J,358.3,9929,1,4,0)
 ;;=4^I10.
 ;;^UTILITY(U,$J,358.3,9929,2)
 ;;=^5007062
 ;;^UTILITY(U,$J,358.3,9930,0)
 ;;=I50.9^^68^659^14
 ;;^UTILITY(U,$J,358.3,9930,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,9930,1,3,0)
 ;;=3^Congestive Heart Failure,Unspec
 ;;^UTILITY(U,$J,358.3,9930,1,4,0)
 ;;=4^I50.9
 ;;^UTILITY(U,$J,358.3,9930,2)
 ;;=^5007251
 ;;^UTILITY(U,$J,358.3,9931,0)
 ;;=I67.89^^68^659^13
 ;;^UTILITY(U,$J,358.3,9931,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,9931,1,3,0)
 ;;=3^Cerebrovascular Disease,Oth
 ;;^UTILITY(U,$J,358.3,9931,1,4,0)
 ;;=4^I67.89
 ;;^UTILITY(U,$J,358.3,9931,2)
 ;;=^5007388
 ;;^UTILITY(U,$J,358.3,9932,0)
 ;;=J32.8^^68^659^49
 ;;^UTILITY(U,$J,358.3,9932,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,9932,1,3,0)
 ;;=3^Sinusitis,Chr,Oth
 ;;^UTILITY(U,$J,358.3,9932,1,4,0)
 ;;=4^J32.8
 ;;^UTILITY(U,$J,358.3,9932,2)
 ;;=^269890
 ;;^UTILITY(U,$J,358.3,9933,0)
 ;;=J32.4^^68^659^48
 ;;^UTILITY(U,$J,358.3,9933,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,9933,1,3,0)
 ;;=3^Pansinusitis,Chr
 ;;^UTILITY(U,$J,358.3,9933,1,4,0)
 ;;=4^J32.4
 ;;^UTILITY(U,$J,358.3,9933,2)
 ;;=^5008206
 ;;^UTILITY(U,$J,358.3,9934,0)
 ;;=J40.^^68^659^8
 ;;^UTILITY(U,$J,358.3,9934,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,9934,1,3,0)
 ;;=3^Bronchitis,Unspec
 ;;^UTILITY(U,$J,358.3,9934,1,4,0)
 ;;=4^J40.
 ;;^UTILITY(U,$J,358.3,9934,2)
 ;;=^17164
 ;;^UTILITY(U,$J,358.3,9935,0)
 ;;=J45.909^^68^659^4
 ;;^UTILITY(U,$J,358.3,9935,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,9935,1,3,0)
 ;;=3^Asthma,Unspec,Uncomplicated
 ;;^UTILITY(U,$J,358.3,9935,1,4,0)
 ;;=4^J45.909
 ;;^UTILITY(U,$J,358.3,9935,2)
 ;;=^5008256
 ;;^UTILITY(U,$J,358.3,9936,0)
 ;;=J44.9^^68^659^9
 ;;^UTILITY(U,$J,358.3,9936,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,9936,1,3,0)
 ;;=3^COPD,Unspec
 ;;^UTILITY(U,$J,358.3,9936,1,4,0)
 ;;=4^J44.9
 ;;^UTILITY(U,$J,358.3,9936,2)
 ;;=^5008241
 ;;^UTILITY(U,$J,358.3,9937,0)
 ;;=K21.9^^68^659^21
 ;;^UTILITY(U,$J,358.3,9937,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,9937,1,3,0)
 ;;=3^GERD w/o Esophagitis
 ;;^UTILITY(U,$J,358.3,9937,1,4,0)
 ;;=4^K21.9
 ;;^UTILITY(U,$J,358.3,9937,2)
 ;;=^5008505
 ;;^UTILITY(U,$J,358.3,9938,0)
 ;;=N40.0^^68^659^20
 ;;^UTILITY(U,$J,358.3,9938,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,9938,1,3,0)
 ;;=3^Enlarged Prostate w/o LUTS
 ;;^UTILITY(U,$J,358.3,9938,1,4,0)
 ;;=4^N40.0