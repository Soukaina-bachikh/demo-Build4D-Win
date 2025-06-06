//%attributes = {}
var $userParam : Text
var $number : Real

$number:=Get database parameter:C643(User param value:K37:94; $userParam)

// For compilation check
If ($param="compile")
	var $status : Object
	$status:=Compile project:C1760()
	
	$logText:=JSON Stringify:C1217($status; json pretty)
	
	// Write log to file on desktop
	$logFile:=Folder:C1567(fk desktop folder:K87:19).file("demo-Build4D-Win/compileLogs.txt")
	$logFile.setText($logText)
	
	If ($status.success)
		QUIT 0
	Else 
		// Log errors if needed
		//$status.logs
		QUIT 1
	End if 
End if 

// For full build
If ($param="build")
	// Call your buildClient and buildServer methods here
	var $logsClient : Collection
	var $logsServer : Collection
	var $successClient; $successServer : Object
	
	$successClient:=buildClient()
	$successServer:=buildServer()
	
	If ($successClient.success & $successServer.success)
		QUIT 0
	Else 
		QUIT 1
	End if 
End if 
