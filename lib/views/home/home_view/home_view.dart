import 'package:desafio_rick_and_morty/controllers/character_controller.dart';
import 'package:desafio_rick_and_morty/models/character_model.dart';
import 'package:desafio_rick_and_morty/shared/appbar/custom-appbar-widget.dart';
import 'package:desafio_rick_and_morty/shared/base-service/base.service.dart';
import 'package:desafio_rick_and_morty/shared/size-config/size-config.dart';

import 'package:desafio_rick_and_morty/views/home/home_view/widgets/list_characters_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin<HomeView> {
  final CharacterController _characterController = CharacterController();
  late int pagination = 1;
  List<CharacterModel>? characters = [];
  String searchCharacterFilter = "";
  final focusNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _loadCharacters(pagination),
    );
    super.initState();
  }

  Future<void> _loadCharacters(pagination) async {
    try {
      print(1);
      if (pagination != null) {
        BaseService.loading.startLoading(context);
        print(2);
        List<CharacterModel>? loadCharacters =
            await _characterController?.getCharacters(pagination);
        List<CharacterModel> newList = [...?characters, ...?loadCharacters];
        print(3);
        setState(
          () {
            characters = newList;
          },
        );

        if(loadCharacters!.isEmpty){
          BaseService.loading.stopLoading(context);
          BaseService.alert.error(context!, 'no more characters');

          print("nonono");
        }
        print("loadCharacters");  print(loadCharacters!.length); print("characters ");  print(characters!.length );
        print(4);
        BaseService.loading.stopLoading(context);
        print(5);
      } else {
        print(6);
        BaseService.alert.error(context!, 'no more characters');
        BaseService.loading.stopLoading(context);
        print(7);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    super.build(context);
    return NotificationListener<ScrollEndNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification.metrics.pixels ==
            notification.metrics.maxScrollExtent) {
          ++pagination;
          _loadCharacters(pagination);
        }
        return true;
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: const CustomAppBarWidget(texto: 'Rick and Morty'),
          body:SizedBox(height:  SizeConfig.blockSizeVertical! * 85,child:
          Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextField(
                    focusNode: focusNode,
                    onChanged: (value) {
                      setState(
                        () {
                          searchCharacterFilter = value.toLowerCase();
                        },
                      );
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'Search',
                      hintText: 'Search',
                      suffixIcon: const Icon(Icons.search),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: ListCharactersWidget(
                          characters: characters,
                          searchCharacterFilter: searchCharacterFilter)),
                ),
              ])),),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
