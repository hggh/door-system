EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:Conn_01x08_Male J2
U 1 1 600A916D
P 1000 2600
F 0 "J2" H 1108 3081 50  0000 C CNN
F 1 "C1" H 1108 2990 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Horizontal" H 1000 2600 50  0001 C CNN
F 3 "~" H 1000 2600 50  0001 C CNN
	1    1000 2600
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x08_Male J3
U 1 1 600A9F03
P 1000 3600
F 0 "J3" H 1108 4081 50  0000 C CNN
F 1 "C2" H 1108 3990 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Horizontal" H 1000 3600 50  0001 C CNN
F 3 "~" H 1000 3600 50  0001 C CNN
	1    1000 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 600AB005
P 1600 2300
F 0 "#PWR06" H 1600 2050 50  0001 C CNN
F 1 "GND" H 1605 2127 50  0000 C CNN
F 2 "" H 1600 2300 50  0001 C CNN
F 3 "" H 1600 2300 50  0001 C CNN
	1    1600 2300
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR09
U 1 1 600ABB5E
P 1800 2400
F 0 "#PWR09" H 1800 2250 50  0001 C CNN
F 1 "+3.3V" H 1815 2573 50  0000 C CNN
F 2 "" H 1800 2400 50  0001 C CNN
F 3 "" H 1800 2400 50  0001 C CNN
	1    1800 2400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR011
U 1 1 600AC5CC
P 2000 2500
F 0 "#PWR011" H 2000 2350 50  0001 C CNN
F 1 "+5V" H 2015 2673 50  0000 C CNN
F 2 "" H 2000 2500 50  0001 C CNN
F 3 "" H 2000 2500 50  0001 C CNN
	1    2000 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 2300 1600 2300
Wire Wire Line
	1800 2400 1200 2400
Wire Wire Line
	1200 2500 2000 2500
Text GLabel 1450 2600 2    50   Input ~ 0
Button1
Text GLabel 1450 2700 2    50   Input ~ 0
Button2
Text GLabel 1450 2900 2    50   Input ~ 0
LOCK
Text GLabel 1450 2800 2    50   Input ~ 0
LED_BUTTON
Text GLabel 1450 3000 2    50   Input ~ 0
KEY_1
Text GLabel 1450 3300 2    50   Input ~ 0
KEY_2
Text GLabel 1450 3400 2    50   Input ~ 0
WS2812B
Wire Wire Line
	1450 2600 1200 2600
Wire Wire Line
	1200 2700 1450 2700
Wire Wire Line
	1450 2800 1200 2800
Wire Wire Line
	1200 2900 1450 2900
Wire Wire Line
	1450 3000 1200 3000
Wire Wire Line
	1200 3300 1450 3300
Wire Wire Line
	1450 3400 1200 3400
$Comp
L Connector:Conn_01x03_Male J4
U 1 1 600AE428
P 1000 4550
F 0 "J4" H 1108 4831 50  0000 C CNN
F 1 "TLE Lock" H 1108 4740 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 1000 4550 50  0001 C CNN
F 3 "~" H 1000 4550 50  0001 C CNN
	1    1000 4550
	1    0    0    -1  
$EndComp
Text GLabel 1400 4650 2    50   Input ~ 0
LOCK
$Comp
L power:GND #PWR07
U 1 1 600AF496
P 1600 4450
F 0 "#PWR07" H 1600 4200 50  0001 C CNN
F 1 "GND" H 1605 4277 50  0000 C CNN
F 2 "" H 1600 4450 50  0001 C CNN
F 3 "" H 1600 4450 50  0001 C CNN
	1    1600 4450
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR010
U 1 1 600AF651
P 1850 4550
F 0 "#PWR010" H 1850 4400 50  0001 C CNN
F 1 "+3.3V" H 1865 4723 50  0000 C CNN
F 2 "" H 1850 4550 50  0001 C CNN
F 3 "" H 1850 4550 50  0001 C CNN
	1    1850 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 4450 1200 4450
Wire Wire Line
	1200 4550 1850 4550
Wire Wire Line
	1400 4650 1200 4650
$Comp
L Connector:Conn_01x02_Female J6
U 1 1 600B0748
P 3000 2050
F 0 "J6" H 2892 1725 50  0000 C CNN
F 1 "Button1" H 2892 1816 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 3000 2050 50  0001 C CNN
F 3 "~" H 3000 2050 50  0001 C CNN
	1    3000 2050
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR012
U 1 1 600B1303
P 3500 2050
F 0 "#PWR012" H 3500 1800 50  0001 C CNN
F 1 "GND" H 3505 1877 50  0000 C CNN
F 2 "" H 3500 2050 50  0001 C CNN
F 3 "" H 3500 2050 50  0001 C CNN
	1    3500 2050
	1    0    0    -1  
$EndComp
Text GLabel 3500 1950 2    50   Input ~ 0
Button1
Wire Wire Line
	3500 1950 3200 1950
Wire Wire Line
	3200 2050 3500 2050
$Comp
L Connector:Conn_01x02_Female J7
U 1 1 600B2077
P 3000 2600
F 0 "J7" H 2892 2275 50  0000 C CNN
F 1 "Button2" H 2892 2366 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 3000 2600 50  0001 C CNN
F 3 "~" H 3000 2600 50  0001 C CNN
	1    3000 2600
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR013
U 1 1 600B2191
P 3500 2600
F 0 "#PWR013" H 3500 2350 50  0001 C CNN
F 1 "GND" H 3505 2427 50  0000 C CNN
F 2 "" H 3500 2600 50  0001 C CNN
F 3 "" H 3500 2600 50  0001 C CNN
	1    3500 2600
	1    0    0    -1  
$EndComp
Text GLabel 3500 2500 2    50   Input ~ 0
Button2
Wire Wire Line
	3500 2500 3200 2500
Wire Wire Line
	3200 2600 3500 2600
$Comp
L Connector:Conn_01x02_Female J8
U 1 1 600B35C4
P 3050 3150
F 0 "J8" H 2942 2825 50  0000 C CNN
F 1 "BU LEDs" H 2942 2916 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 3050 3150 50  0001 C CNN
F 3 "~" H 3050 3150 50  0001 C CNN
	1    3050 3150
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR014
U 1 1 600B3700
P 3550 3150
F 0 "#PWR014" H 3550 2900 50  0001 C CNN
F 1 "GND" H 3555 2977 50  0000 C CNN
F 2 "" H 3550 3150 50  0001 C CNN
F 3 "" H 3550 3150 50  0001 C CNN
	1    3550 3150
	1    0    0    -1  
$EndComp
Text GLabel 3550 3050 2    50   Input ~ 0
LED_BUTTON
Wire Wire Line
	3550 3050 3250 3050
Wire Wire Line
	3250 3150 3550 3150
Wire Wire Line
	3250 3750 3550 3750
Wire Wire Line
	3550 3650 3250 3650
Text GLabel 3550 3650 2    50   Input ~ 0
KEY_1
$Comp
L power:GND #PWR015
U 1 1 600B4620
P 3550 3750
F 0 "#PWR015" H 3550 3500 50  0001 C CNN
F 1 "GND" H 3555 3577 50  0000 C CNN
F 2 "" H 3550 3750 50  0001 C CNN
F 3 "" H 3550 3750 50  0001 C CNN
	1    3550 3750
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J9
U 1 1 600B44C2
P 3050 3750
F 0 "J9" H 2942 3425 50  0000 C CNN
F 1 "Key1" H 2942 3516 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 3050 3750 50  0001 C CNN
F 3 "~" H 3050 3750 50  0001 C CNN
	1    3050 3750
	-1   0    0    1   
$EndComp
Wire Wire Line
	3250 4400 3550 4400
Wire Wire Line
	3550 4300 3250 4300
Text GLabel 3550 4300 2    50   Input ~ 0
KEY_2
$Comp
L power:GND #PWR016
U 1 1 600B6605
P 3550 4400
F 0 "#PWR016" H 3550 4150 50  0001 C CNN
F 1 "GND" H 3555 4227 50  0000 C CNN
F 2 "" H 3550 4400 50  0001 C CNN
F 3 "" H 3550 4400 50  0001 C CNN
	1    3550 4400
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J10
U 1 1 600B660F
P 3050 4400
F 0 "J10" H 2942 4075 50  0000 C CNN
F 1 "Key2" H 2942 4166 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 3050 4400 50  0001 C CNN
F 3 "~" H 3050 4400 50  0001 C CNN
	1    3050 4400
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Male J1
U 1 1 600B760F
P 950 5200
F 0 "J1" H 1058 5481 50  0000 C CNN
F 1 "WS2812B" H 1058 5390 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 950 5200 50  0001 C CNN
F 3 "~" H 950 5200 50  0001 C CNN
	1    950  5200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 600B7B3F
P 1450 5100
F 0 "#PWR03" H 1450 4850 50  0001 C CNN
F 1 "GND" H 1455 4927 50  0000 C CNN
F 2 "" H 1450 5100 50  0001 C CNN
F 3 "" H 1450 5100 50  0001 C CNN
	1    1450 5100
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR08
U 1 1 600B7FF2
P 1650 5200
F 0 "#PWR08" H 1650 5050 50  0001 C CNN
F 1 "+5V" H 1665 5373 50  0000 C CNN
F 2 "" H 1650 5200 50  0001 C CNN
F 3 "" H 1650 5200 50  0001 C CNN
	1    1650 5200
	1    0    0    -1  
$EndComp
Text GLabel 1650 5300 2    50   Input ~ 0
WS2812B
Wire Wire Line
	1650 5300 1150 5300
Wire Wire Line
	1150 5200 1650 5200
Wire Wire Line
	1450 5100 1150 5100
$Comp
L Connector:Conn_01x06_Female J5
U 1 1 600B9CF2
P 1900 3700
F 0 "J5" H 1928 3676 50  0000 L CNN
F 1 "Future_Use" H 1928 3585 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 1900 3700 50  0001 C CNN
F 3 "~" H 1900 3700 50  0001 C CNN
	1    1900 3700
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 600BB3E3
P 850 5800
F 0 "H1" H 950 5846 50  0000 L CNN
F 1 "M" H 950 5755 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 850 5800 50  0001 C CNN
F 3 "~" H 850 5800 50  0001 C CNN
	1    850  5800
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 600BB65A
P 850 6050
F 0 "H2" H 950 6096 50  0000 L CNN
F 1 "M" H 950 6005 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 850 6050 50  0001 C CNN
F 3 "~" H 850 6050 50  0001 C CNN
	1    850  6050
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 600BB86C
P 850 6250
F 0 "H3" H 950 6296 50  0000 L CNN
F 1 "M" H 950 6205 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 850 6250 50  0001 C CNN
F 3 "~" H 850 6250 50  0001 C CNN
	1    850  6250
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 600BBA36
P 850 6500
F 0 "H4" H 950 6546 50  0000 L CNN
F 1 "M" H 950 6455 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 850 6500 50  0001 C CNN
F 3 "~" H 850 6500 50  0001 C CNN
	1    850  6500
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1_Small C1
U 1 1 600BC0C6
P 1050 850
F 0 "C1" H 1141 896 50  0000 L CNN
F 1 "10µF" H 1141 805 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 1050 850 50  0001 C CNN
F 3 "~" H 1050 850 50  0001 C CNN
	1    1050 850 
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1_Small C2
U 1 1 600BCE83
P 1550 850
F 0 "C2" H 1641 896 50  0000 L CNN
F 1 "10µF" H 1641 805 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 1550 850 50  0001 C CNN
F 3 "~" H 1550 850 50  0001 C CNN
	1    1550 850 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 600BD806
P 1050 1200
F 0 "#PWR02" H 1050 950 50  0001 C CNN
F 1 "GND" H 1055 1027 50  0000 C CNN
F 2 "" H 1050 1200 50  0001 C CNN
F 3 "" H 1050 1200 50  0001 C CNN
	1    1050 1200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 600BDBBF
P 1550 1200
F 0 "#PWR05" H 1550 950 50  0001 C CNN
F 1 "GND" H 1555 1027 50  0000 C CNN
F 2 "" H 1550 1200 50  0001 C CNN
F 3 "" H 1550 1200 50  0001 C CNN
	1    1550 1200
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR01
U 1 1 600BDE36
P 1050 700
F 0 "#PWR01" H 1050 550 50  0001 C CNN
F 1 "+3.3V" H 1065 873 50  0000 C CNN
F 2 "" H 1050 700 50  0001 C CNN
F 3 "" H 1050 700 50  0001 C CNN
	1    1050 700 
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR04
U 1 1 600BE250
P 1550 700
F 0 "#PWR04" H 1550 550 50  0001 C CNN
F 1 "+5V" H 1565 873 50  0000 C CNN
F 2 "" H 1550 700 50  0001 C CNN
F 3 "" H 1550 700 50  0001 C CNN
	1    1550 700 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 700  1550 750 
Wire Wire Line
	1550 950  1550 1200
Wire Wire Line
	1050 1200 1050 950 
Wire Wire Line
	1050 750  1050 700 
$Comp
L Connector:Conn_01x02_Female J11
U 1 1 600DF16B
P 4150 1100
F 0 "J11" H 4042 775 50  0000 C CNN
F 1 "F1" H 4042 866 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4150 1100 50  0001 C CNN
F 3 "~" H 4150 1100 50  0001 C CNN
	1    4150 1100
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR018
U 1 1 600DFE7D
P 4550 1100
F 0 "#PWR018" H 4550 850 50  0001 C CNN
F 1 "GND" H 4555 927 50  0000 C CNN
F 2 "" H 4550 1100 50  0001 C CNN
F 3 "" H 4550 1100 50  0001 C CNN
	1    4550 1100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR017
U 1 1 600E00B2
P 4550 1000
F 0 "#PWR017" H 4550 850 50  0001 C CNN
F 1 "+5V" H 4565 1173 50  0000 C CNN
F 2 "" H 4550 1000 50  0001 C CNN
F 3 "" H 4550 1000 50  0001 C CNN
	1    4550 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 1100 4350 1100
Wire Wire Line
	4350 1000 4550 1000
$Comp
L Connector:Conn_01x02_Female J12
U 1 1 600E14B4
P 4800 1100
F 0 "J12" H 4692 775 50  0000 C CNN
F 1 "F2" H 4692 866 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4800 1100 50  0001 C CNN
F 3 "~" H 4800 1100 50  0001 C CNN
	1    4800 1100
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR020
U 1 1 600E1788
P 5200 1100
F 0 "#PWR020" H 5200 850 50  0001 C CNN
F 1 "GND" H 5205 927 50  0000 C CNN
F 2 "" H 5200 1100 50  0001 C CNN
F 3 "" H 5200 1100 50  0001 C CNN
	1    5200 1100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR019
U 1 1 600E1792
P 5200 1000
F 0 "#PWR019" H 5200 850 50  0001 C CNN
F 1 "+5V" H 5215 1173 50  0000 C CNN
F 2 "" H 5200 1000 50  0001 C CNN
F 3 "" H 5200 1000 50  0001 C CNN
	1    5200 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 1100 5000 1100
Wire Wire Line
	5000 1000 5200 1000
$Comp
L Connector:Conn_01x02_Female J13
U 1 1 600E2A91
P 5450 1100
F 0 "J13" H 5342 775 50  0000 C CNN
F 1 "F3" H 5342 866 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 5450 1100 50  0001 C CNN
F 3 "~" H 5450 1100 50  0001 C CNN
	1    5450 1100
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR022
U 1 1 600E2D97
P 5850 1100
F 0 "#PWR022" H 5850 850 50  0001 C CNN
F 1 "GND" H 5855 927 50  0000 C CNN
F 2 "" H 5850 1100 50  0001 C CNN
F 3 "" H 5850 1100 50  0001 C CNN
	1    5850 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 1100 5650 1100
$Comp
L power:+3.3V #PWR021
U 1 1 600E4278
P 5850 1000
F 0 "#PWR021" H 5850 850 50  0001 C CNN
F 1 "+3.3V" H 5865 1173 50  0000 C CNN
F 2 "" H 5850 1000 50  0001 C CNN
F 3 "" H 5850 1000 50  0001 C CNN
	1    5850 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 1000 5650 1000
$Comp
L Connector:Conn_01x02_Female J14
U 1 1 600E53CC
P 6150 1100
F 0 "J14" H 6042 775 50  0000 C CNN
F 1 "F4" H 6042 866 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 6150 1100 50  0001 C CNN
F 3 "~" H 6150 1100 50  0001 C CNN
	1    6150 1100
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR024
U 1 1 600E5706
P 6550 1100
F 0 "#PWR024" H 6550 850 50  0001 C CNN
F 1 "GND" H 6555 927 50  0000 C CNN
F 2 "" H 6550 1100 50  0001 C CNN
F 3 "" H 6550 1100 50  0001 C CNN
	1    6550 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 1100 6350 1100
$Comp
L power:+3.3V #PWR023
U 1 1 600E5711
P 6550 1000
F 0 "#PWR023" H 6550 850 50  0001 C CNN
F 1 "+3.3V" H 6565 1173 50  0000 C CNN
F 2 "" H 6550 1000 50  0001 C CNN
F 3 "" H 6550 1000 50  0001 C CNN
	1    6550 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 1000 6350 1000
Wire Wire Line
	1700 3500 1200 3500
Wire Wire Line
	1200 3600 1700 3600
Wire Wire Line
	1700 3700 1200 3700
Wire Wire Line
	1200 3800 1700 3800
Wire Wire Line
	1700 3900 1200 3900
Wire Wire Line
	1200 4000 1700 4000
$EndSCHEMATC
