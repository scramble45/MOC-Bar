# MOC-Bar

OSX GUI for MOC

  Basic Menu Bar controls for MOC Player: OS-X brew port.
  - Controls:
- Play/Pause
- Next Track
- Previous Track


  - WIP Items:
- Now Playing
- Notifications on Item Playing.


The objective basic menu system control from the desktop with little fuss.


- For information about how to get MOC running check out this blog post: [MOC on OS X] . I have post a stripped down version of the instructions below with my example plist.


Instructions for installing MOC on OSX
-----------

Ensure you have [Brew] for this to work properly and its updated and upgraded:

```sh
brew update
brew upgrade
```
Installing dependencies and moc:
```sh
brew install berkeley-db
brew install jack
brew install libmad
brew install libid3tag
brew install moc
```

Creating your jackd LaunchAgent:
```sh
sudo nano /Library/LaunchAgents/org.jackaudio.jackd.plist 
```

Use my example below. remove -r96000 string if you want it to default to standard output.

Setting Permissions on the LaunchAgent.
```sh
sudo chown root /Library/LaunchAgents/org.jackaudio.jackd.plist 
```

There may be other permissions to set but you can test using: 
```sh
sudo launchctl load /Library/LaunchAgents/org.jackaudio.jackd.plist
```


Starting Moc:
```sh
mocp 
```


##### Note:

You may wish to remove the "-r96000" in the plist below. For my purpose I wanted "jackd" to output at 96000.00 Hz. If you are playing 24bit Flac you will probably want to leave this turned on. 

I may build in support to switch from the default Hz to 96000.00 from the menu system. The reason I would implement this is because if you are switching audio sources you may have distorted sound or other various playback issues.



org.jackaudio.jackd.plist
--------------

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Label</key>
	<string>org.jackaudio.jackd</string>
	<key>WorkingDirectory</key>
	<string>/Users/ShortName/</string>
	<key>ProgramArguments</key>
	<array>
		<string>/usr/local/Cellar/jack/0.121.3/bin/jackd</string>
		<string>-d</string>
		<string>coreaudio</string>
		<string>-r96000</string>
	</array>
	<key>EnableGlobbing</key>
	<true/>
	<key>RunAtLoad</key>
	<true/>
	<key>KeepAlive</key>
	<true/>
</dict>
</plist>
```






License
----

What License? - Do whatever you want.


**Follow me on [Twitter]**

[MOC on OS X]:http://floss.zoomquiet.io/data/20140103161933/index.html
[brew]:http://brew.sh
[Twitter]:http://twitter.com/r0w
