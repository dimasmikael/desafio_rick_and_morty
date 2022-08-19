import 'package:desafio_rick_and_morty/shared/size-config/size-config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



Widget textAppBar(String texto) {
  return Align(
    alignment: Alignment.center,
    child: Text(
      texto,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: SizeConfig.safeBlockHorizontal! * 6,
      ),
    ),
  );
}

Widget textNameCharacter(String texto) {
  return Padding(
    padding: const EdgeInsets.only(left: 1, top: 1, bottom: 1),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        texto,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.inter(
          fontSize: SizeConfig.safeBlockHorizontal! * 6,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget textLocationCharacter(String texto) {
  return Padding(
    padding: const EdgeInsets.only(left: 1, top: 1, bottom: 5),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        texto,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.inter(
          fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
        ),
      ),
    ),
  );
}
Widget textInfoCharacter(String texto) {
  return Padding(
    padding: const EdgeInsets.only(left: 1, top: 1, bottom: 5),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        texto,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.inter(
          fontSize: SizeConfig.safeBlockHorizontal! * 3.8,
        ),
      ),
    ),
  );
}
