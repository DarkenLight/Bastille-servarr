#!/usr/bin/env bash

. /etc/rc.subr && load_rc_config

function set_UrlBase()
{
service_name=$1
service_home="/usr/local"
echo "${service_name} is installed and enabled"
# this command will change the URL Base from "/" to $service_name
echo "Changing the URL Base of $service_name , from / to /$service_name"
sed -i'.original' -e "s/<UrlBase></<UrlBase>${service_name}</g" ${service_home}/${service_name}/config.xml
# for setting the correct file user and group
echo "setting permission to $service_home/$service_name/config.xml"
echo
chown -R ${service_name}:${service_name} ${service_home}/${service_name}/config.xml
}

if [ "${lidarr_enable}" == "YES" ]; then
	set_UrlBase lidarr
else
	echo "Lidarr Not Enabled"
fi

if [ "${sonarr_enable}" == "YES" ]; then
	set_UrlBase sonarr
else
	echo "sonarr Not Enabled"
fi

if [ "${radarr_enable}" == "YES" ]; then
	set_UrlBase radarr
else
	echo "radarr Not Enabled"
fi

if [ "${prowlarr_enable}" == "YES" ]; then
	set_UrlBase prowlarr
else
	echo "prowlarr Not Enabled"
fi
