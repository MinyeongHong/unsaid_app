# unsaid_app

## build runner

dart run build_runner build --delete-conflicting-outputs

## pod

arch -arm64 pod install --repo-update
arch -arm64 pod update
pod deintegrate
pod cache clean --all

## simulator

xcrun simctl list devices
xcrun simctl erase all
xcrun simctl delete unavailable
sudo killall -9 com.apple.CoreSimulator.CoreSimulatorService

## xcode

~/Library/Developer/Xcode/DerivedData
~/Library/Developer/CoreSimulator/Devices
/Library/Developer/CoreSimulator/Profiles/Runtimes

## flutter pub

flutter pub outdated
flutter pub upgrade
flutter pub upgrade --major-versions
flutter pub cache clean

## icon

dart run flutter_launcher_icons

## splash

dart run flutter_native_splash:create

## cocoapods

sudo gem install cocoapods

## edit server 

cd functions
npm run build

cd functions
npm run build
cd ..
pkill -f "firebase emulators"
firebase emulators:start --only functions

## dev server

firebase use dev
firebase emulators:start --only functions

## prod server

firebase use prod
firebase emulators:start --only functions


## prod deploy

firebase use prod
firebase deploy --only functions
