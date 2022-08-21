import 'package:desafio_rick_and_morty/controllers/character_controller.dart';

import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  CharacterController characterController = CharacterController();

  test(
    'Controller Test -load second character name',
    () async {
      expect(
          await characterController
              .getCharacters(1)
              .then((value) => value[1].name),
          'Morty Smith');
    },
  );
}
