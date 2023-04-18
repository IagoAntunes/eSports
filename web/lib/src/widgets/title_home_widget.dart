import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/widgets/gradient_text.dart';

class TitleHomeWidget extends StatelessWidget {
  const TitleHomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Seu",
          style: GoogleFonts.inter(
            fontSize: 64,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        GradientText(
          ' duo ',
          style: GoogleFonts.inter(
            fontSize: 64,
            fontWeight: FontWeight.bold,
          ),
          gradient: const LinearGradient(colors: [
            Color(0XFF9572FC),
            Color(0xff43E7AD),
            Color(0xffE1D55D),
          ]),
        ),
        Text(
          "está aqui",
          style: GoogleFonts.inter(
            fontSize: 64,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
