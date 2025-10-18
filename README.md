[![BuyMeACoffee](https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-2.svg)](https://buymeacoffee.com/devthantziq)

# Flutter Environment Flavors Setup

This project demonstrates how to configure **multiple environment
flavors** (`development`, `staging`, `production`) in Flutter.\
Flavors allow you to create separate app configurations (e.g., package
IDs, app names, Firebase setups) for each environment.

------------------------------------------------------------------------

## Building & Running Flavors

### Android

``` bash
flutter run --flavor development -t lib/main_development.dart
flutter run --flavor staging -t lib/main_staging.dart
flutter run --flavor production -t lib/main_production.dart
```

### iOS

``` bash
flutter run --flavor development -t lib/main_development.dart
flutter run --flavor staging -t lib/main_staging.dart
flutter run --flavor production -t lib/main_production.dart
```

### Build Release APKs

``` bash
flutter build apk --flavor development -t lib/main_development.dart
flutter build apk --flavor staging -t lib/main_staging.dart
flutter build apk --flavor production -t lib/main_production.dart
```

### Build iOS IPA

``` bash
flutter build ipa --flavor development -t lib/main_development.dart
flutter build ipa --flavor staging -t lib/main_staging.dart
flutter build ipa --flavor production -t lib/main_production.dart
```

------------------------------------------------------------------------

## ❤️ Support

Hi 👋 If you find this is useful, you can [buy me a coffee](https://buymeacoffee.com/devthantziq) ☕ to support my work and make my sleepless nights easier.
