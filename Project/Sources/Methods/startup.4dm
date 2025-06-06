//%attributes = {}
//var $userParam : Text
//var $number : Real
//var $successClient; $successServer : Boolean
//$number:=Get database parameter(User param value; $userParam)
//If ($userParam="build")

//TRACE
//$successClient:=buildClient()
//$successServer:=buildServer()

//End if 
////QUIT 4D

////// For compilation check
////If ($userParam="compile")
////$status:=Compile project()

////$logText:=JSON Stringify($status)

////// Write log to file on desktop
////$logFile:=Folder(fk desktop folder).file("demo-Build4D-Win/compileLogs.json")
////$logFile.setText($logText)

////End if 

//// For full build