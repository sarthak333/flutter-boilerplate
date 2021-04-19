import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/config/utils/bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/config/utils/boot_config.dart';
import 'package:flutter_boilerplate/config/utils/firebase.dart';
import 'package:flutter_boilerplate/core/presentation/app/app.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  FirebaseMessaging.onBackgroundMessage(handleFirebaseConfig);
  Bloc.observer = SimpleBlocObserver();
  await handleBoot();
  runApp(AppComponent());
}
