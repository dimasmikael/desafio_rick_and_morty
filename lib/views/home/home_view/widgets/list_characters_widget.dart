import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_rick_and_morty/models/character_model.dart';
import 'package:desafio_rick_and_morty/shared/placeHolder/place-holder-image.dart';
import 'package:desafio_rick_and_morty/shared/size-config/size-config.dart';
import 'package:desafio_rick_and_morty/shared/style/style_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ListCharactersWidget extends StatelessWidget {
  const ListCharactersWidget({Key? key, this.characters, this.searchString})
      : super(key: key);

  final List<CharacterModel>? characters;
  final String? searchString;

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
                          character.name ?? "",
                        ),
                        textInfoCharacter(
                          'Status: ${character.status ?? ""} -  Gender: ${character.gender ?? ""} ',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  character.location?.name == null ||
                          character.location?.name == ""
                      ? SizedBox(
                          height: SizeConfig.safeBlockVertical! * 2.5,
                        )
                      : Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 1, top: 1, bottom: 5),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  Icons.location_on,
                                  color: Colors.grey[600],
                                  size: SizeConfig.safeBlockVertical! * 2.8,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            textLocationCharacter(
                              character.location?.name ?? "",
                            ),
                          ],
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
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(8),
          itemCount: characters!.length,
          itemBuilder: (BuildContext context, int index) {
            return characters![index]!
                    .name!
                    .toLowerCase()
                    .contains(searchString!) || characters![index]!
                .status!
                .toLowerCase()
                .contains(searchString!)
                ? Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: SizeConfig.blockSizeVertical! * 100,
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
                        margin: const EdgeInsets.only(
                            right: 10, left: 10, bottom: 16),
                        width: SizeConfig.blockSizeHorizontal! * 70,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                              child: Stack(
                                children: [
                                  Hero(
                                    tag: characters?[index].image ??
                                        loadImagePlaceHolder,
                                    child: CachedNetworkImage(
                                      imageUrl: characters?[index].image ??
                                          loadImagePlaceHolder,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      placeholder: (context, i) =>
                                          const SpinKitFadingCircle(
                                              color: Colors.amber),
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
                                    characters?[index].name ?? "",
                                  ),
                                  textInfoCharacter(
                                    'Status: ${characters?[index].status ?? ""} -  Gender: ${characters?[index].gender ?? ""} ',
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            characters?[index].location?.name == null ||
                                    characters?[index].location?.name == ""
                                ? SizedBox(
                                    height: SizeConfig.safeBlockVertical! * 2.5,
                                  )
                                : Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 1, top: 1, bottom: 5),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Icon(
                                            Icons.location_on,
                                            color: Colors.grey[600],
                                            size:
                                                SizeConfig.safeBlockVertical! *
                                                    2.8,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      textLocationCharacter(
                                        characters?[index].location?.name ?? "",
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Container();
          }),
    );
  }
}
