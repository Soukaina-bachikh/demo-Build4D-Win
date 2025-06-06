//%attributes = {}
#DECLARE()->$logs : Collection
var $build : cs:C1710.Build4D.Server
var $settings : Object
var $success : Boolean
//var $archivePath : 

$settings:={}
$success:=False:C215
$settings.startElevated:=True:C214

// Define the external project file
$settings.projectFile:=Folder:C1567(fk desktop folder:K87:19).file("demo-Build4D-Win/Project/demo-Build4D-Win.4DProject")

// Define the 4D Server path
$settings.sourceAppFolder:=Folder:C1567(Application file:C491; fk platform path:K87:2).parent.parent.folder("4D Server")

// Configure the application
$settings.buildName:="serverApp"
$settings.destinationFolder:=Folder:C1567(fk desktop folder:K87:19).folder("buildApp/Server")

// Add the application icon
//$settings.iconPath:="/RESOURCES/myIcon.ico"

// Add the application information
$settings.versioning:={}
$settings.versioning.version:="1.0.0"
$settings.versioning.copyright:="copyright"
$settings.versioning.companyName:="4D SAS"

// Add the client archive
If ($settings.destinationFolder.parent.folder("Client/")#Null:C1517)
	$settings.windowsClientArchive:=$settings.destinationFolder.parent.folder("/Client").file("update.win.4darchive")
End if 

// Launch the build
$build:=cs:C1710.Build4D.Server.new($settings)
$success:=$build.build()
$logs:=$build.logs