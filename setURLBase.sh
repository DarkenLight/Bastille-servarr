#!/usr/bin/env bash

# Load the rc config file
. /etc/rc.subr && load_rc_config

# Function to set the URL base of a service
function set_UrlBase() {
  service_name=$1
  service_home="/usr/local"
  
  # Restart the service and change URL base
  service "${service_name}" restart
  service "${service_name}" stop
  echo "${service_name} is installed and enabled"
  echo "Changing the URL Base of $service_name, from / to /$service_name"
  sed -i'.original' -e "s/<UrlBase></<UrlBase>${service_name}</g" ${service_home}/${service_name}/config.xml
  
  # Set correct file permissions and restart service
  echo "Setting permissions for $service_home/$service_name/config.xml"
  chown -R ${service_name}:${service_name} ${service_home}/${service_name}/config.xml
  service "${service_name}" start
}

# Check if Lidarr is enabled and set its URL base
if [ "${lidarr_enable}" == "YES" ]; then
  set_UrlBase lidarr
else
  echo "Lidarr is not enabled"
fi

# Check if Sonarr is enabled and set its URL base
if [ "${sonarr_enable}" == "YES" ]; then
  set_UrlBase sonarr
else
  echo "Sonarr is not enabled"
fi

# Check if Radarr is enabled and set its URL base
if [ "${radarr_enable}" == "YES" ]; then
  set_UrlBase radarr
else
  echo "Radarr is not enabled"
fi

# Check if Prowlarr is enabled and set its URL base
if [ "${prowlarr_enable}" == "YES" ]; then
  set_UrlBase prowlarr
else
  echo "Prowlarr is not enabled"
fi

# Check if Readerr is enabled and set its URL base
if [ "${readerr_enable}" == "YES" ]; then
  set_UrlBase readerr
else
  echo "Readerr is not enabled"
fi
