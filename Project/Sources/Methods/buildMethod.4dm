//%attributes = {}
//launch the build
LOG EVENT:C667(Into system standard outputs:K38:9; "✅ Starting Build Process\r\n")

var $successClient; $successServer : Boolean

LOG EVENT:C667(Into system standard outputs:K38:9; "📦 Running buildClient...\r\n")
$successClient:=buildClient()
LOG EVENT:C667(Into system standard outputs:K38:9; "📦 buildClient result: "+String:C10($successClient)+"\r\n")

If ($successClient)
	LOG EVENT:C667(Into system standard outputs:K38:9; "🖥️ Running buildServer...\r\n")
	$successServer:=buildServer()
	LOG EVENT:C667(Into system standard outputs:K38:9; "🖥️ buildServer result: "+String:C10($successServer)+"\r\n")
End if 

If ($successClient & $successServer)
	LOG EVENT:C667(Into system standard outputs:K38:9; "✅ All builds succeeded!\r\n")
Else 
	LOG EVENT:C667(Into system standard outputs:K38:9; "❌ One or more builds failed.\r\n")
End if 
