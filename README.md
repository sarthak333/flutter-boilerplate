# Flutter Boilerplate

A scalable boilerplate for flutter apps.

### Features

- [x] A layered architecture
- [x] BLoC pattern
- [x] Fluro router
- [ ] Themes
- [ ] Common Components
  - [ ] Button
  - [ ] Alerts
  - [ ] Progress Indicators
  - [ ] Bottom Sheets
- [ ] Fluid transitions between components
- [ ] JSON Serialization

#### Fluro:

1. Define the route in [routes.dart](lib/config/routes/routes.dart)
2. Handle the route in [handlers.dart](lib/config/routes/route_handlers.dart)
3. Use Application singleton's `navigateTo` method for navigation.
   i.e. `Application.navigateTo()` instead of `Application.router.navigateTo()`.
4. Can be used for deeplinking.
