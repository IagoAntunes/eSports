import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web/core/colors/app_colors.dart';
import 'package:web/core/typography/typography_font.dart';

class CreateAdDialogWidget extends StatelessWidget {
  const CreateAdDialogWidget({
    Key? key,
    required this.size,
    required this.listItems,
    required this.nickcontroller,
    required this.yearsplaycontroller,
    required this.discordcontroller,
  }) : super(key: key);

  final Size size;
  final List<DropdownMenuItem<String>> listItems;
  final TextEditingController nickcontroller;
  final TextEditingController yearsplaycontroller;
  final TextEditingController discordcontroller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.transparent,
      content: Container(
        padding: const EdgeInsets.all(30),
        width: size.width * 0.4,
        height: size.height * 0.7,
        decoration: const BoxDecoration(
          color: AppColors.greyMed,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Publique seu anuncio",
              style: AppTypography.mediumText(),
            ),
            const SizedBox(height: 30),
            Text(
              'Qual o game?',
              style: AppTypography.mediumText(),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: AppColors.greyDark,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: AppColors.greyDark,
                ),
              ),
              child: DropdownButton<String>(
                dropdownColor: AppColors.greyDark,
                isExpanded: true,
                underline: Container(),
                value: '1',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: AppColors.greyText2,
                ),
                icon: Transform.scale(
                    scale: 1.5,
                    child: const Icon(Icons.arrow_drop_down_rounded)),
                hint: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Selecione uma área',
                  ),
                ),
                elevation: 16,
                onChanged: (value) {},
                items: listItems,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Seu nome (ou nickname)',
              style: AppTypography.mediumText(),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: AppColors.greyDark,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: AppColors.greyDark,
                ),
              ),
              child: TextField(
                controller: nickcontroller,
                style: GoogleFonts.inter(
                  color: AppColors.white,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Como te chamam dentro do game',
                  hintStyle: AppTypography.textFieldStyle(),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Joga a quantos anos',
                        style: AppTypography.mediumText(),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: AppColors.greyDark,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: AppColors.greyDark,
                          ),
                        ),
                        child: TextField(
                          controller: yearsplaycontroller,
                          style: GoogleFonts.inter(
                            color: AppColors.white,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Tudo bem ser ZERO',
                            hintStyle: AppTypography.textFieldStyle(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Qual seu Discord?',
                        style: AppTypography.mediumText(),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: AppColors.greyDark,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: AppColors.greyDark,
                          ),
                        ),
                        child: TextField(
                          controller: discordcontroller,
                          style: GoogleFonts.inter(
                            color: AppColors.white,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Usuario#0000',
                            hintStyle: AppTypography.textFieldStyle(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Quando costuma jogar',
                        style: AppTypography.mediumText(),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(
                              8,
                            ),
                            decoration: const BoxDecoration(
                              color: AppColors.greyDark,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  6,
                                ),
                              ),
                            ),
                            child: Text(
                              "S",
                              style: GoogleFonts.inter(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(
                              8,
                            ),
                            decoration: const BoxDecoration(
                              color: AppColors.greyDark,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  6,
                                ),
                              ),
                            ),
                            child: Text(
                              "S",
                              style: GoogleFonts.inter(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(
                              8,
                            ),
                            decoration: const BoxDecoration(
                              color: AppColors.greyDark,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  6,
                                ),
                              ),
                            ),
                            child: Text(
                              "S",
                              style: GoogleFonts.inter(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(
                              8,
                            ),
                            decoration: const BoxDecoration(
                              color: AppColors.greyDark,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  6,
                                ),
                              ),
                            ),
                            child: Text(
                              "S",
                              style: GoogleFonts.inter(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(
                              8,
                            ),
                            decoration: const BoxDecoration(
                              color: AppColors.greyDark,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  6,
                                ),
                              ),
                            ),
                            child: Text(
                              "S",
                              style: GoogleFonts.inter(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Qual horario do dia?',
                        style: AppTypography.mediumText(),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.greyDark,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: AppColors.greyDark,
                          ),
                        ),
                        child: TextField(
                          controller: discordcontroller,
                          style: GoogleFonts.inter(
                            color: AppColors.white,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Usuario#0000',
                            hintStyle: AppTypography.textFieldStyle(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: true,
                  activeColor: AppColors.greyDark,
                  checkColor: AppColors.green,
                  onChanged: (value) {},
                ),
                const SizedBox(width: 10),
                Text(
                  "Costumo me conectar ao chat de voz",
                  style: GoogleFonts.inter(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.greyText2,
                    padding: const EdgeInsets.all(20),
                  ),
                  child: Text(
                    "Cancelar",
                    style: GoogleFonts.inter(
                      color: AppColors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.purple,
                    padding: const EdgeInsets.all(17),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.games_outlined,
                        color: AppColors.white,
                      ),
                      Text(
                        "Encontrar Duo",
                        style: GoogleFonts.inter(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
