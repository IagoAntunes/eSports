import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      backgroundColor: Colors.transparent,
      content: Container(
        padding: const EdgeInsets.all(30),
        width: size.width * 0.4,
        height: size.height * 0.7,
        decoration: const BoxDecoration(
          color: Color(0xff2A2634),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Publique seu anuncio",
              style: GoogleFonts.inter(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Qual o game?',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: const Color(0xff18181B),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: const Color(0xff18181B),
                ),
              ),
              child: DropdownButton<String>(
                dropdownColor: const Color(0xff18181B),
                isExpanded: true,
                underline: Container(),
                value: '1',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: const Color(0xff71717A),
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
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: const Color(0xff18181B),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: const Color(0xff18181B),
                ),
              ),
              child: TextField(
                controller: nickcontroller,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Como te chamam dentro do game',
                  hintStyle: GoogleFonts.inter(
                    color: const Color(0xff71717A),
                    fontSize: 12,
                  ),
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
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: const Color(0xff18181B),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: const Color(0xff18181B),
                          ),
                        ),
                        child: TextField(
                          controller: yearsplaycontroller,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Tudo bem ser ZERO',
                            hintStyle: GoogleFonts.inter(
                              color: const Color(0xff71717A),
                              fontSize: 12,
                            ),
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
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: const Color(0xff18181B),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: const Color(0xff18181B),
                          ),
                        ),
                        child: TextField(
                          controller: discordcontroller,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Usuario#0000',
                            hintStyle: GoogleFonts.inter(
                              color: const Color(0xff71717A),
                              fontSize: 12,
                            ),
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
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
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
                              color: Color(
                                0xff18181B,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  6,
                                ),
                              ),
                            ),
                            child: Text(
                              "S",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(
                              8,
                            ),
                            decoration: const BoxDecoration(
                              color: Color(
                                0xff18181B,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  6,
                                ),
                              ),
                            ),
                            child: Text(
                              "S",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(
                              8,
                            ),
                            decoration: const BoxDecoration(
                              color: Color(
                                0xff18181B,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  6,
                                ),
                              ),
                            ),
                            child: Text(
                              "S",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(
                              8,
                            ),
                            decoration: const BoxDecoration(
                              color: Color(
                                0xff18181B,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  6,
                                ),
                              ),
                            ),
                            child: Text(
                              "S",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(
                              8,
                            ),
                            decoration: const BoxDecoration(
                              color: Color(
                                0xff18181B,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  6,
                                ),
                              ),
                            ),
                            child: Text(
                              "S",
                              style: GoogleFonts.inter(
                                color: Colors.white,
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
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xff18181B),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: const Color(
                              0xff18181B,
                            ),
                          ),
                        ),
                        child: TextField(
                          controller: discordcontroller,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Usuario#0000',
                            hintStyle: GoogleFonts.inter(
                              color: const Color(0xff71717A),
                              fontSize: 12,
                            ),
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
                  activeColor: const Color(0xff18181B),
                  checkColor: Colors.green,
                  onChanged: (value) {},
                ),
                const SizedBox(width: 10),
                Text(
                  "Costumo me conectar ao chat de voz",
                  style: GoogleFonts.inter(
                    color: Colors.white,
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
                    backgroundColor: const Color(0xff71717A),
                    padding: const EdgeInsets.all(20),
                  ),
                  child: Text(
                    "Cancelar",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff8B5CF6),
                    padding: const EdgeInsets.all(17),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.games_outlined,
                        color: Colors.white,
                      ),
                      Text(
                        "Encontrar Duo",
                        style: GoogleFonts.inter(
                          color: Colors.white,
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
