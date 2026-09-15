Case of 
	: (Form event code:C388=On Data Change:K2:15)
		var $w; $h : Integer
		var $paper : Text
		
		SET PRINT OPTION:C733(Paper option:K47:1; arrListPaperOption{Self:C308->})
		
		GET PRINT OPTION:C734(Paper option:K47:1; $paper)
		GET PRINT OPTION:C734(Paper option:K47:1; $w; $h)
		
		OBJECT SET TITLE:C194(*; "txtFormat"; String:C10($w)+Localized string("FormatBy")+String:C10($h)+Localized string("FormatPx"))
		resizePageThumbnail
End case 