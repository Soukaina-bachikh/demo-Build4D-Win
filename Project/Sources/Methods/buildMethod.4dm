//%attributes = {}
//launch the build
LOG EVENT:C667(Into system standard outputs:K38:9; "✅ Starting Build Process\r\n")

var $resultClient; $resultServer : Object

LOG EVENT:C667(Into system standard outputs:K38:9; "📦 Running buildClient...\r\n")
$resultClient:=buildClient()
LOG EVENT:C667(Into system standard outputs:K38:9; "📦 buildClient result: "+JSON Stringify:C1217($resultClient)+"\r\n")

If ($resultClient.success)
	LOG EVENT:C667(Into system standard outputs:K38:9; "🖥️ Running buildServer...\r\n")
	LOG EVENT:C667(Into system standard outputs:K38:9; "🖥️ Running buildServer2...\r\n")
	$resultServer:=buildServer()
	LOG EVENT:C667(Into system standard outputs:K38:9; "🖥️ buildServer result: "+JSON Stringify:C1217($resultServer)+"\r\n")
End if 

If ($resultClient.success & $resultServer.success)
	LOG EVENT:C667(Into system standard outputs:K38:9; "✅ All builds succeeded!\r\n")
Else 
	LOG EVENT:C667(Into system standard outputs:K38:9; "❌ One or more builds failed.\r\n")
End if 
