# BackRow:

* How do I generate the header dump of ATV2 OS 5.0.1 myself? The BackRow framework doesn't exist anymore and dumping the AppleTV app doesn't give me everything.

# FRAppliance.xctemplate:

* Don't build as Objective-C++ by default.
* Add InfoPlist.strings file with app title
* Add AppIcon.png (this is apperantly different on other OS versions, I have 5.0.1)
* Only build for armv7.

# App:

##### Features

* Add a recently added episodes list.
* Add a main controller with cover flow type view (BRMediaParadeControl) of recently added episodes. Possibly see: https://github.com/tomcool420/SMFramework.
* Release 1.0.0

##### Enhancements

* Finish localization.
* Silence HockeyApp debug output.

* Don't show favorites menu when there are none?
* Cleanup inline hacks made to HockeySDK. Commit: a9f13e30a1a059311c552c906e412d6407359108.
* Before making a request check that we have the required cookie instead of hoping for the best and making a possible extra request in the process.
* Add remote logging with different levels. Maybe NSLogger over network? Does images too.
* Use Core Data?
* Check what NSURLCache is caching and/or optimize. E.g. Cache banners of favorites to disk.
* There’s a potential memleak in HTMLNode.m when the first attr is NULL, newVal never gets freed.

##### Release

* Currently our crash reporter takes over all crash reporting (for all apps), I’m not sure if it’s a real problem, but it doesn’t sound nice. Thoughts:
  * Is there currently a uncaught exception handler set?
  * Can we get events of when our appliance is started and ended? (Maybe appliance init/dealloc?) and can we disable our crash reporter when the appliance is de-activated? I.e. save the uncaught exception handler that's already set and restore it.
  * Otherwise possibly submit the crash reports the AppleTV stores itself? Only lame thing is that it doesn't contain the exception reason, which is logged to the syslog.
  * Completely disable crash reporting on release if there are no nice solutions.
