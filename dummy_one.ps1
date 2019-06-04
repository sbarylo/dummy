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
	write-host "not_equal"
	exit 2
}
else {
	if ($ipmi_ips.count -lt 3) {
		exit 3
		write-host "less than three"
	}
	else {
		foreach ($ip in $ipmi_ips) {
			try {
				write-host "try ip"
				[ipaddress]$ip
			}
			catch {exit 4}
		}
#		$ipmi_ip_ping = @($ipmi_ipst | Where-Object { Test-Connection -ComputerName $_ -Quiet -Count 1})
#		if ($ipmi_ip_ping.count -ne $ipmi_ips.count) {
#			exit 5
#		}
#		else {
#			if(!(Test-Connection -ComputerName $env:ipmi_gw -Quiet -Count )) {
#				exit 6
#			}
#		}
	}
}

exit 0
