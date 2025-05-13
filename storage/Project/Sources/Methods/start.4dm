//%attributes = {"invisible":true,"preemptive":"capable"}
var $server : 4D:C1709.WebServer
$server:=WEB Server:C1674

$server.start()
If ($server.isRunning)
	OPEN URL:C673(["http:"; ""; "127.0.0.1"; $server.defaultHomepage].join("/"))
End if 