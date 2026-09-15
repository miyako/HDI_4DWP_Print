//%attributes = {"invisible":true}
//get the number of page total
var $nbPageInDoc : Integer
$nbPageInDoc:=WP Get page count:C1412(writeProDoc)

Case of 
		//all pages
	: (_PageRanges=1)
		SET PRINT OPTION:C733(Page range option:K47:14; 0; -1)
		
		// only one page
	: (_PageRanges=2)
		
		// if user try to print more than there are pages in the doc
		If (vStart>$nbPageInDoc)
			vStart:=$nbPageInDoc
		End if 
		
		SET PRINT OPTION:C733(Page range option:K47:14; vStart; vStart)
		
		
		//print a page range 
	: (_PageRanges=3)
		
		// The page end cannot be greater than the beginning. 
		If (vEndScreen<vStart)
			vEndScreen:=vStart
		End if 
		//the contrary the page start cannot be greater than the end
		If (vStart>vEndScreen)
			vStart:=vEndScreen
		End if 
		
		// if "all" have been selected in the main dialog
		If (vEndScreen=2147483647)
			vEndScreen:=$nbPageInDoc
			_PageRanges:=1
			//we need to update the GUI. 
			m_modifyPrintRange
		End if 
		
		// if user try to print more than there are pages in the doc
		If (vEndScreen>$nbPageInDoc)
			vEndScreen:=$nbPageInDoc
		End if 
		
		// if user try to print more than there are pages in the doc
		If (vStart>$nbPageInDoc)
			vStart:=$nbPageInDoc
		End if 
		
		vEnd:=vEndScreen
		SET PRINT OPTION:C733(Page range option:K47:14; vStart; vEnd)
		
End case 