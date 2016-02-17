Func LaunchFourFinger($listInfoDeploy, $CC, $King, $Queen, $Warden)
	Local $RandomEdge, $RandomXY

	If $debugSetlog = 1 Then SetLog("Launch Four Finger with CC " & $CC & ", K " & $King & ", Q " & $Queen & ", W " & $Warden , $COLOR_PURPLE)

	For $i = 0 To UBound($listInfoDeploy) - 1
		If (IsString($listInfoDeploy[$i][0]) And ($listInfoDeploy[$i][0] = "CC" Or $listInfoDeploy[$i][0] = "HEROES")) Then
			$RandomEdge = $Edges[Round(Random(0, 3))]
			$RandomXY = Round(Random(0, 4))

			If ($listInfoDeploy[$i][0] = "CC") Then
				dropCC($RandomEdge[$RandomXY][0], $RandomEdge[$RandomXY][1], $CC)
			ElseIf ($listInfoDeploy[$i][0] = "HEROES") Then
				dropHeroes($RandomEdge[$RandomXY][0], $RandomEdge[$RandomXY][1], $King, $Queen, $Warden)
			EndIf
		Else
			If LaunchTroops($listInfoDeploy[$i][0], $listInfoDeploy[$i][1], $listInfoDeploy[$i][2], $listInfoDeploy[$i][3], $listInfoDeploy[$i][4]) Then
				If _Sleep(SetSleep(1)) Then Return
			EndIf
		EndIf
	Next

	Return True
EndFunc   ;==>LaunchFourFinger
