# UitzendingGemist Apple TV 2 app

This is a simple application allowing me to watch tv-shows from UitzendingGemist.nl without having to use AirPlay.

_For this to work your Apple TV 2 has to be jailbroken and run OS 5.0.x._

_UitzendingGemist.nl is the Dutch public broadcasting site, so it might not work abroad. However, the iOS Simulator layer, CocoaPods integration, and the Xcode 4 FRAppliance template are still of use to anyone looking into Apple TV 2 app development._


### Screenshots

![Shows](http://alloy.github.com/UitzendingGemist-ATV2/screenshots/Shows.png)

![Episodes](http://alloy.github.com/UitzendingGemist-ATV2/screenshots/Episodes.png)

![Favorites](http://alloy.github.com/UitzendingGemist-ATV2/screenshots/Favorites.png)


### Installation

For now installation is done by a post-build script in Xcode, which assumes you have setup SSH public-key authentication. Otherwise copy the build to:

    /Applications/AppleTV.app/Appliances/Gemist.frappliance


### Components in this repo

Since the Apple TV 2 APIs are all private, the environment tends to vary between OS versions. At the time of writing I am running OS 5.0.1, which is iOS 5.1.1. It will probably work with 5.0.2 as well.

* `BackRow/Device`: Dump of the BackRow framework headers
* `BackRow/Simulator`: My own very thin BackRow API implementation on top of UIKit, asllowing me to develop/debug faster by using the iOS Simulator. This is implemented as I go, it’s goal is not to cover everything, but additions will be much appreciated. Currently it mainly implements ‘list menus’.
* `Gemist`: The UitzendingGemist.nl application code.
* `Gemist-Sim`: The target that runs the application code on the iOS Simulator.
* `Pods`: Since the Apple TV 2 is based on iOS, I can use [CocoaPods](https://github.com/CocoaPods/CocoaPods) for third-party libraries without any problem.
* `Xcode/FRAppliance.xctemplate`: A Xcode 4 template that adds a FRAppliance target.


### Acknowledgments

* Thanks to Michael Gile ([@mgile](http://twitter.com/mgile)) for his [Hello World](https://github.com/mgile/atvHelloWorld) example.
* Thanks to Kevin Bradley ([@nitoTV](http://twitter.com/nitoTV)) for his [Hello World](https://github.com/lechium/HelloWorld_ATVBlack) example.


### License

The code in this repository is MIT licensed. See the LICENSE file.
