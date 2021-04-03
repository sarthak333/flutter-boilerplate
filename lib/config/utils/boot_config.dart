import 'package:flutter_boilerplate/config/utils/firebase.dart';

Future<bool> handleBoot() async {
  await handleFirebaseConfig(null);
  return true;
}
