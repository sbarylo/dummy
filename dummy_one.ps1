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
	exit 1
}
else {
	if ($ipmi_ips.count -lt 3) {
		exit 2
		write-host "less than three"
	}
	else {
		$ip_octet = '(?:0?0?[0-9]|0?[1-9][0-9]|1[0-9]{2}|2[0-5][0-5]|2[0-4][0-9])'
		[regex] $IPv4Regex = "^(?:$ip_octet\.){3}$ip_octet$"
		foreach ($ip in $ipmi_ips) {
				write-host "try ip" $ip
				if (!($ip -match $IPv4Regex)){exit 3}
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

exit 0
