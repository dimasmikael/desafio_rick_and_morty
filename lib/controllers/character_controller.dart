import 'package:desafio_rick_and_morty/models/character_model.dart';
import 'package:desafio_rick_and_morty/shared/graphql/grahpql-error.dart';
import 'package:desafio_rick_and_morty/shared/graphql/graphql-configuration.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CharacterController {
  Future<List<CharacterModel>> getCharacters(int? pagination) async {
    GraphQLClient _client = GraphQLConfiguration().client();

    QueryResult result = await _client.query(
      QueryOptions(
        document: gql("""
 query (\$page: Int!){
  characters (page:\$page){
    results {
       id
      name
      gender
      image
      status
       location{
        id
        name
        dimension
      }
    }
  }

}
   """),
        fetchPolicy: FetchPolicy.noCache,
        variables: {
          'page': pagination!,
        },
      ),
    );

    GrahpqlError.checkQueryError(result);

    if (result.hasException) {
      throw Exception(
        result.exception.toString(),
      );
    }
    List<CharacterModel> characters =
        CharacterModel.createCharactersFromArray("characters", result);
    if (characters.isEmpty) {
      throw Exception("No data.");
    }
    return characters;
  }
}
