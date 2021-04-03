# Flutter Boilerplate

A scalable boilerplate for flutter apps.

### Features

- [x] A layered architecture
- [x] BLoC pattern via [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [x] Routing via [Fluro](https://pub.dev/packages/fluro) (Deeplinking supported)
- [x] ENV variables via [envify](https://pub.dev/packages/envify)
- [ ] Themes
- [ ] Common Components
  - [ ] Button
  - [x] Alerts
  - [ ] Progress Indicators
  - [ ] Bottom Sheets
- [ ] Fluid transitions between components
- [ ] JSON Serialization

#### Fluro:

1. Define the route in [routes.dart](lib/config/routes/routes.dart)
2. Handle the route in [handlers.dart](lib/config/routes/route_handlers.dart)
3. Use Application singleton's `navigateTo` method for navigation.
   i.e. `App.navigateTo()` instead of `App.router.navigateTo()`.
4. Can be used for deeplinking.

#### Environment

1. Define `.env.production` and `.env.development` in the root of the project.
2. Run `flutter pub run build_runner build` after creation and every change made to the env files.
3. Add the ENV variables in both the `.env` files and then the [abstraction class](lib/config/environment.dart).
4. ENV variables can then be accessed after importing the [environment file](lib/config/environment.dart).
   For example: `Env.key`

#### Toast Alerts
1. No need to pass context to display the toast alerts. 
2. Use `App.notifySuccess(message)` to display a success message.
3. Use `App.notifyWarning(message)` to display a warning message.
4. Use `App.notifyError(message)` to display a error message.
5. You can customize these toasts in the [app.dart](lib/config/app.dart) file. 
