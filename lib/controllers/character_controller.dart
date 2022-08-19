import 'dart:convert';

import 'package:desafio_rick_and_morty/models/character_model.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CharacterController {
 Future<List<CharacterModel>> getCharacters() async {
    GraphQLClient _client = GraphQLConfiguration().client();
    // String baseUrl = Constants.BASE_URL_DOG;
    //
    // var client = http.Client();

    try {
      QueryResult resultado = await _client.query(
        QueryOptions(
          document: gql("""
 query {
  characters {
    results {
      name
      gender
      image
      
    }
  }

}
      """),fetchPolicy: FetchPolicy.noCache
          // variables: {
          //   "celular": celular,
          //   "id": id,
          // },
        ),
      );

      GrahpqlError.checkQueryError(resultado);
      print(resultado);
      return CharacterModel.createCharactersFromArray("characters", resultado);
    } catch (err) {
      print(err);
      // return err;
      print("dhdssssh");
      return Future.error(err);
    }
  }
}

class GraphQLConfiguration {
  Link? link;

  GraphQLClient client() {
    return GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink('https://rickandmortyapi.com/graphql'),
    );
  }
}

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
