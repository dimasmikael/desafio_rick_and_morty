import 'package:desafio_rick_and_morty/models/character_model.dart';
import 'package:desafio_rick_and_morty/shared/graphql/grahpql-error.dart';
import 'package:desafio_rick_and_morty/shared/graphql/graphql-configuration.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CharacterController {
  Future<List<CharacterModel>> getCharacters(int? paginacao) async {
    GraphQLClient _client = GraphQLConfiguration().client();

    try {
      QueryResult resultado = await _client.query(
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
            'page': paginacao!,
          },
        ),
      );
      print("paginacao!.take");
      print(paginacao!);
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
