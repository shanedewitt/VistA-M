IBDEI01P ; ; 12-JAN-2012
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JAN 12, 2012
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,1891,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1891,1,2,0)
 ;;=2^V10.82
 ;;^UTILITY(U,$J,358.3,1891,1,5,0)
 ;;=5^History of Melanoma (Removed)
 ;;^UTILITY(U,$J,358.3,1891,2)
 ;;=^295240
 ;;^UTILITY(U,$J,358.3,1892,0)
 ;;=V16.8^^27^171^10
 ;;^UTILITY(U,$J,358.3,1892,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1892,1,2,0)
 ;;=2^V16.8
 ;;^UTILITY(U,$J,358.3,1892,1,5,0)
 ;;=5^Family Hx of Melanoma
 ;;^UTILITY(U,$J,358.3,1892,2)
 ;;=^295300
 ;;^UTILITY(U,$J,358.3,1893,0)
 ;;=703.0^^27^172^1
 ;;^UTILITY(U,$J,358.3,1893,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1893,1,2,0)
 ;;=2^703.0
 ;;^UTILITY(U,$J,358.3,1893,1,5,0)
 ;;=5^Ingrown Nail
 ;;^UTILITY(U,$J,358.3,1893,2)
 ;;=^81221
 ;;^UTILITY(U,$J,358.3,1894,0)
 ;;=703.8^^27^172^6
 ;;^UTILITY(U,$J,358.3,1894,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1894,1,2,0)
 ;;=2^703.8
 ;;^UTILITY(U,$J,358.3,1894,1,5,0)
 ;;=5^Other Disease of Nail
 ;;^UTILITY(U,$J,358.3,1894,2)
 ;;=^271926
 ;;^UTILITY(U,$J,358.3,1895,0)
 ;;=110.1^^27^172^3
 ;;^UTILITY(U,$J,358.3,1895,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1895,1,2,0)
 ;;=2^110.1
 ;;^UTILITY(U,$J,358.3,1895,1,5,0)
 ;;=5^Onychomycosis
 ;;^UTILITY(U,$J,358.3,1895,2)
 ;;=^33173
 ;;^UTILITY(U,$J,358.3,1896,0)
 ;;=681.02^^27^172^4
 ;;^UTILITY(U,$J,358.3,1896,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1896,1,2,0)
 ;;=2^681.02
 ;;^UTILITY(U,$J,358.3,1896,1,5,0)
 ;;=5^Paronychia of Finger
 ;;^UTILITY(U,$J,358.3,1896,2)
 ;;=^271884
 ;;^UTILITY(U,$J,358.3,1897,0)
 ;;=681.11^^27^172^5
 ;;^UTILITY(U,$J,358.3,1897,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1897,1,2,0)
 ;;=2^681.11
 ;;^UTILITY(U,$J,358.3,1897,1,5,0)
 ;;=5^Paronychia of Toe
 ;;^UTILITY(U,$J,358.3,1897,2)
 ;;=^271886
 ;;^UTILITY(U,$J,358.3,1898,0)
 ;;=703.9^^27^172^7
 ;;^UTILITY(U,$J,358.3,1898,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1898,1,2,0)
 ;;=2^703.9
 ;;^UTILITY(U,$J,358.3,1898,1,5,0)
 ;;=5^Unspecified Nail Disease
 ;;^UTILITY(U,$J,358.3,1898,2)
 ;;=^81181
 ;;^UTILITY(U,$J,358.3,1899,0)
 ;;=216.6^^27^173^1
 ;;^UTILITY(U,$J,358.3,1899,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1899,1,2,0)
 ;;=2^216.6
 ;;^UTILITY(U,$J,358.3,1899,1,5,0)
 ;;=5^Benign Neo Skin Arm
 ;;^UTILITY(U,$J,358.3,1899,2)
 ;;=^267635
 ;;^UTILITY(U,$J,358.3,1900,0)
 ;;=216.5^^27^173^9
 ;;^UTILITY(U,$J,358.3,1900,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1900,1,2,0)
 ;;=2^216.5
 ;;^UTILITY(U,$J,358.3,1900,1,5,0)
 ;;=5^Benign Neo Skin Trunk
 ;;^UTILITY(U,$J,358.3,1900,2)
 ;;=^267634
 ;;^UTILITY(U,$J,358.3,1901,0)
 ;;=216.2^^27^173^2
 ;;^UTILITY(U,$J,358.3,1901,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1901,1,2,0)
 ;;=2^216.2
 ;;^UTILITY(U,$J,358.3,1901,1,5,0)
 ;;=5^Benign Neo Skin Ear
 ;;^UTILITY(U,$J,358.3,1901,2)
 ;;=^267631
 ;;^UTILITY(U,$J,358.3,1902,0)
 ;;=216.1^^27^173^3
 ;;^UTILITY(U,$J,358.3,1902,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1902,1,2,0)
 ;;=2^216.1
 ;;^UTILITY(U,$J,358.3,1902,1,5,0)
 ;;=5^Benign Neo Skin Eyelid
 ;;^UTILITY(U,$J,358.3,1902,2)
 ;;=^267630
 ;;^UTILITY(U,$J,358.3,1903,0)
 ;;=216.3^^27^173^8
 ;;^UTILITY(U,$J,358.3,1903,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1903,1,2,0)
 ;;=2^216.3
 ;;^UTILITY(U,$J,358.3,1903,1,5,0)
 ;;=5^Benign Neo Skin Temple
 ;;^UTILITY(U,$J,358.3,1903,2)
 ;;=^267632
 ;;^UTILITY(U,$J,358.3,1904,0)
 ;;=216.7^^27^173^4
 ;;^UTILITY(U,$J,358.3,1904,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1904,1,2,0)
 ;;=2^216.7
 ;;^UTILITY(U,$J,358.3,1904,1,5,0)
 ;;=5^Benign Neo Skin Leg
 ;;^UTILITY(U,$J,358.3,1904,2)
 ;;=^267636
 ;;^UTILITY(U,$J,358.3,1905,0)
 ;;=216.0^^27^173^5
 ;;^UTILITY(U,$J,358.3,1905,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1905,1,2,0)
 ;;=2^216.0
 ;;^UTILITY(U,$J,358.3,1905,1,5,0)
 ;;=5^Benign Neo Skin Lip
 ;;^UTILITY(U,$J,358.3,1905,2)
 ;;=^267629
 ;;^UTILITY(U,$J,358.3,1906,0)
 ;;=216.4^^27^173^6
 ;;^UTILITY(U,$J,358.3,1906,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1906,1,2,0)
 ;;=2^216.4
 ;;^UTILITY(U,$J,358.3,1906,1,5,0)
 ;;=5^Benign Neo Skin Scalp
 ;;^UTILITY(U,$J,358.3,1906,2)
 ;;=^267633
 ;;^UTILITY(U,$J,358.3,1907,0)
 ;;=216.8^^27^173^7
 ;;^UTILITY(U,$J,358.3,1907,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1907,1,2,0)
 ;;=2^216.8
 ;;^UTILITY(U,$J,358.3,1907,1,5,0)
 ;;=5^Benign Neo Skin Specified Site, Not Listed
 ;;^UTILITY(U,$J,358.3,1907,2)
 ;;=^267637
 ;;^UTILITY(U,$J,358.3,1908,0)
 ;;=232.6^^27^174^3
 ;;^UTILITY(U,$J,358.3,1908,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1908,1,2,0)
 ;;=2^232.6
 ;;^UTILITY(U,$J,358.3,1908,1,5,0)
 ;;=5^Ca In Situ Skin Arm
 ;;^UTILITY(U,$J,358.3,1908,2)
 ;;=^267731
 ;;^UTILITY(U,$J,358.3,1909,0)
 ;;=232.5^^27^174^8
 ;;^UTILITY(U,$J,358.3,1909,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1909,1,2,0)
 ;;=2^232.5
 ;;^UTILITY(U,$J,358.3,1909,1,5,0)
 ;;=5^Ca In Situ Skin Trunk
 ;;^UTILITY(U,$J,358.3,1909,2)
 ;;=^267730
 ;;^UTILITY(U,$J,358.3,1910,0)
 ;;=232.2^^27^174^4
 ;;^UTILITY(U,$J,358.3,1910,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1910,1,2,0)
 ;;=2^232.2
 ;;^UTILITY(U,$J,358.3,1910,1,5,0)
 ;;=5^Ca In Situ Skin Ear
 ;;^UTILITY(U,$J,358.3,1910,2)
 ;;=^267727
 ;;^UTILITY(U,$J,358.3,1911,0)
 ;;=232.1^^27^174^1
 ;;^UTILITY(U,$J,358.3,1911,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1911,1,2,0)
 ;;=2^232.1
 ;;^UTILITY(U,$J,358.3,1911,1,5,0)
 ;;=5^Ca In Situ Eyelid
 ;;^UTILITY(U,$J,358.3,1911,2)
 ;;=^267726
 ;;^UTILITY(U,$J,358.3,1912,0)
 ;;=232.3^^27^174^7
 ;;^UTILITY(U,$J,358.3,1912,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1912,1,2,0)
 ;;=2^232.3
 ;;^UTILITY(U,$J,358.3,1912,1,5,0)
 ;;=5^Ca In Situ Skin Temple
 ;;^UTILITY(U,$J,358.3,1912,2)
 ;;=^267728
 ;;^UTILITY(U,$J,358.3,1913,0)
 ;;=232.7^^27^174^5
 ;;^UTILITY(U,$J,358.3,1913,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1913,1,2,0)
 ;;=2^232.7
 ;;^UTILITY(U,$J,358.3,1913,1,5,0)
 ;;=5^Ca In Situ Skin Leg
 ;;^UTILITY(U,$J,358.3,1913,2)
 ;;=^267732
 ;;^UTILITY(U,$J,358.3,1914,0)
 ;;=232.0^^27^174^6
 ;;^UTILITY(U,$J,358.3,1914,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1914,1,2,0)
 ;;=2^232.0
 ;;^UTILITY(U,$J,358.3,1914,1,5,0)
 ;;=5^Ca In Situ Skin Lip
 ;;^UTILITY(U,$J,358.3,1914,2)
 ;;=^267725
 ;;^UTILITY(U,$J,358.3,1915,0)
 ;;=232.4^^27^174^2
 ;;^UTILITY(U,$J,358.3,1915,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1915,1,2,0)
 ;;=2^232.4
 ;;^UTILITY(U,$J,358.3,1915,1,5,0)
 ;;=5^Ca In Situ Scalp
 ;;^UTILITY(U,$J,358.3,1915,2)
 ;;=^267729
 ;;^UTILITY(U,$J,358.3,1916,0)
 ;;=232.8^^27^174^9
 ;;^UTILITY(U,$J,358.3,1916,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1916,1,2,0)
 ;;=2^232.8
 ;;^UTILITY(U,$J,358.3,1916,1,5,0)
 ;;=5^Ca In Situ Skin,Specified Site, Not Listed
 ;;^UTILITY(U,$J,358.3,1916,2)
 ;;=^267733
 ;;^UTILITY(U,$J,358.3,1917,0)
 ;;=198.2^^27^175^1
 ;;^UTILITY(U,$J,358.3,1917,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1917,1,2,0)
 ;;=2^198.2
 ;;^UTILITY(U,$J,358.3,1917,1,5,0)
 ;;=5^Secondary Skin Cancer
 ;;^UTILITY(U,$J,358.3,1917,2)
 ;;=^267333
 ;;^UTILITY(U,$J,358.3,1918,0)
 ;;=238.2^^27^175^3
 ;;^UTILITY(U,$J,358.3,1918,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1918,1,2,0)
 ;;=2^238.2
 ;;^UTILITY(U,$J,358.3,1918,1,5,0)
 ;;=5^Uncertain Behavior Neo Skin
 ;;^UTILITY(U,$J,358.3,1918,2)
 ;;=^267777
 ;;^UTILITY(U,$J,358.3,1919,0)
 ;;=239.2^^27^175^4
 ;;^UTILITY(U,$J,358.3,1919,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1919,1,2,0)
 ;;=2^239.2
 ;;^UTILITY(U,$J,358.3,1919,1,5,0)
 ;;=5^Unspecified Neoplasm
 ;;^UTILITY(U,$J,358.3,1919,2)
 ;;=^267783
 ;;^UTILITY(U,$J,358.3,1920,0)
 ;;=V76.43^^27^175^2
 ;;^UTILITY(U,$J,358.3,1920,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1920,1,2,0)
 ;;=2^V76.43
 ;;^UTILITY(U,$J,358.3,1920,1,5,0)
 ;;=5^Screening for malignant neoplasm
 ;;^UTILITY(U,$J,358.3,1920,2)
 ;;=^295657
 ;;^UTILITY(U,$J,358.3,1921,0)
 ;;=691.8^^27^176^1
 ;;^UTILITY(U,$J,358.3,1921,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1921,1,2,0)
 ;;=2^691.8
 ;;^UTILITY(U,$J,358.3,1921,1,5,0)
 ;;=5^Prurigo Nodularis
 ;;^UTILITY(U,$J,358.3,1921,2)
 ;;=^87342
 ;;^UTILITY(U,$J,358.3,1922,0)
 ;;=698.4^^27^176^5
 ;;^UTILITY(U,$J,358.3,1922,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1922,1,2,0)
 ;;=2^698.4
 ;;^UTILITY(U,$J,358.3,1922,1,5,0)
 ;;=5^Prurigo Nodularis
 ;;^UTILITY(U,$J,358.3,1922,2)
 ;;=^186786
 ;;^UTILITY(U,$J,358.3,1923,0)
 ;;=698.3^^27^176^3
 ;;^UTILITY(U,$J,358.3,1923,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1923,1,2,0)
 ;;=2^698.3
 ;;^UTILITY(U,$J,358.3,1923,1,5,0)
 ;;=5^Neurodermatitis
 ;;^UTILITY(U,$J,358.3,1923,2)
 ;;=^70705
 ;;^UTILITY(U,$J,358.3,1924,0)
 ;;=132.1^^27^177^1
 ;;^UTILITY(U,$J,358.3,1924,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1924,1,2,0)
 ;;=2^132.1
 ;;^UTILITY(U,$J,358.3,1924,1,5,0)
 ;;=5^Pediculosis, Body
 ;;^UTILITY(U,$J,358.3,1924,2)
 ;;=^266961
 ;;^UTILITY(U,$J,358.3,1925,0)
 ;;=132.0^^27^177^2
 ;;^UTILITY(U,$J,358.3,1925,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1925,1,2,0)
 ;;=2^132.0
 ;;^UTILITY(U,$J,358.3,1925,1,5,0)
 ;;=5^Pediculosis, Head
 ;;^UTILITY(U,$J,358.3,1925,2)
 ;;=^266960
 ;;^UTILITY(U,$J,358.3,1926,0)
 ;;=132.2^^27^177^3
 ;;^UTILITY(U,$J,358.3,1926,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1926,1,2,0)
 ;;=2^132.2
 ;;^UTILITY(U,$J,358.3,1926,1,5,0)
 ;;=5^Pediculosis, Pubic
 ;;^UTILITY(U,$J,358.3,1926,2)
 ;;=^266962
 ;;^UTILITY(U,$J,358.3,1927,0)
 ;;=696.3^^27^178^1
 ;;^UTILITY(U,$J,358.3,1927,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1927,1,2,0)
 ;;=2^696.3
 ;;^UTILITY(U,$J,358.3,1927,1,5,0)
 ;;=5^Pityriasis Rosea
 ;;^UTILITY(U,$J,358.3,1927,2)
 ;;=^94726
 ;;^UTILITY(U,$J,358.3,1928,0)
 ;;=696.4^^27^178^2
 ;;^UTILITY(U,$J,358.3,1928,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1928,1,2,0)
 ;;=2^696.4
 ;;^UTILITY(U,$J,358.3,1928,1,5,0)
 ;;=5^Pityriasis Rubra Pilaris
 ;;^UTILITY(U,$J,358.3,1928,2)
 ;;=^94729
 ;;^UTILITY(U,$J,358.3,1929,0)
 ;;=698.0^^27^179^2
 ;;^UTILITY(U,$J,358.3,1929,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,1929,1,2,0)
 ;;=2^698.0
 ;;^UTILITY(U,$J,358.3,1929,1,5,0)
 ;;=5^Pruritus Ani