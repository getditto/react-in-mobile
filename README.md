# React in Web App 

Ever wanted to build a React app, bundle it and run it locally on a mobile device? This is a project for you! Often at [Ditto](https://www.ditto.live), we have customers who simply can't port a ton of code to SwiftUI, Jetpack Compose or have the know-how to wrangle React Native. Sometimes, a good old single-page web app will do the job. But what if you don't have any internet? This project will show you how you can build the web app, bundle it with some nice build scripts, and run it _locally_ in your iOS or Android app

# Prerequisites

* XCode 14.3 or higher for iOS
Nvm[ installed on](https://github.com/nvm-sh/nvm) your machine](https://github.com/nvm-sh/nvm) and set to use NodeJS 20
* Android version is coming shortly.


### Setting NVM to Node 20

If you've already installed [nvm](https://github.com/nvm-sh/nvm), then you can run:

```sh
nvm install 20
nvm alias default 20
```

# Running it on iOS

1. Run `cd web` and run `npm install`
2. Open up `ios/Host.xcproj`
3. Run it in a simulator. 
