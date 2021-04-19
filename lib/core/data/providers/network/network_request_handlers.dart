// Use this for queries
import 'package:flutter_boilerplate/config/utils/apollo_client.dart';
import 'package:flutter_boilerplate/core/data/models/api_response_model.dart';
import 'package:graphql/client.dart';

Future<ApiResponse> graphqlQuery(
  String query,
  Map<String, dynamic> variables, {
  FetchPolicy fetchPolicy = FetchPolicy.cacheAndNetwork,
}) async {
  final QueryOptions options = QueryOptions(
    fetchPolicy: fetchPolicy,
    document: gql(query),
    variables: variables,
  );
  ApiResponse apiReponse;
  final QueryResult result = await client.query(options);
  if (result.hasException) {
    apiReponse = ApiResponse(
      null,
      result.exception?.graphqlErrors[0].message,
      false,
    );
  } else if (result.data != null) {
    apiReponse = ApiResponse(
      result.data,
      null,
      true,
    );
  } else {
    apiReponse = ApiResponse(
      {},
      'Something went wrong!',
      false,
    );
  }
  return apiReponse;
}

// Use this for mutations
Future<ApiResponse> graphqlMutate(
    String mutation, Map<String, dynamic> variables) async {
  final MutationOptions options = MutationOptions(
    document: gql(mutation),
    variables: variables,
  );
  ApiResponse apiReponse;
  final QueryResult result = await client.mutate(options);
  if (result.hasException) {
    apiReponse = ApiResponse(
      null,
      result.exception?.graphqlErrors[0].message,
      false,
    );
  } else if (result.data != null) {
    apiReponse = ApiResponse(
      result.data,
      null,
      true,
    );
  } else {
    apiReponse = ApiResponse(
      {},
      'Something went wrong!',
      false,
    );
  }
  return apiReponse;
}
