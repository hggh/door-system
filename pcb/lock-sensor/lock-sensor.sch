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
L Device:C C1
U 1 1 5FE49AF1
P 2750 3900
F 0 "C1" H 2865 3946 50  0000 L CNN
F 1 "100nf" H 2865 3855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2788 3750 50  0001 C CNN
F 3 "~" H 2750 3900 50  0001 C CNN
	1    2750 3900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5FE4A135
P 2750 4300
F 0 "#PWR0101" H 2750 4050 50  0001 C CNN
F 1 "GND" H 2755 4127 50  0000 C CNN
F 2 "" H 2750 4300 50  0001 C CNN
F 3 "" H 2750 4300 50  0001 C CNN
	1    2750 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 4050 2750 4200
Connection ~ 2750 4200
Wire Wire Line
	2750 4200 2750 4300
Wire Wire Line
	2750 3750 2750 3550
$Comp
L Connector:Conn_01x03_Female J1
U 1 1 5FE4AF24
P 2000 3850
F 0 "J1" H 1892 3617 50  0000 C CNN
F 1 "Conn_01x03_Female" H 1892 3616 50  0001 C CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x03_P2.00mm_Vertical" H 2000 3850 50  0001 C CNN
F 3 "~" H 2000 3850 50  0001 C CNN
	1    2000 3850
	-1   0    0    1   
$EndComp
Wire Wire Line
	2750 4200 2450 4200
Wire Wire Line
	2450 4200 2450 3950
Wire Wire Line
	2450 3950 2200 3950
Wire Wire Line
	2200 3750 2500 3750
Wire Wire Line
	2500 3750 2500 3550
Wire Wire Line
	2500 3550 2750 3550
Connection ~ 2750 3550
$Comp
L tle:TLE4913 U1
U 1 1 5FE492E5
P 3450 4100
F 0 "U1" H 3678 4371 50  0000 L CNN
F 1 "TLE4913" H 3678 4280 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SC-59" H 3450 4100 50  0001 C CNN
F 3 "https://www.mouser.de/datasheet/2/196/TLE4913-1169629.pdf" H 3450 4100 50  0001 C CNN
	1    3450 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 3550 3500 3550
Wire Wire Line
	2750 4200 3600 4200
Wire Wire Line
	3250 3850 3250 3350
Wire Wire Line
	3250 3350 2300 3350
Wire Wire Line
	2300 3350 2300 3850
Wire Wire Line
	2300 3850 2200 3850
Text Label 2550 3550 0    50   ~ 0
3.3V
Text Label 2600 3350 0    50   ~ 0
OUT
$EndSCHEMATC
