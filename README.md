# React in Web App

Ever wanted to build a React app, bundle it and run it locally on a mobile device? This is a project for you! Often at [Ditto](https://www.ditto.live), we have customers who simply can't port a ton of code to SwiftUI, Jetpack Compose or have the know-how to wrangle React Native. Sometimes, a good old single-page web app will do the job. But what if you don't have any internet? This project will show you how you can build the web app, bundle it with some nice build scripts, and run it _locally_ in your iOS or Android app

![Final image of a React Web app Running within an iOS and Android app](./final-image.jpg)

## Prerequisites

- Xcode 14.3 or higher for iOS
- [NVM](https://github.com/nvm-sh/nvm) installed on your machine and set to use Node.js 20

### Setting NVM to Node 20

If you've already installed [nvm](https://github.com/nvm-sh/nvm), then you can run:

```sh
nvm install 20
nvm alias default 20
```

## Running it on iOS

1. Run `cd web` and run `npm install` to install the dependencies
2. Open up `ios/Host.xcproj` in Xcode
3. Run it in a simulator or on a physical device

## Running on Android

1. Run `cd web` and run `npm install` to install the dependencies
2. Open the `android` directory in Android Studio
3. Build and run the app in an emulator or on a physical device
