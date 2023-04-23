import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/models/announcement_model.dart';
import 'dialog_play_widget.dart';

class ConnectButton extends StatelessWidget {
  const ConnectButton({
    super.key,
    required this.listAnnouncement,
    required this.index,
  });
  final int index;
  final List<AnnouncementModel> listAnnouncement;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return DialogPlay(
                listAnnouncement: listAnnouncement,
                index: index,
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          backgroundColor: AppColors.primaryPurple,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.videogame_asset),
            SizedBox(width: 5),
            Text("Connect"),
          ],
        ),
      ),
    );
  }
}
