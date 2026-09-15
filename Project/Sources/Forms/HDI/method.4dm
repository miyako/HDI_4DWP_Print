Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		$vers:=Application version:C493
		$IsLicenceWrite:=Is license available:C714(4D Write license:K44:2)
		
		Case of 
			: ($vers<"1600")  //1530 means 15R3   1600 means 16.0
				
				<>Quit:=True:C214
				OBJECT SET TITLE:C194(*; "BtnDemo"; "Quit 4D")
				OBJECT SET VISIBLE:C603(*; "TxtSorry@"; True:C214)
				OBJECT SET VISIBLE:C603(*; "TxtInfo@"; False:C215)
				
			: ($IsLicenceWrite=False:C215)
				<>Quit:=True:C214
				OBJECT SET VISIBLE:C603(*; "TxtLicence"; True:C214)
				OBJECT SET VISIBLE:C603(*; "TxtInfo@"; False:C215)
				OBJECT SET TITLE:C194(*; "BtnDemo"; "Quit 4D")
				
			Else 
				
				<>Quit:=False:C215
				
		End case 
		
End case 
