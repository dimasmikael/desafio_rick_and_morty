import 'package:desafio_rick_and_morty/controllers/character_controller.dart';
import 'package:desafio_rick_and_morty/models/character_model.dart';
import 'package:desafio_rick_and_morty/shared/base-service/base.service.dart';
import 'package:desafio_rick_and_morty/shared/style/style_text.dart';
import 'package:desafio_rick_and_morty/views/home/home_view/widgets/list_characters_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin<HomeView> {
  CharacterController? _characterController = CharacterController();
  late int paginacao = 1;
  List<CharacterModel>? characters = [];
  BuildContext? _context;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _loadCharacters(paginacao),
    );
    super.initState();
  }

  Future<void> _loadCharacters(paginacao) async {
    if (paginacao != null) {
      if (context != null) ;
      BaseService.loading.startLoading(this.context);

      List<CharacterModel>? loadCharacters =
          await _characterController?.getCharacters(paginacao);
      List<CharacterModel> _listaNova = [
        ...?this.characters,
        ...?loadCharacters
      ];

      setState(
        () {
          this.characters = _listaNova;
        },
      );

      if (context != null) ;
      BaseService.loading.stopLoading(this.context);
    } else {
      BaseService.alert.error(context!, 'no more characters');
    }
  }

  @override
  Widget build(BuildContext context) {
    print("characters?.length ??0");
    print(characters?.length ?? 0);
    print("paginacao");
    print(paginacao);

    super.build(context);
    return NotificationListener<ScrollEndNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification.metrics.pixels ==
            notification.metrics.maxScrollExtent) {
          ++paginacao;
          _loadCharacters(paginacao);
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title:  textAppBar('Rick and Morty'),
          centerTitle: true,
        ),
        body: Padding(
            padding: EdgeInsets.all(8),
            child: ListCharactersWidget(characters: characters)),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
