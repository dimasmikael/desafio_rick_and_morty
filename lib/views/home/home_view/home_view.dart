import 'package:desafio_rick_and_morty/controllers/character_controller.dart';
import 'package:desafio_rick_and_morty/models/character_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CharacterController? _characterController = CharacterController();
  List<CharacterModel>? characters = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _carregarProdutos(),
    );
    super.initState();
  }

  Future<void> _carregarProdutos() async {
    try {
      List<CharacterModel>? _produtos =
          await this._characterController?.getCharacters();

      setState(
        () {
          characters = _produtos;
        },
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("characters?.length ??0");
    print(characters?.length ?? 0);
    return Container();
  }
}
