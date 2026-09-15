//%attributes = {}
//load descritption
$path:=Get 4D folder:C485(Current resources folder:K5:16)+"description.4wp"
wpDocDescription:=WP Import document:C1318($path)

WP SET ATTRIBUTES:C1342(wpDocDescription; wk background color:K81:20; wk transparent:K81:134)

// load a default document
$filePath:=Get 4D folder:C485(Current resources folder:K5:16)+"doc.4wp"
WriteProDoc:=WP Import document:C1318($filePath)

//tab info
ARRAY TEXT:C222(<>tab; 2)
<>tab{1}:="Info"
<>tab{2}:="Demo"
<>tab:=1

//default number of copy
vCopies:=1

//default layout rendering
rb_htmlwysiwyg:=0
rb_wplayout:=1

//default page range print
ARRAY TEXT:C222(_PageRanges; 3)
_PageRanges{1}:="All"
_PageRanges{2}:="Single"
_PageRanges{3}:="Range"
_PageRanges:=1
vStart:=1
vEnd:=-1
vEndScreen:=vStart
rbVend:=1

// default print preview
vPreview:=1

