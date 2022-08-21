import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_rick_and_morty/models/character_model.dart';
import 'package:desafio_rick_and_morty/shared/placeHolder/place-holder-image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key,required this.image}) : super(key: key);
final String image;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: image,
      child: CachedNetworkImage(
        imageUrl: image,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
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
    );
  }
}
