import 'dart:io';

import 'package:flutter_boilerplate/config/utils/app.dart';
import 'package:graphql/client.dart';
import 'package:path_provider/path_provider.dart';

Future<void> initApolloClient() async {
  final _httpLink = HttpLink(App.API_URL);

  final _authLink = AuthLink(
    getToken: () async => App.token,
  );

  Link _link = _authLink.concat(_httpLink);

  Directory tempdir = await getTemporaryDirectory();

  // Hive store allows the queried data to remain persistent across app sessions.
  // TODO: add a settings option to enable/disable this functionality
  final store = await HiveStore.open(path: tempdir.path);

  final GraphQLClient client = GraphQLClient(
    cache: GraphQLCache(store: store),
    link: _link,
  );
  App.shared.apolloClient = client;
}
