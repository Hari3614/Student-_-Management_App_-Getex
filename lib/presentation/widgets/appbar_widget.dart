import 'package:flutter/material.dart';
import 'package:getex/core/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    this.lefticon,
    this.righticon,
    required this.title,
    this.onTapLeft,
    this.onTapright,
  });
  final IconData? lefticon;
  final IconData? righticon;
  final String title;
  final void Function()? onTapLeft;
  final void Function()? onTapright;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: GoogleFonts.oswald(
          color: appBarClrBlk,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        InkWell(
          onTap: onTapright,
          child: Icon(
            righticon,
            color: appBarClrBlk,
            size: 30,
          ),
        )
      ],
      centerTitle: true,
      backgroundColor: appBarClrWhite,
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    );
  }
}
