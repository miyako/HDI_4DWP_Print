
Case of 
	: (Form event code:C388=On Data Change:K2:15)
		
		Case of 
				
			: (Self:C308->=1)  //all
				
				SET PRINT OPTION:C733(Page range option:K47:14; 0; -1)
				
				OBJECT SET VISIBLE:C603(*; "VarStart"; False:C215)
				OBJECT SET VISIBLE:C603(*; "RulerStart"; False:C215)
				OBJECT SET VISIBLE:C603(*; "VarEnd"; False:C215)
				OBJECT SET VISIBLE:C603(*; "RulerEnd"; False:C215)
				OBJECT SET VISIBLE:C603(*; "txtEnd"; False:C215)
				OBJECT SET VISIBLE:C603(*; "txtEnd1"; False:C215)
				OBJECT SET VISIBLE:C603(*; "rbVend"; False:C215)
				OBJECT SET VISIBLE:C603(*; "rbVend1"; False:C215)
				
			: (Self:C308->=2)  //Single
				
				SET PRINT OPTION:C733(Page range option:K47:14; vStart; vStart)
				
				OBJECT SET VISIBLE:C603(*; "VarStart"; True:C214)
				OBJECT SET VISIBLE:C603(*; "RulerStart"; True:C214)
				OBJECT SET VISIBLE:C603(*; "VarEnd"; False:C215)
				OBJECT SET VISIBLE:C603(*; "RulerEnd"; False:C215)
				OBJECT SET VISIBLE:C603(*; "txtEnd"; False:C215)
				OBJECT SET VISIBLE:C603(*; "txtEnd1"; False:C215)
				
				
			: (Self:C308->=3)  // Range
				
				SET PRINT OPTION:C733(Page range option:K47:14; vStart; vEnd)
				
				OBJECT SET VISIBLE:C603(*; "VarStart"; True:C214)
				OBJECT SET VISIBLE:C603(*; "RulerStart"; True:C214)
				OBJECT SET VISIBLE:C603(*; "VarEnd"; True:C214)
				OBJECT SET VISIBLE:C603(*; "RulerEnd"; True:C214)
				OBJECT SET VISIBLE:C603(*; "txtEnd"; True:C214)
				OBJECT SET VISIBLE:C603(*; "txtEnd1"; True:C214)
				
		End case 
		m_modifyPrintRange
End case 