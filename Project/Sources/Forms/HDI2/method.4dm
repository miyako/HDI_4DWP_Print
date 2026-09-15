Case of 
	: (Form event code:C388=On Load:K2:1)
		initHdi
		
		updateUIprintSettings
		
	: (Form event code:C388=On Page Change:K2:54)
		
		//unactive button for 64bit version
		//If (Not(Version type ?? 64 bit version))
		//OBJECT SET VISIBLE(*;"txt64bit";True)
		//OBJECT SET ENABLED(*;"bPrint";false)
		//End if 
		
End case 
