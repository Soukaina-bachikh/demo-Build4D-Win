//%attributes = {}
var $userParam : Text
var $number : Real
var $status : Object
var $logText : Text
var $logFile : Object
$number:=Get database parameter:C643(User param value:K37:94; $userParam)

// For compilation check
If ($userParam="compile")
	$status:=Compile project:C1760()
	
	$logText:=JSON Stringify:C1217($status)
	
	// Write log to file on desktop
	$logFile:=Folder:C1567(fk desktop folder:K87:19).file("demo-Build4D-Win/compileLogs.txt")
	$logFile.setText($logText)
	
End if 

// For full build
If ($userParam="build")
	// Call your buildClient and buildServer methods here
	var $logsClient : Collection
	var $logsServer : Collection
	var $successClient; $successServer : Boolean
	
	$successClient:=buildClient()
	$successServer:=buildServer()
	
End if 
QUIT 4D:C291