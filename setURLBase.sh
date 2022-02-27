# this command will change the URL Base from "/" to /lidarr
sed -i'.original' -e 's/<UrlBase></<UrlBase>lidarr</g' /usr/local/lidarr/config.xml
# for setting the correct file user and group
chown lidarr:lidarr /usr/local/lidarr/config.xml

# this command will change the URL Base from "/" to /sonarr
sed -i'.original' -e 's/<UrlBase></<UrlBase>sonarr</g' /usr/local/sonarr/config.xml
# for setting the correct file user and group
chown sonarr:sonarr /usr/local/sonarr/config.xml

# this command will change the URL Base from "/" to /radarr
sed -i'.original' -e 's/<UrlBase></<UrlBase>radarr</g' /usr/local/radarr/config.xml
# for setting the correct file user and group
chown radarr:radarr /usr/local/radarr/config.xml

# this command will change the URL Base from "/" to /prowlarr
sed -i'.original' -e 's/<UrlBase></<UrlBase>prowlarr</g' /usr/local/prowlarr/config.xml
# for setting the correct file user and group
chown prowlarr:prowlarr /usr/local/prowlarr/config.xml
