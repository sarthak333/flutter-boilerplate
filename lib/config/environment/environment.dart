import 'package:flutter/foundation.dart';
import 'package:envify/envify.dart';
part 'environment.g.dart';

@Envify(path: kReleaseMode ? '.env.production' : '.env.development')
abstract class Env {
  static const key = _Env.key;
}
