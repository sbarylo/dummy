write-host $PSversionTable.PSVersion
write-host $env:body
start-sleep -s 15

$ipmi_ips = $env:ipmi_ip_list.split(',')

if ($ipmi_ip_list.count -ne ($ipmi_ip_list | sort -unique).count) {
	exit 1
}
else {
	if ($ipmi_ip_list.count -lt 3) {
		exit 2
	}
	else {
		foreach ($ip in $ipmi_ip_list) {
			try {
				[ipaddress]$ip
			}
			catch {exit 3}
		}
#		$ipmi_ip_ping = @($ipmi_ip_list | Where-Object { Test-Connection -ComputerName $_ -Quiet -Count 1})
#		if ($ipmi_ip_ping.count -ne $ipmi_ip_list.count) {
#			exit 4
#		}
#		else {
#			if(!(Test-Connection -ComputerName $env:ipmi_gw -Quiet -Count )) {
#				exit 5
#			}
#		}
	}
}
