import 'package:application_purchasing_planner_and_manager/backend/controladores/controladores.dart';
import 'package:application_purchasing_planner_and_manager/pages/agregar.dart';
import 'package:flutter/material.dart';
import 'package:application_purchasing_planner_and_manager/styles/textStyles.dart';
//import 'package:application_purchasing_planner_and_manager/styles/colors.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
//import 'package:application_purchasing_planner_and_manager/backend/controladores/controladores.dart';
import 'package:application_purchasing_planner_and_manager/widgets/note_Tile.dart';
//import 'package:application_purchasing_planner_and_manager/styles/colors.dart';
//import 'package:application_purchasing_planner_and_manager/styles/textstyles.dart';

class Inicio extends StatelessWidget {
  final _notesController = Get.put(NoteController());
  final _tileCounts = [
    [2, 2],
    [2, 2],
    [4, 2],
    [2, 3],
    [2, 2],
    [2, 3],
    [2, 2],
  ];
  final _tileTypes = [
    TileType.Square,
    TileType.Square,
    TileType.HorRect,
    TileType.VerRect,
    TileType.Square,
    TileType.VerRect,
    TileType.Square,
  ];

  Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FloatingActionButton(
          backgroundColor: const Color(0xFF3B3B3B),
          onPressed: () {
            Get.to(() => const AgregarNota(
                  note: null,
                ));
          },
          child: const Icon(Icons.add),
        ),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            _appBar(),
            const SizedBox(
              height: 20,
            ),
            _body(),
          ],
        ),
      ),
    );
  }

  _appBar() {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Notes",
            style: titleTextStyle.copyWith(fontSize: 32),
          )
        ],
      ),
    );
  }

  _body() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(() {
        if (_notesController.noteList.isNotEmpty) {
          return StaggeredGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              axisDirection: AxisDirection.down,
              children: [
                for (int i = 0; i < _notesController.noteList.length; i++)
                  StaggeredGridTile.count(
                      crossAxisCellCount: _tileCounts[i % 7][0],
                      mainAxisCellCount: _tileCounts[i % 7][1],
                      child: NoteTile(
                        index: i,
                        note: _notesController.noteList[i],
                        tileType: _tileTypes[i % 7],
                      ))
              ]);
          // itemCount: _notesController.noteList.length,
          // itemBuilder: (context, index)
          // {
          //   return NoteTile(
          //     tileType: _tileTypes[index % 7],
          //     note: _notesController.noteList[index],
          //   );
          // },
          // StaggeredGridTileBuilder: (int index) => _tileCounts[index % 7]);

          // return StaggeredGridView.count(
          //   crossAxisCount: 4,
          //   StaggeredGridTiles: _StaggeredGridTiles,
          //   mainAxisSpacing: 12,
          //   crossAxisSpacing: 12,
          //   children: _notesController.noteList
          //       .map((n) => NoteTile(
          //             note: n,
          //           ))
          //       .toList(),
          // );

          // ListView.builder(
          //     itemCount: _notesController.noteList.length,
          //     itemBuilder: (context, index) {
          //       return NoteTile(
          //         note: _notesController.noteList[index],
          //       );
          //     });
        } else {
          return Center(
            child: Text("Empty", style: titleTextStyle),
          );
        }
      }),
    ));
  }
}
