import 'package:desafio_rick_and_morty/controllers/character_controller.dart';
import 'package:desafio_rick_and_morty/models/character_model.dart';
import 'package:desafio_rick_and_morty/shared/appbar/custom-appbar-widget.dart';
import 'package:desafio_rick_and_morty/shared/base-service/base.service.dart';
import 'package:desafio_rick_and_morty/shared/size-config/size-config.dart';
import 'package:desafio_rick_and_morty/views/home/home_view/widgets/list_characters_widget.dart';
import 'package:flutter/foundation.dart';
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

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _loadCharacters(pagination),
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _loadCharacters(pagination) async {
    BaseService.loading.startLoading(context);
    try {
      if (pagination != null) {
        List<CharacterModel>? loadCharacters =
            await _characterController.getCharacters(pagination);
        List<CharacterModel> newList = [...?characters, ...loadCharacters];

        setState(
          () {
            characters = newList;
          },
        );
        if (mounted) {
          if (loadCharacters.isEmpty) {
            BaseService.loading.stopLoading(context);

            BaseService.alert.errorSnackBar(
              context,
              'no more characters',
            );
          }
        }
        if (mounted) {
          BaseService.loading.stopLoading(context);
        }
      }
    } catch (error) {
      BaseService.loading.stopLoading(context);
      if (kDebugMode) {
        print(error);
      }
      BaseService.alert.errorSnackBar(
        context,
        'Data not found.',
      );
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
          FocusScope.of(context).unfocus();
        }
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const CustomAppBarWidget(texto: 'Rick and Morty'),
        body: SizedBox(
          height: SizeConfig.blockSizeVertical! * 85,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextField(
                  textInputAction: TextInputAction.next,
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
                      searchCharacterFilter: searchCharacterFilter),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
