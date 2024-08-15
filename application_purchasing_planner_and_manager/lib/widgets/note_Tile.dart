// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:application_purchasing_planner_and_manager/backend/models.dart';
import 'package:application_purchasing_planner_and_manager/styles/colors.dart';
import 'package:application_purchasing_planner_and_manager/styles/textStyles.dart';
import 'package:application_purchasing_planner_and_manager/pages/detallesNotas.dart';

enum TileType {
  Square,
  VerRect,
  HorRect,
}

class NoteTile extends StatelessWidget {
  final Note note;
  final TileType tileType;
  final int index;
  const NoteTile({
    super.key,
    required this.note,
    required this.tileType,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => NoteDetailPage(note: note),
          transition: Transition.leftToRight,
        );
      },
      child: Container(
        // margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: tileColors[index % 7],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: tileType == TileType.HorRect
                  ? const EdgeInsets.only(right: 100)
                  : null,
              child: Text(
                note.titulo,
                maxLines: _getMaxLines(tileType),
                style: noteTitleTextStyle.copyWith(
                  fontSize: _getTxtSize(tileType),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(note.fecha,
                    style: dateTextStyle.copyWith(
                        color: Colors.black.withOpacity(0.7))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _getTxtSize(TileType tileType) {
    switch (tileType) {
      case TileType.Square:
        return 21.0;
      case TileType.VerRect:
        return 24.0;
      case TileType.HorRect:
        return 29.0;
    }
  }

  _getMaxLines(TileType tileType) {
    switch (tileType) {
      case TileType.Square:
        return 4;
      case TileType.VerRect:
        return 8;
      case TileType.HorRect:
        return 3;
    }
  }
}
