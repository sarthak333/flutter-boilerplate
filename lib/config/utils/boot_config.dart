import 'package:flutter_boilerplate/config/utils/apollo_client.dart';
import 'package:flutter_boilerplate/config/utils/firebase.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

Future<bool> handleBoot() async {
  await DotEnv.load(fileName: ".env");
  await handleFirebaseConfig(null);
  await initApolloClient();
  return true;
}
