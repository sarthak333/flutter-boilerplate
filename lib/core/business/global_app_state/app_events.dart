enum AppEventType {
  loginEvent,
  logoutEvent,
}

class AppEvent {
  final dynamic data;
  final AppEventType type;

  AppEvent(this.type, this.data);
}
