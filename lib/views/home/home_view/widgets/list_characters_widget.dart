import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_rick_and_morty/models/character_model.dart';
import 'package:desafio_rick_and_morty/shared/placeHolder/placeHolderImage.dart';
import 'package:desafio_rick_and_morty/shared/size-config/size-config.dart';
import 'package:desafio_rick_and_morty/shared/style/style_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ListCharactersWidget extends StatelessWidget {
  const ListCharactersWidget({Key? key, this.characters}) : super(key: key);

  final List<CharacterModel>? characters;

  List<Widget> _listCharacters() {
    return characters!.map(
      (CharacterModel character) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
              ),
              margin: const EdgeInsets.only(right: 10, left: 10, bottom: 16),
              width: SizeConfig.blockSizeHorizontal! * 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Stack(
                      children: [
                        Hero(
                          tag: character.image ?? loadImagePlaceHolder,
                          child: CachedNetworkImage(
                            imageUrl: character.image ?? loadImagePlaceHolder,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                            ),
                            placeholder: (context, i) =>
                                const SpinKitFadingCircle(color: Colors.amber),
                            errorWidget: (context, i, error) =>
                                Image.network(loadImagePlaceHolder),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textNameCharacter(
                          character?.name ?? "",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.blockSizeVertical! * 100,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(5),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: _listCharacters(),
      ),
    );
  }
}
