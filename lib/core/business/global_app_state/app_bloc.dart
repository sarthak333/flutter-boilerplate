import 'package:flutter_boilerplate/core/business/global_app_state/app_events.dart';
import 'package:flutter_boilerplate/core/data/models/common/app_state_model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class AppBloc extends HydratedBloc<AppEvent, AppState> {
  AppBloc() : super(AppState(token: 'dsfasdf'));

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event.type == AppEventType.loginEvent) {
      yield state.copyWith(token: event.data);
    }
  }

  @override
  AppState fromJson(Map<String, dynamic> json) =>
      AppState.fromJson(json['value']);

  @override
  Map<String, dynamic> toJson(dynamic state) => {'value': state};
}
