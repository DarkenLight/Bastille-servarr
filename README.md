
# Bastille-servarr
This is a  jail tempate for Lidarr, Prowlarr, Radarr, Readarr, and Sonarr. Collectively they are referred to as "*Arr" or "*Arrs". They are designed to automatically grab, sort, organize, and monitor your Music, Movie, E-Book, or TV Show collections for Lidarr, Radarr, Readarr, and Sonarr; and to manage your indexers and keep them in sync with the aforementioned apps for Prowlarr.
Installation overview using XigmanasNAS Bastille Extension Gui

## Jail Setup
1. From the main screen select Extension/Bastille
2. Click ADD [+] button
3. Name (any name will work): Servarr
4. Configure Network Properties to your liking
5. Base Release: 12.3-Release (or newer)
6. Jail Type: 
	- [ ] Create a thick container.
	- [x] Enable VNET(VIMAGE).
	- [ ] Create an empty container.
	- [ ] Create a Linux container.
	- [x] Start after creation.
	- [x] Auto start on boot.

7. Click Create

## Applying the servarr template to the newly created jail

1. SSH to your Xigmanas Server
2. BOOTSTRAP the template
	`bastille bootstrap https://github.com/DarkenLight/Bastille-servarr`
3. Apply the Template to the TARGATE jail.
	`bastille template servarr DarkenLight/Bastille-servarr`

### Thanks to [WiKiArr](https://wiki.servarr.com) for detailed instructions.
