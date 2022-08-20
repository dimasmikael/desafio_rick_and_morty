// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:sua_musica_desafio_games/components/size-config/size-config.dart';
// import 'package:sua_musica_desafio_games/model/game_models.dart';
// import 'package:sua_musica_desafio_games/shared/image-placeholder/image-placeholder-widget.dart';
//
// class ImagemDetailsWidget extends StatefulWidget {
//   const ImagemDetailsWidget(this.game, {Key? key}) : super(key: key);
//   final GameModel? game;
//   @override
//   State<ImagemDetailsWidget> createState() => _ImagemDetailsWidgetState();
// }
//
// class _ImagemDetailsWidgetState extends State<ImagemDetailsWidget> {
//   int _current = 0;
//
//   Widget _carrouselImagens() {
//     return Column(
//       children: [
//         Expanded(
//           flex: 3,
//           child: CarouselSlider(
//               options: CarouselOptions(
//                 enableInfiniteScroll: false,
//                 viewportFraction: 1,
//                 autoPlay: true,
//                 onPageChanged: (int index, _) {
//                   setState(
//                     () {
//                       _current = index;
//                     },
//                   );
//                 },
//               ),
//               items: [
//                 for (var img in widget.game!.screenshots!)
//                   Builder(
//                     builder: (BuildContext context) {
//                       return Stack(
//                         alignment: const Alignment(0, 0),
//                         children: <Widget>[
//                           const Center(
//                             child:
//                                 const SpinKitFadingCircle(color: Colors.amber),
//                           ),
//                           Center(
//                             child: Container(
//                               decoration: const BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.only(
//                                   topRight: (Radius.circular(10)),
//                                   topLeft: (Radius.circular(10)),
//                                 ),
//                                 boxShadow: [
//                                   BoxShadow(
//                                       color: Colors.black12, blurRadius: 5)
//                                 ],
//                               ),
//                               child: ClipRRect(
//                                 borderRadius: const BorderRadius.only(
//                                   topRight: (Radius.circular(10)),
//                                   topLeft: (Radius.circular(10)),
//                                 ),
//                                 child: CachedNetworkImage(
//                                   imageUrl: img.imageId == null
//                                       ? imagePlaceHolder
//                                       : "https://images.igdb.com/igdb/image/upload/t_screenshot_huge/${img.imageId}.jpg",
//                                   placeholder: (context, url) =>
//                                       const SpinKitFadingCircle(
//                                           color: Colors.amber),
//                                   errorWidget: (context, url, error) =>
//                                       const Icon(Icons.error),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       );
//                     },
//                   )
//               ]),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: widget.game!.screenshots!.map(
//             (image) {
//               int? index = widget.game!.screenshots!.indexOf(image);
//               return Expanded(
//                 child: Container(
//                   width: 8.0,
//                   height: 8.0,
//                   margin: const EdgeInsets.symmetric(
//                       vertical: 10.0, horizontal: 2.0),
//                   decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: _current == index
//                           ? const Color.fromRGBO(0, 0, 0, 0.9)
//                           : Colors.amber),
//                 ),
//               );
//             },
//           ).toList(),
//         ),
//       ],
//     );
//   }
//
//   Widget _containerFotos() {
//     double alturaContainer = SizeConfig.screenHeight!;
//     double larguraContainer = SizeConfig.screenWidth!;
//
//     return Builder(
//       builder: (context) {
//         if (widget.game?.screenshots == null) {
//           return SizedBox(
//             height: alturaContainer * .40,
//             width: larguraContainer,
//             child: Image.network(
//               imagePlaceHolder,
//               fit: BoxFit.cover,
//             ),
//           );
//         } else {
//           return SizedBox(
//             height: alturaContainer * .40,
//             width: larguraContainer,
//             child: _carrouselImagens(),
//           );
//         }
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return _containerFotos();
//   }
// }
