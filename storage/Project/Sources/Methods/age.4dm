//%attributes = {"invisible":true,"preemptive":"capable"}
#DECLARE($max : Integer)->$age : Integer

$max:=$max<0 ? 100 : $max
$max:=$max=0 ? 100 : $max

$age:=(Random:C100%$max)+1