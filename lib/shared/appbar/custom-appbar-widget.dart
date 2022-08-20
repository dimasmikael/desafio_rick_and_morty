import 'package:desafio_rick_and_morty/shared/size-config/size-config.dart';
import 'package:desafio_rick_and_morty/shared/style/style_text.dart';
import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatefulWidget with PreferredSizeWidget {
  const CustomAppBarWidget({Key? key, required this.texto}) : super(key: key);
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  final String? texto;

  @override
  State<CustomAppBarWidget> createState() => _CustomAppBarWidgetState();
}

class _CustomAppBarWidgetState extends State<CustomAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(
          SizeConfig.blockSizeVertical! * 12,
        ),
        child: AppBar(
          centerTitle: true,
          elevation: 2,
          iconTheme: IconThemeData(size: SizeConfig.safeBlockHorizontal! * 6),
          title: textAppBar(widget!.texto!),
        ));
  }
}
