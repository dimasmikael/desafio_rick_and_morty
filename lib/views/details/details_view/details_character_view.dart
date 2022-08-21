import 'package:desafio_rick_and_morty/models/character_model.dart';
import 'package:desafio_rick_and_morty/shared/appbar/custom-appbar-widget.dart';
import 'package:desafio_rick_and_morty/shared/card/custom-card/custom-card-widget.dart';
import 'package:desafio_rick_and_morty/shared/image/image-widget/image-widget.dart';
import 'package:desafio_rick_and_morty/shared/placeHolder/place-holder-image.dart';
import 'package:desafio_rick_and_morty/shared/size-config/size-config.dart';
import 'package:desafio_rick_and_morty/shared/style/style_text.dart';
import 'package:flutter/material.dart';

class DetailsCharacterView extends StatelessWidget {
  const DetailsCharacterView({
    Key? key,
    this.character,
  }) : super(key: key);
  final CharacterModel? character;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: const CustomAppBarWidget(texto: 'Details - Characters'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: SizeConfig.safeBlockVertical! * 65,
                child: ImageWidget(
                    image: character?.image ?? loadImagePlaceHolder)),
            CustomCardWidget(
              title: 'Character',
              widgets: Column(children: [
                textInfoCharacterDetails('Name: ${character?.name ?? ''}'),
                textInfoCharacterDetails('Gender: ${character?.gender ?? ''}'),
                textInfoCharacterDetails('Status: ${character?.status ?? ''}'),
              ]),
            ),
            CustomCardWidget(
              title: 'Location',
              widgets: Column(
                children: [
                  textInfoCharacterDetails(
                      'Name: ${character?.location?.name ?? ''}'),
                  textInfoCharacterDetails(
                      'Dimension: ${character?.location?.dimension ?? ''}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
