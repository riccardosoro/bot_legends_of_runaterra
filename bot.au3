


Sleep (1000)

$numPartita=1
HotKeySet ("q","cambiaStato")
$a=0
$blueColor=0
while 1
	while $a=1
		salvaBlu()
		premiBlu()
		attendiBlu()
		giocaCarte()
		schieraUnita()
	WEnd
	Sleep (100)
WEnd




Func cambiaStato()
	if ($a=0) Then
		$a=1
	Else
		$a=0
	EndIf
	Sleep (100)
EndFunc

Func salvaBlu()
	if ($blueColor=0) Then
	$blueColor=PixelGetColor(803,262)
	ConsoleWrite($numPartita&"-Salvo blu:"&$blueColor&@LF)
	EndIf
	EndFunc
Func attendiBlu()
	ConsoleWrite ($numPartita&"-Attendo blu"&@LF)
	while (not (PixelGetColor(803,262) > ($blueColor-100) and PixelGetColor(803,262) < ($blueColor+100)))
		isFinePartita()
		Sleep (100)
	wend
	ConsoleWrite ($numPartita&"-Blu Trovato"&@LF)
EndFunc

Func premiBlu()
	ConsoleWrite ($numPartita&"-Premo blu"&@LF)
	click(803,262)
	MouseMove (100,100)
EndFunc

Func premiGioca()
	$numPartita=$numPartita+1
	ConsoleWrite ($numPartita&"-Premo gioca"&@LF)
	click(812,485)
EndFunc

Func click($x1,$y1)
 MouseClick("left",$x1,$y1)
 Sleep (1500)
EndFunc

Func drag($x1,$y1,$x2,$y2)
 MouseClickDrag("left",$x1,$y1,$x2,$y2,3)
 Sleep (300)
 isFinePartita()
EndFunc

Func giocaCarte()
	drag(290,523,457,342)
	drag(351,521,457,342)
	drag(428,519,457,342)
	drag(503,516,457,342)
	drag(577,519,457,342)
	drag(658,523,457,342)
EndFunc

Func schieraUnita()
	drag(300,445,300,342)
	drag(350,445,350,342)
	drag(400,445,400,342)
	drag(450,445,450,342)
	drag(500,445,500,342)
	drag(550,445,550,342)
	drag(600,445,600,342)
	drag(650,445,650,342)
EndFunc

Func premiContinua()
		click(684,474)
EndFunc


Func isFinePartita()
	$pixelFinePartita=0
	$pixelFinePartita=PixelSearch(684-30,474-30,684+30,474+30,0xA76A2A,1,1)
	If IsArray($pixelFinePartita) = True Then
		Sleep (3000)
		$pixelFinePartita=0
		$pixelFinePartita=PixelSearch(684-30,474-30,684+30,474+30,0xA76A2A,1,1)
		If IsArray($pixelFinePartita) = True Then
			premiContinua()
			Sleep (7000)
			premiGioca()
			attendiBlu()
		EndIf
	EndIf
EndFunc

