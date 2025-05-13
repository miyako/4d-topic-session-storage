#DECLARE($URL : Text; $preview : Text; $client : Text; $server : Text; $user : Text; $password : Text)

$status:={success: True:C214; values: []}

ARRAY LONGINT:C221($pos; 0)
ARRAY LONGINT:C221($len; 0)

Case of 
	: (Match regex:C1019("\\/teststogage\\/(.*)"; $URL; 1; $pos; $len))
		
		TRACE:C157
		
		var $storage : Object
		$storage:=Session:C1714.storage
		
		var $value : Text
		$value:=Substring:C12($URL; $pos{1}; $len{1})
		
		var $values : Collection
		$values:=$storage.values
		
		If ($values=Null:C1517)
			$values:=[].copy(ck shared:K85:29; $storage)
			Use ($storage)
				$storage.values:=$values
			End use 
		End if 
		
		If ($value#"")
			$values.push(OB Copy:C1225({value: $value; time: Timestamp:C1445}; ck shared:K85:29))
		End if 
		
		$status.success:=True:C214
		$status.values:=$values
		
End case 

WEB SEND TEXT:C677(JSON Stringify:C1217($status); "application/json")