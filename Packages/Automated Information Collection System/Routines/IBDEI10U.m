IBDEI10U ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,16995,1,4,0)
 ;;=4^M54.30
 ;;^UTILITY(U,$J,358.3,16995,2)
 ;;=^5012305
 ;;^UTILITY(U,$J,358.3,16996,0)
 ;;=M41.9^^88^856^147
 ;;^UTILITY(U,$J,358.3,16996,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16996,1,3,0)
 ;;=3^Scoliosis,Unspec
 ;;^UTILITY(U,$J,358.3,16996,1,4,0)
 ;;=4^M41.9
 ;;^UTILITY(U,$J,358.3,16996,2)
 ;;=^5011889
 ;;^UTILITY(U,$J,358.3,16997,0)
 ;;=M75.92^^88^856^148
 ;;^UTILITY(U,$J,358.3,16997,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16997,1,3,0)
 ;;=3^Shoulder Lesion,Left Shoulder,Unspec
 ;;^UTILITY(U,$J,358.3,16997,1,4,0)
 ;;=4^M75.92
 ;;^UTILITY(U,$J,358.3,16997,2)
 ;;=^5013265
 ;;^UTILITY(U,$J,358.3,16998,0)
 ;;=M75.91^^88^856^149
 ;;^UTILITY(U,$J,358.3,16998,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16998,1,3,0)
 ;;=3^Shoulder Lesion,Right Shoulder,Unspec
 ;;^UTILITY(U,$J,358.3,16998,1,4,0)
 ;;=4^M75.91
 ;;^UTILITY(U,$J,358.3,16998,2)
 ;;=^5013264
 ;;^UTILITY(U,$J,358.3,16999,0)
 ;;=M79.9^^88^856^150
 ;;^UTILITY(U,$J,358.3,16999,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16999,1,3,0)
 ;;=3^Soft Tissue Disorder,Unspec
 ;;^UTILITY(U,$J,358.3,16999,1,4,0)
 ;;=4^M79.9
 ;;^UTILITY(U,$J,358.3,16999,2)
 ;;=^5013358
 ;;^UTILITY(U,$J,358.3,17000,0)
 ;;=M50.90^^88^856^138
 ;;^UTILITY(U,$J,358.3,17000,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,17000,1,3,0)
 ;;=3^Pine,Cervical Disc Disorder,Unspec
 ;;^UTILITY(U,$J,358.3,17000,1,4,0)
 ;;=4^M50.90
 ;;^UTILITY(U,$J,358.3,17000,2)
 ;;=^5012235
 ;;^UTILITY(U,$J,358.3,17001,0)
 ;;=M54.2^^88^856^151
 ;;^UTILITY(U,$J,358.3,17001,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,17001,1,3,0)
 ;;=3^Spine,Cervicalgia
 ;;^UTILITY(U,$J,358.3,17001,1,4,0)
 ;;=4^M54.2
 ;;^UTILITY(U,$J,358.3,17001,2)
 ;;=^5012304
 ;;^UTILITY(U,$J,358.3,17002,0)
 ;;=M43.20^^88^856^152
 ;;^UTILITY(U,$J,358.3,17002,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,17002,1,3,0)
 ;;=3^Spine,Fusion,Unspec Site
 ;;^UTILITY(U,$J,358.3,17002,1,4,0)
 ;;=4^M43.20
 ;;^UTILITY(U,$J,358.3,17002,2)
 ;;=^5011931
 ;;^UTILITY(U,$J,358.3,17003,0)
 ;;=M48.20^^88^856^153
 ;;^UTILITY(U,$J,358.3,17003,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,17003,1,3,0)
 ;;=3^Spine,Kissing,Unspec Site
 ;;^UTILITY(U,$J,358.3,17003,1,4,0)
 ;;=4^M48.20
 ;;^UTILITY(U,$J,358.3,17003,2)
 ;;=^5012106
 ;;^UTILITY(U,$J,358.3,17004,0)
 ;;=M40.50^^88^856^154
 ;;^UTILITY(U,$J,358.3,17004,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,17004,1,3,0)
 ;;=3^Spine,Lordosis,Unspec Site
 ;;^UTILITY(U,$J,358.3,17004,1,4,0)
 ;;=4^M40.50
 ;;^UTILITY(U,$J,358.3,17004,2)
 ;;=^5011831
 ;;^UTILITY(U,$J,358.3,17005,0)
 ;;=M43.10^^88^856^155
 ;;^UTILITY(U,$J,358.3,17005,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,17005,1,3,0)
 ;;=3^Spondylolisthesis,Unspec Site
 ;;^UTILITY(U,$J,358.3,17005,1,4,0)
 ;;=4^M43.10
 ;;^UTILITY(U,$J,358.3,17005,2)
 ;;=^5011921
 ;;^UTILITY(U,$J,358.3,17006,0)
 ;;=M43.00^^88^856^156
 ;;^UTILITY(U,$J,358.3,17006,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,17006,1,3,0)
 ;;=3^Spondylolysis,Unspec Site
 ;;^UTILITY(U,$J,358.3,17006,1,4,0)
 ;;=4^M43.00
 ;;^UTILITY(U,$J,358.3,17006,2)
 ;;=^5011911
 ;;^UTILITY(U,$J,358.3,17007,0)
 ;;=M46.90^^88^856^157
 ;;^UTILITY(U,$J,358.3,17007,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,17007,1,3,0)
 ;;=3^Spondylopathy,Inflammatory,Unspec Site
 ;;^UTILITY(U,$J,358.3,17007,1,4,0)
 ;;=4^M46.90
 ;;^UTILITY(U,$J,358.3,17007,2)
 ;;=^5012030
 ;;^UTILITY(U,$J,358.3,17008,0)
 ;;=M48.30^^88^856^158
 ;;^UTILITY(U,$J,358.3,17008,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,17008,1,3,0)
 ;;=3^Spondylopathy,Traumatic,Unspec Site
 ;;^UTILITY(U,$J,358.3,17008,1,4,0)
 ;;=4^M48.30