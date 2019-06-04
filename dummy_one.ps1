write-host $PSversionTable.PSVersion
write-host $env:body

start-sleep -s 15

$ipmi_ips = $env:ipmi_ip_list.split(',')


if ($ipmi_ips.count -ne ($ipmi_ips | sort -unique).count) {
	write-host "not_equal"
	exit 1
}
else {
	if ($ipmi_ips.count -lt 3) {
		write-host "less than three"
		exit 2
	}
	else {
		$ip_octet = '(?:0?0?[0-9]|0?[1-9][0-9]|1[0-9]{2}|2[0-5][0-5]|2[0-4][0-9])'
		[regex] $IPv4Regex = "^(?:$ip_octet\.){3}$ip_octet$"
		foreach ($ip in $ipmi_ips) {
				write-host "try ip" $ip
				if (!($ip -match $IPv4Regex)){exit 3}
		}
#		$ipmi_ip_ping = @($ipmi_ips | Where-Object { Test-Connection -ComputerName $_ -Quiet -Count 1})
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

$cvm_ips = $env:cvm_ip_list.split(',')

if ($cvm_ips.count -ne ($cvm_ips | sort -unique).count) {
	write-host "not_equal"
	exit 1
}
else {
	if ($cvm_ips.count -lt 3) {
		write-host "less than three"
		exit 2
	}
	else {
		$ip_octet = '(?:0?0?[0-9]|0?[1-9][0-9]|1[0-9]{2}|2[0-5][0-5]|2[0-4][0-9])'
		[regex] $IPv4Regex = "^(?:$ip_octet\.){3}$ip_octet$"
		foreach ($ip in $cvm_ips) {
				write-host "try ip" $ip
				if (!($ip -match $IPv4Regex)){exit 3}
		}
#		$cvm_ip_ping = @($cvm_ips | Where-Object { Test-Connection -ComputerName $_ -Quiet -Count 1})
#		if ($cvm_ip_ping.count -gt 0) {
#			exit 4
#		}
#		else {
#			if(!(Test-Connection -ComputerName $env:cvm_esx_gw -Quiet -Count )) {
#				exit 5
#			}
#		}
	}
}

$esx_ips = $env:esx_ip_list.split(',')

if ($esx_ips.count -ne ($esx_ips | sort -unique).count) {
	write-host "not_equal"
	exit 1
}
else {
	if ($esx_ips.count -lt 3) {
		write-host "less than three"
		exit 2
	}
	else {
		$ip_octet = '(?:0?0?[0-9]|0?[1-9][0-9]|1[0-9]{2}|2[0-5][0-5]|2[0-4][0-9])'
		[regex] $IPv4Regex = "^(?:$ip_octet\.){3}$ip_octet$"
		foreach ($ip in $esx_ips) {
				write-host "try ip" $ip
				if (!($ip -match $IPv4Regex)){exit 3}
		}
#		$esx_ip_ping = @($esx_ips | Where-Object { Test-Connection -ComputerName $_ -Quiet -Count 1})
#		if ($esx_ip_ping.count -gt 0) {
#			exit 4
#		}
#		else {
#			if(!(Test-Connection -ComputerName $env:cvm_esx_gw -Quiet -Count )) {
#				exit 5
#			}
#		}
	}
}

$esx_hostnames = $env:esx_hostname_list.split(',')

if ($esx_hostnames.count -ne ($esx_hostnames | sort -unique).count) {
	write-host "not_equal"
	exit 1
}
else {
	if ($esx_hostnames.count -lt 3) {
		write-host "less than three"
		exit 2
	}
}

exit 0
