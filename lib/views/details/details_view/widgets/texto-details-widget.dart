// import 'package:flutter/material.dart';
// import 'package:sua_musica_desafio_games/model/game_models.dart';
// import 'package:sua_musica_desafio_games/shared/formatacao-texto/formatacao_Texto.dart';
//
// class TextoDetailsWidget extends StatelessWidget {
//   const TextoDetailsWidget(this.game, {Key? key}) : super(key: key);
//   final GameModel? game;
//
//   @override
//   Widget build(BuildContext context) {
//     String? genre = game?.genres?.map((item) => item.name).toList().join(",");
//     String? platform =
//         game?.platforms?.map((item) => item.name).toList().join(",");
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         textoNomeJogoDetails(game?.name ?? 'no data'),
//         textoNomeJogoDetailsDescricao('Genre: ${genre ??'no data'}'),
//         textoNomeJogoDetailsDescricao('Platforms: ${platform??'no data'}'),
//         const Divider(
//           thickness: 3,
//         ),
//         textoNomeJogoDetailsDescricao(game?.summary ?? 'no data'),
//       ],
//     );
//   }
// }
