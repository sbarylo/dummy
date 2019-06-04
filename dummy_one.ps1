write-host $PSversionTable.PSVersion
write-host $env:body
write-host $env:ipmi_ip_list
start-sleep -s 15

$ipmi_ips = $env:ipmi_ip_list.split(',')
write-host $ipmi_ips
write-host ($ipmi_ips | sort -unique)
write-host $ipmi_ips.count
write-host ($ipmi_ips | sort -unique).count

if ($ipmi_ips.count -ne ($ipmi_ips | sort -unique).count) {
	exit 1
}
else {
	if ($ipmi_ips -lt 3) {
		exit 2
	}
	else {
		foreach ($ip in $ipmi_ips) {
			try {
				[ipaddress]$ip
			}
			catch {exit 3}
		}
#		$ipmi_ip_ping = @($ipmi_ipst | Where-Object { Test-Connection -ComputerName $_ -Quiet -Count 1})
#		if ($ipmi_ip_ping.count -ne $ipmi_ips.count) {
#			exit 4
#		}
#		else {
#			if(!(Test-Connection -ComputerName $env:ipmi_gw -Quiet -Count )) {
#				exit 5
#			}
#		}
	}
}
