# StickySessions

[![Platform][platform-ios-image]][platform-ios-url]
[![Swift Version][swift-image]][swift-url]
[![License][license-image]][license-url]
[![CocoaPods Compatible][pod-image]][pod-url]
[![PRs Welcome][prs-welcome-image]][prs-welcome-url]

Sticky Sessions is an application that helps medium to large teams to share and store their thoughts through digital-like retrospective sessions. This is the repository of the iOS App.

## Usage

This iOS app is intended to be used along with [Backend][server] and [Web][web] applications. Please check their repositories for more information about how to run them.

An usual session would follow steps below:
1. User creates a session on web app
2. He shares the session with team
3. Team start adding notes during a predefined time on the iOS app
4. Team discuss notes visualizing them on web app
5. A mediator export notes on web app and send them to team.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Requirements

- iOS 9.0+
- Xcode 7.3

### Installing

First clone the repository to a local folder on your machine.

You can use [CocoaPods](http://cocoapods.org/) to install project's dependencies. Go to project's root folder and run:

```
pod install
```

### Setup

The app uses Google Sign-in with Firebase authentication as its login method therefore in order to compile it you need to setup an Firebase account, associate app on console and download `GoogleService-Info.plist` file.

Copy `GoogleService-Info.plist` to StickySessions folder along side with [Info.plist](StickySessions/Info.plist), go to project Settings > Info add a new URL Types and paste reverse_client_id on URLScheme field.

### Backend server communication

Project is intended to have 2 flavors (`Stag` and `Prod`) which change backend URL used by app.
- `Prod` is intended for production and should be used only on real meetings
- `Stag` is intended for development and testing of new features

Currently in order to change from stag to production you have to change [Urls.swift](StickySessions/Remote/Urls.swift) to change backend url used by the app.

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on the development process and how to submit pull requests.

See also the list of [contributors](https://github.com/DiscordTime/sticky-sessions-ios/graphs/contributors) who participated in this project and contact them if you have any questions.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

[server]: https://github.com/DiscordTime/sticky-sessions-server/tree/dev
[web]:https://github.com/DiscordTime/sticky-sessions-web/tree/dev

[platform-ios-image]: https://img.shields.io/badge/platform-ios-lightgrey.svg
[platform-ios-url]: https://developer.apple.com/ios/
[swift-image]: https://img.shields.io/badge/swift-5.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
[pod-image]: https://img.shields.io/badge/pod-v1.7.2-red.svg
[pod-url]: http://cocoapods.org
[prs-welcome-image]: https://img.shields.io/badge/PRs-welcome-green.svg
[prs-welcome-url]: https://github.com/DiscordTime/sticky-sessions-ios/issues