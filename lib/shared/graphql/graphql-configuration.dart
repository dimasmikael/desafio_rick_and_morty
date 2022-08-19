import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfiguration {
  Link? link;

  GraphQLClient client() {
    return GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink('https://rickandmortyapi.com/graphql'),
    );
  }
}