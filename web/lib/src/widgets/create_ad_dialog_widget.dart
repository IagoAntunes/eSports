import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';
import 'package:web/core/colors/app_colors.dart';
import 'package:web/core/typography/typography_font.dart';

import '../models/announcement_model.dart';

class CreateAdDialogWidget extends StatefulWidget {
  const CreateAdDialogWidget({
    Key? key,
    required this.size,
    required this.listItems,
  }) : super(key: key);

  final Size size;
  final List<DropdownMenuItem<String>> listItems;

  @override
  State<CreateAdDialogWidget> createState() => _CreateAdDialogWidgetState();
}

class _CreateAdDialogWidgetState extends State<CreateAdDialogWidget> {
  final TextEditingController nickcontroller = TextEditingController();
  final TextEditingController yearsplaycontroller = TextEditingController();
  final TextEditingController discordcontroller = TextEditingController();

  int? hourDay;
  int? minutesDay;
  bool isChecked = false;
  List<int> daysSelected = [];
  String currentValue = "League of Legends";

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.transparent,
      content: Container(
        padding: const EdgeInsets.all(30),
        width: widget.size.width * 0.4,
        height: widget.size.height * 0.7,
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
                value: currentValue,
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
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      currentValue = value;
                    });
                  }
                },
                items: widget.listItems,
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
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (daysSelected.contains(0)) {
                                  daysSelected.remove(0);
                                } else {
                                  daysSelected.add(0);
                                }
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(
                                8,
                              ),
                              decoration: BoxDecoration(
                                color: daysSelected
                                        .where((element) => element == 0)
                                        .isEmpty
                                    ? AppColors.greyDark
                                    : AppColors.purple,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    6,
                                  ),
                                ),
                              ),
                              child: Text(
                                "T",
                                style: GoogleFonts.inter(
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (daysSelected.contains(1)) {
                                  daysSelected.remove(1);
                                } else {
                                  daysSelected.add(1);
                                }
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(
                                8,
                              ),
                              decoration: BoxDecoration(
                                color: daysSelected
                                        .where((element) => element == 1)
                                        .isEmpty
                                    ? AppColors.greyDark
                                    : AppColors.purple,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    6,
                                  ),
                                ),
                              ),
                              child: Text(
                                "T",
                                style: GoogleFonts.inter(
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (daysSelected.contains(2)) {
                                  daysSelected.remove(2);
                                } else {
                                  daysSelected.add(2);
                                }
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(
                                8,
                              ),
                              decoration: BoxDecoration(
                                color: daysSelected
                                        .where((element) => element == 2)
                                        .isEmpty
                                    ? AppColors.greyDark
                                    : AppColors.purple,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    6,
                                  ),
                                ),
                              ),
                              child: Text(
                                "T",
                                style: GoogleFonts.inter(
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (daysSelected.contains(3)) {
                                  daysSelected.remove(3);
                                } else {
                                  daysSelected.add(3);
                                }
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(
                                8,
                              ),
                              decoration: BoxDecoration(
                                color: daysSelected
                                        .where((element) => element == 3)
                                        .isEmpty
                                    ? AppColors.greyDark
                                    : AppColors.purple,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    6,
                                  ),
                                ),
                              ),
                              child: Text(
                                "T",
                                style: GoogleFonts.inter(
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (daysSelected.contains(4)) {
                                  daysSelected.remove(4);
                                } else {
                                  daysSelected.add(4);
                                }
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(
                                8,
                              ),
                              decoration: BoxDecoration(
                                color: daysSelected
                                        .where((element) => element == 4)
                                        .isEmpty
                                    ? AppColors.greyDark
                                    : AppColors.purple,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    6,
                                  ),
                                ),
                              ),
                              child: Text(
                                "T",
                                style: GoogleFonts.inter(
                                  color: AppColors.white,
                                ),
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
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                TimeOfDay? pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime:
                                      const TimeOfDay(hour: 7, minute: 0),
                                );
                                if (pickedTime != null) {
                                  setState(() {
                                    hourDay = pickedTime.hour;
                                  });
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: AppColors.greyDark,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: AppColors.greyDark,
                                  ),
                                ),
                                child: Text(
                                  hourDay == null ? "De" : hourDay!.toString(),
                                  style: GoogleFonts.inter(
                                    color: AppColors.greyText,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                TimeOfDay? pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime:
                                      const TimeOfDay(hour: 7, minute: 0),
                                );
                                if (pickedTime != null) {
                                  setState(() {
                                    minutesDay = pickedTime.minute;
                                  });
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: AppColors.greyDark,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: AppColors.greyDark,
                                  ),
                                ),
                                child: Text(
                                  minutesDay == null
                                      ? "Ate"
                                      : minutesDay.toString(),
                                  style: GoogleFonts.inter(
                                    color: AppColors.greyText,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  activeColor: AppColors.greyDark,
                  checkColor: AppColors.green,
                  onChanged: (value) {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
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
                  onPressed: () async {
                    AnnouncementModel announcement = AnnouncementModel(
                      id: Uuid().v1(),
                      nameGame: widget.listItems
                          .where((element) => element.value == currentValue)
                          .first
                          .value
                          .toString(),
                      nickname: nickcontroller.text,
                      yearsPlayed: yearsplaycontroller.text,
                      idDiscord: discordcontroller.text,
                      daysPlayed: daysSelected,
                      hourDay: TimeOfDay(hour: hourDay!, minute: minutesDay!),
                      hasVoiceChat: isChecked,
                    );

                    await firestore
                        .collection('announcements')
                        .doc(announcement.id)
                        .set(announcement.toJson());

                    Navigator.pop(context);
                  },
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
