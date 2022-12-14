import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_rick_and_morty/models/character_model.dart';
import 'package:desafio_rick_and_morty/shared/image/image-widget/image-widget.dart';
import 'package:desafio_rick_and_morty/shared/placeHolder/place-holder-image.dart';
import 'package:desafio_rick_and_morty/shared/size-config/size-config.dart';
import 'package:desafio_rick_and_morty/shared/style/style_text.dart';
import 'package:desafio_rick_and_morty/views/details/details_view/details_character_view.dart';
import 'package:flutter/material.dart';

class ListCharactersWidget extends StatelessWidget {
  const ListCharactersWidget(
      {Key? key, this.characters, this.searchCharacterFilter})
      : super(key: key);

  final List<CharacterModel>? characters;
  final String? searchCharacterFilter;

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
          return characters![index]
                      .name!
                      .toLowerCase()
                      .contains(searchCharacterFilter!) ||
                  characters![index]
                      .status!
                      .toLowerCase()
                      .contains(searchCharacterFilter!)
              ? Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      TextEditingController().clear();
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, a, b) => DetailsCharacterView(
                            character: characters![index],
                          ),
                        ),
                      );
                    },
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
                      margin:
                          const EdgeInsets.only(right: 10, left: 1, bottom: 1),
                      width: SizeConfig.blockSizeHorizontal! * 70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(
                            child: Stack(
                              children: [
                                ImageWidget(
                                    image: characters?[index]?.image ??
                                        loadImagePlaceHolder)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 18,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  textNameCharacter(
                                    characters?[index].name ?? "",
                                  ),
                                  Expanded(
                                    child: textInfoCharacter(
                                      'Status: ${characters?[index].status ?? ""} -  Gender: ${characters?[index].gender ?? ""} ',
                                    ),
                                  ),
                                  Row(
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
                                      Expanded(
                                        child: textLocationCharacter(
                                          characters?[index].location?.name ??
                                              "",
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : const SizedBox();
        },
      ),
    );
  }
}
