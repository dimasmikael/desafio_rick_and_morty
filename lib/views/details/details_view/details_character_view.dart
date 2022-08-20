import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_rick_and_morty/models/character_model.dart';
import 'package:desafio_rick_and_morty/shared/card/custom-card/custom-card-widget.dart';
import 'package:desafio_rick_and_morty/shared/placeHolder/place-holder-image.dart';
import 'package:desafio_rick_and_morty/shared/size-config/size-config.dart';
import 'package:desafio_rick_and_morty/shared/style/style_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: SizeConfig.safeBlockVertical! * 65,
              child: Hero(
                tag: character?.image ?? loadImagePlaceHolder,
                child: CachedNetworkImage(
                  imageUrl: character?.image ?? loadImagePlaceHolder,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.contain),
                    ),
                  ),
                  placeholder: (context, i) =>
                      const SpinKitFadingCircle(color: Colors.amber),
                  errorWidget: (context, i, error) =>
                      Image.network(loadImagePlaceHolder),
                ),
              ),
            ),
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
