import 'package:flutter_boilerplate/config/utils/app.dart';
import 'package:flutter_boilerplate/core/data/models/app_state_model.dart';
import 'package:flutter_boilerplate/core/data/models/current_user_model.dart';
import 'package:flutter_boilerplate/core/data/repositories/global_app_repo.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class AppCubit extends HydratedCubit<AppState> {
  AppCubit() : super(AppState());

  final repo = GlobalRepo();

  void updateAccessToken(String token) {
    emit(state.copyWith(token: token));
  }

  Future<void> getCurrentUser() async {
    CurrentUser? user = await repo.getCurrentUser();
    if (user != null) {
      emit(state.copyWith(currentUser: user));
    }
  }

  void resetGraphqlClient() {
    App.shared.apolloClient.resetStore();
  }

  @override
  AppState fromJson(Map<String, dynamic> json) =>
      AppState.fromJson(json['value']);

  @override
  Map<String, dynamic> toJson(dynamic state) => {'value': state};
}
