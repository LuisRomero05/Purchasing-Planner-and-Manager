//import 'dart:ffi';
import 'package:application_purchasing_planner_and_manager/pages/inicio.dart';
import 'package:application_purchasing_planner_and_manager/widgets/iconbutton.dart';
import 'package:flutter/material.dart';
import 'package:application_purchasing_planner_and_manager/backend/models.dart';
import 'package:get/get.dart';
import 'package:application_purchasing_planner_and_manager/styles/textStyles.dart';
//import 'package:intl/intl.dart';
//import 'package:application_purchasing_planner_and_manager/backend/controladores/controladores.dart';

class AgregarNota extends StatefulWidget {
  final bool estado;
  final Note? note;
  const AgregarNota({super.key, this.estado = false, this.note});
  @override
  State<AgregarNota> createState() => _AgregarNotaState();
}

class _AgregarNotaState extends State<AgregarNota> {
  final TextEditingController _titleTextController = TextEditingController();
  final TextEditingController _noteTextController = TextEditingController();
  // final NoteController _noteController = Get.find<NoteController>();
  // final TextEditingController _tagEditingController = TextEditingController();
  // final DateTime _currentDate = DateTime.now();
  // final double _precio=double.infinity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        children: [
          _appBar(),
          _body(),
        ],
      )),
    );
  }

  _appBar() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyIconButton(
            onTap: () {
              Get.back();
            },
            icon: Icons.keyboard_arrow_left,
          ),
          MyIconButton(
            onTap: () {
              _validateInput();
            },
            txt: widget.estado ? "Update" : "Save",
          )
        ],
      ),
    );
  }

  _body() {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            //controller: _titleTextController,
            //style: titleTextStyle,
            cursorColor: Colors.white,
            maxLines: 3,
            minLines: 1,
            decoration: InputDecoration(
              hintText: "Title",
              hintStyle: titleTextStyle.copyWith(color: Colors.grey),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            //controller: _noteTextController,
            //style: bodyTextStyle,
            cursorColor: Colors.white,
            minLines: 3,
            maxLines: 12,
            decoration: const InputDecoration(
              hintText: "Type something...",
              //hintStyle: bodyTextStyle,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white10),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _validateInput() async {
    bool isNotEmpty = _titleTextController.text.isNotEmpty &&
        _noteTextController.text.isNotEmpty;
    if (isNotEmpty && !widget.estado) {
      _addNoteToDB();
      Get.back();
    } else if (widget.estado &&
            _titleTextController.text != widget.note!.titulo ||
        _noteTextController.text != widget.note!.descripcion) {
      _updateNote();
      Get.offAll(() => Inicio());
    } else {
      Get.snackbar(
        widget.estado ? "Not Updated" : "Required*",
        widget.estado
            ? "Fields are not updated yet."
            : "All fields are required.",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
      );
    }
  }

  _addNoteToDB() async {
    // await _noteController.addNote(
    //   note: Note(
    //     descripcion: _noteTextController.text,
    //     titulo: _titleTextController.text,
    //     fecha: DateFormat.yMMMd().format(_currentDate).toString(),
    //     etiqueta: _tagEditingController.text,
    //     precio: _precio,
    //   ),
    // );
  }

  _updateNote() async {
    // await _noteController.updateNote(
    //   note: Note(
    //     descripcion: _noteTextController.text,
    //     titulo: _titleTextController.text,
    //     fecha: DateFormat.yMMMd().format(_currentDate).toString(),
    //     etiqueta: _tagEditingController.text,
    //     precio: _precio,
    //   ),
    // );
  }
}
