import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web/core/colors/app_colors.dart';

import 'create_ad_dialog_widget.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({
    Key? key,
    required this.size,
    required this.listItems,
  }) : super(key: key);

  final Size size;
  final List<DropdownMenuItem<String>> listItems;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 10,
          width: size.width / 1.5,
          decoration: const BoxDecoration(
            color: AppColors.red,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
            gradient: LinearGradient(
              colors: [
                AppColors.purpleGradient1,
                AppColors.greenGradient1,
                AppColors.yellowGradient1,
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Container(
            padding: const EdgeInsets.all(25),
            width: size.width / 1.5,
            decoration: const BoxDecoration(
              color: AppColors.greyMed,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: 1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(14),
                      backgroundColor: AppColors.purple,
                    ),
                    onPressed: () {
                      TextEditingController nickcontroller =
                          TextEditingController();
                      TextEditingController yearsplaycontroller =
                          TextEditingController();
                      TextEditingController discordcontroller =
                          TextEditingController();
                      showDialog(
                        context: context,
                        builder: (context) => CreateAdDialogWidget(
                          size: size,
                          listItems: listItems,
                          nickcontroller: nickcontroller,
                          yearsplaycontroller: yearsplaycontroller,
                          discordcontroller: discordcontroller,
                        ),
                      );
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.search),
                        Text("Publicar anúncio"),
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Não encontrou seu duo ?",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Publique um anúncio para encontrar novos players!",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: AppColors.greyText,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
