//%attributes = {"invisible":true}
var $l; $t; $r; $b; $w; $h : Integer
var $orientation; $x; $y : Integer

OBJECT GET COORDINATES:C663(*; "rOrientation"; $l; $t; $r; $b)
GET PRINT OPTION:C734(Paper option:K47:1; $w; $h)

GET PRINT OPTION:C734(Orientation option:K47:2; $orientation)

If ($orientation=1)
	
	$r:=$l+($w/10)
	$b:=$t+($h/10)
	
	OBJECT SET COORDINATES:C1248(*; "rOrientation"; $l; $t; $r; $b)
	
	$x:=$l+(($r-$l)/2)
	$y:=$t+(($b-$t)/2)
	
	OBJECT SET COORDINATES:C1248(*; "tTextThumbnail"; $x-10; $y-10; $x+10; $y+10)
	
Else 
	$r:=$l+($h/10)
	$b:=$t+($w/10)
	OBJECT SET COORDINATES:C1248(*; "rOrientation"; $l; $t; $r; $b)
	
	$x:=$l+(($r-$l)/2)
	$y:=$t+(($b-$t)/2)
	OBJECT SET COORDINATES:C1248(*; "tTextThumbnail"; $x-10; $y-10; $x+10; $y+10)
End if 