import 'package:graphql_flutter/graphql_flutter.dart';

abstract class GrahpqlError {
  static void checkQueryError(QueryResult e) {
    if (e.hasException) {
      if (e.exception!.graphqlErrors.isEmpty) {
        print(e.exception!.linkException!.originalException);
        throw Exception(e.exception!.linkException!.originalException);
      }
      throw Exception(e.exception?.graphqlErrors[0].message);
    }
  }
}