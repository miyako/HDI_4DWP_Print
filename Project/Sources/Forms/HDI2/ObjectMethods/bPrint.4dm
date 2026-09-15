
If (vPreview=1)
	SET PRINT PREVIEW:C364(True:C214)
Else 
	SET PRINT PREVIEW:C364(False:C215)
End if 
If (Shift down:C543)
	//printing jobs aren't available in 32 bit
	OPEN PRINTING JOB:C995
	
	WP PRINT:C1343(writeProDoc; wk html wysiwyg:K81:175)
	WP PRINT:C1343(writeProDoc; wk 4D Write Pro layout:K81:176)
	
	CLOSE PRINTING JOB:C996
	
Else 
	// print using a specific layout HTML wysiwyg or 4D Write Pro Layout
	If (rb_htmlwysiwyg=1)
		WP PRINT:C1343(writeProDoc; wk html wysiwyg:K81:175)
	Else 
		WP PRINT:C1343(writeProDoc; wk 4D Write Pro layout:K81:176)
	End if 
	
	
End if 