PSSJXR3 ; COMPILED XREF FOR FILE #55.0105 ; 09/30/19
 ; 
 S DA=0
A1 ;
 I $D(DIKILL) K DIKLM S:DIKM1=1 DIKLM=1 G @DIKM1
0 ;
 K ^PS(55,DA(1),"BCMA")
A S DA=$O(^PS(55,DA(1),"IVBCMA",DA)) I DA'>0 S DA=0 G END
1 ;
 S DIKZ(0)=$G(^PS(55,DA(1),"IVBCMA",DA,0))
 S X=$P($G(DIKZ(0)),U,2)
 I X'="" K ^PS(55,DA(1),"IV",X,"BCMA",DA)
CR1 S DIXR=145
 K X
 S X(1)=$P(DIKZ(0),U,1)
 S X(2)=$P(DIKZ(0),U,2)
 S X=$G(X(1))
 I $G(X(1))]"",$G(X(2))]"" D
 . K X1,X2 M X1=X,X2=X
 . S:$D(DIKIL) (X2,X2(1),X2(2))=""
 . K ^PS(55,DA(1),"BCMA",X(1),X(2))
CR2 K X
 G:'$D(DIKLM) A Q:$D(DIKILL)
END G ^PSSJXR4
