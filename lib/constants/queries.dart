const String login = r'''
  mutation authLogin ($email: String!, $password: String!) {
    authLogin(email: $email, password: $password) {
      accessToken
      expiresAt
    }
  }
''';
