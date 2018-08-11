DINIT4 ;SFISC/GFT-INITIALIZE VA FILEMAN ;24SEP2009
 ;;22.2;VA FileMan;**10**;Jan 05, 2016;Build 11
 ;;Per VA Directive 6402, this routine should not be modified.
 ;;Submitted to OSEHRA 5 January 2015 by the VISTA Expertise Network.
 ;;Based on Medsphere Systems Corporation's MSC FileMan 1051.
 ;;Licensed under the terms of the Apache License, Version 2.0.
 ;
DD F I=1:1 S X=$E($T(DD+I),4,999) G ^DINIT41:X?.P S ^DD("FUNC",I,0)=$P(X,";",1),Y=1 F DU=1,2,3,9,10 S Y=Y+1 I $P(X,";",Y)]"" S ^(DU)=$P(X,";",Y)
 ;;SQUAREROOT;D SQR^DIXC S X=$S(X'>0:"",1:Y);;;
 ;;TIME;S X=$E($P(X,".",2)_"0000",1,4),%=X>1159 S:X>1259 X=X-1200 S X=X\100_":"_$E(X#100+100,2,3)_" "_$E("AP",%+1)_"M";;;
 ;;MONTH;S X=$E(X,1,5)_0_0 S:'X X="";D^D;;
 ;;YEAR;S X=$E(X,1,3)_"0000" S:'X X="";D^D;;
 ;;DATE;S X=$P(X,".",1);D^D;;
 ;;DAYOFWEEK;D DW^%DTC;^D;;
 ;;CLOSE
 ;;ABS;S:X<0 X=-X;;;
 ;;INTERNAL;S X=X;;;
 ;;MAX;S:X1>X X=X1;O;2;MAXIMUM OF 2 VALUES
 ;;MIN;S:X1<X X=X1;O;2;MINIMUM OF TWO VALUES
 ;;REVERSE;S X=$RE(X);;;DATA CHARACTERS IN RIGHT-TO-LEFT ORDER
 ;;UPPERCASE;S X=$$UP^DILIBF(X);;;
 ;;LOWERCASE;X "F %=2:1:$L(X) I $E(X,%)?1U,$E(X,%-1)?1A S X=$E(X,0,%-1)_$C($A(X,%)+32)_$E(X,%+1,999)";;;
 ;;CENTER;S X=$J("",$S($D(DIWR)+$D(DIWL)=2:DIWR-DIWL+1,$D(IOM):IOM,1:80)-$L(X)\2-$X)_X;;;;W
 ;;UNDERLINE;S %="",Y=$S($D(IOST)[0:-1,$A(IOST)-80:-1,1:$L(X)<83) X:Y+1 "F Y=1:1:$L(X) "_$S(Y:"S %=$C(8)_%",1:"W $E(X,Y),$C(8)")_"_""_""" S:Y+1 X=$S(%]"":X_%,1:%);;;UNDERLINE (ARG) IF OUTPUTTING TO A PRINTER DEVICE;W
 ;;PAGEFEED;S %Y=1,%=$S($D(DIWF):$F(DIWF,"B"),1:0) X:% "F %Y=%:1 Q:$E(DIWF,%Y)'?1N" S:$D(DIWF) DIWF=$E(DIWF,1,%-2)_$E(DIWF,%Y,999)_"B"_(X\1) X:X>(IOSL-$Y)&$D(^UTILITY($J,1))&'$D(^("W"))&'$D(DIWF) ^(1) S X="";;;START NEW PAGE IF <ARG LINES LEFT;W
 ;;BREAKABLE;D:'$D(DISYS) OS^DII X ^DD("OS",DISYS,1);;;OUTPUT DEVICE CAN BE INTERRUPTED IF ARGUMENT IS NON-ZERO
 ;;NUMMONTH;S X=+$E(X,4,5);^D;;MONTH NUMBER (0-12) FOR A DATE
 ;;NUMDAY;S X=+$E(X,6,7);^D;;DAY NUMBER (0-31) FOR A DATE
 ;;NUMYEAR;S:X X=$E(X,2,3);^D;;YEAR NUMBER (00-99) FOR A DATE
 ;;NUMDATE;S:X X=$E(X,4,5)_"/"_$E(X,6,7)_"/"_$E(X,2,3);^D;;DATE IN 'NN/NN/NN' FORMAT
 ;;REPLACE;X "F %=0:0 S %=$F(X2,X1,%) Q:%<2  S X2=$E(X2,1,%-$L(X1)-1)_X_$E(X2,%,999),%=%-$L(X1)+$L(X)" S X=X2;;3;THE 1ST ARGUMENT, WITH ALL OCCURRENCES OF THE 2ND ARGUMENT REPLACED BY THE 3RD
 ;;NOW;N %I,%H,% D NOW^%DTC S X=%;D;0;CURRENT DATE/TIME
 ;;TODAY;N %I,%H,% D NOW^%DTC;D;0;CURRENT DATE
 ;;PAGE;S X=$G(DC);;0;PAGE NUMBER (OF OUTPUT)
 ;;SETTAB;S DIWT=X,X="" F %=1:1 S Y="X"_% Q:'$D(@Y)  S DIWT=@Y_","_DIWT;;VARIABLE;SET TAB STOPS;W
 ;;RIGHT-JUSTIFY;S X="" S:'$D(DIWF) DIWF="" S:DIWF'["R" DIWF=DIWF_"R";;0;;W
 ;;DOUBLE-SPACE;S X="" S:'$D(DIWF) DIWF="" S:DIWF'["D" DIWF=DIWF_"D";;0;;W
 ;;SINGLE-SPACE;S:'$D(DIWF) DIWF="" S X="",DIWF=$P(DIWF,"D",1)_$P(DIWF,"D",2);;0;;W
