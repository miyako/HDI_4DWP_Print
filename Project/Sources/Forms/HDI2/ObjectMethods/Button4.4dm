PRINT SETTINGS:C106(2)

If (ok=1)
	//if "print" button is clicked 
	If (rb_htmlwysiwyg=1)
		WP PRINT:C1343(writeProDoc; wk html wysiwyg:K81:175)
	Else 
		WP PRINT:C1343(writeProDoc; wk 4D Write Pro layout:K81:176)
	End if 
End if 

//if value for end range is 2147483647 that mean print all 
If (vEndScreen=2147483647)
	vEndScreen:=$nbPageInDoc
	_PageRanges:=1
	
End if 
// update form according options
updateUIprintSettings