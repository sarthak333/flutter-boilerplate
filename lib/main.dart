import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/config/utils/SimpleBlocObserver.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/config/utils/firebase.dart';
import 'package:flutter_boilerplate/core/presentation/app/app.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(handleFirebaseConfig);
  Bloc.observer = SimpleBlocObserver();
  runApp(AppComponent());
}
