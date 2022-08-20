// import 'package:desafio_rick_and_morty/models/character_model.dart';
// import 'package:flutter/material.dart';
//
// class CustomAppWidget extends StatefulWidget {
//   const CustomAppWidget({Key? key}) : super(key: key);
//
//   @override
//   State<CustomAppWidget> createState() => _CustomAppWidgetState();
// }
//
// class _CustomAppWidgetState extends State<CustomAppWidget> {
//
//   Widget _appBarFiltro() {
//     List<CharacterModel> produtosFiltrados = List.from(characters);
//
//     return AppBar(
//       title: filtro
//           ? TextField(
//         cursorColor: Colors.white,
//         keyboardType: TextInputType.text,
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: SizeConfig.safeBlockHorizontal * 4,
//         ),
//         controller: _filtroController,
//         decoration: InputDecoration(
//           hintText: 'CodOrigem',
//           fillColor: Colors.amber.shade400,
//           filled: true,
//           hintStyle:
//           TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 4),
//           labelStyle:
//           TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 4),
//         ),
//         onChanged: onItemChanged,
//       )
//           : Text(
//         'Conferência de transporte',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: SizeConfig.safeBlockHorizontal * 5.5,
//         ),
//       ),
//       actions: [
//         IconButton(
//           icon: Icon(filtro ? Icons.done : Icons.search),
//           onPressed: () {
//             setState(
//                   () {
//                 filtro = !filtro;
//               },
//             );
//           },
//         ),
//       ],
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
