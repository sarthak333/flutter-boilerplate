class ApiResponse {
  final bool isSuccess;
  final String? graphqlError;
  final dynamic? data;

  ApiResponse(this.data, this.graphqlError, this.isSuccess);
}
