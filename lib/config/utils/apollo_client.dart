import 'package:flutter_boilerplate/config/utils/app.dart';
import 'package:graphql/client.dart';

void initApolloClient() {
  final _httpLink = HttpLink(App.API_URL);

  final _authLink = AuthLink(
    getToken: () async => App.token,
  );

  Link _link = _authLink.concat(_httpLink);
  final GraphQLClient client = GraphQLClient(
    cache: GraphQLCache(),
    link: _link,
  );
  App.shared.apolloClient = client;
}
