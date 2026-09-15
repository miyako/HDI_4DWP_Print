//%attributes = {"invisible":true}

var $vPortrait; $i : Integer
var $w; $h : Real
var $paper : Text

//Page range option
GET PRINT OPTION:C734(Page range option:K47:14; vStart; vEnd)
Case of 
	: (vEnd#-1)
		_PageRanges:=3
		OBJECT SET VISIBLE:C603(*; "VarStart"; True:C214)
		OBJECT SET VISIBLE:C603(*; "RulerStart"; True:C214)
		OBJECT SET VISIBLE:C603(*; "VarEnd"; True:C214)
		OBJECT SET VISIBLE:C603(*; "RulerEnd"; True:C214)
		OBJECT SET VISIBLE:C603(*; "txtEnd"; True:C214)
		OBJECT SET VISIBLE:C603(*; "txtEnd1"; True:C214)
		vEndScreen:=vEnd
		
	: (vEnd=-1)
		_PageRanges:=1
		OBJECT SET VISIBLE:C603(*; "VarStart"; False:C215)
		OBJECT SET VISIBLE:C603(*; "RulerStart"; False:C215)
		OBJECT SET VISIBLE:C603(*; "VarEnd"; False:C215)
		OBJECT SET VISIBLE:C603(*; "RulerEnd"; False:C215)
		OBJECT SET VISIBLE:C603(*; "txtEnd"; False:C215)
		OBJECT SET VISIBLE:C603(*; "txtEnd1"; False:C215)
		vEndScreen:=1
		vEnd:=-1
		
End case 
m_modifyPrintRange

// number of copies
GET PRINT OPTION:C734(Number of copies option:K47:4; vCopies)


//scale
GET PRINT OPTION:C734(Scale option:K47:3; vScale)


// orientation
GET PRINT OPTION:C734(Orientation option:K47:2; $vPortrait)
If ($vPortrait=1)
	vPortrait:=1
	vLandscape:=0
Else 
	vPortrait:=0
	vLandscape:=1
End if 

//paper size option
ARRAY TEXT:C222(arrListPaperOption; 0)
PRINT OPTION VALUES:C785(Paper option:K47:1; arrListPaperOption)
GET PRINT OPTION:C734(Paper option:K47:1; $paper)
GET PRINT OPTION:C734(Paper option:K47:1; $w; $h)
$i:=Find in array:C230(arrListPaperOption; $paper)
arrListPaperOption:=$i
If ($i=-1)
	OBJECT SET TITLE:C194(*; "txtFormat"; Localized string("PaperUndefined"))
Else 
	OBJECT SET TITLE:C194(*; "txtFormat"; String:C10($w)+Localized string("FormatBy")+String:C10($h)+Localized string("FormatPx"))
End if 

resizePageThumbnail
