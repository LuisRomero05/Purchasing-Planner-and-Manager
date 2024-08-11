import 'package:flutter/material.dart';
//import 'package:application_purchasing_planner_and_manager/styles/colors.dart';
//import 'package:application_purchasing_planner_and_manager/styles/textstyles.dart';

class MyWidget extends StatelessWidget {
  
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FloatingActionButton(
          backgroundColor:  const Color(0xFF3B3B3B),
          onPressed: () {}, child: const Icon(Icons.add),
          ),
        ),
        backgroundColor: Colors.black26,
        body: SafeArea(
          child: Column(children: [
            _appBar(),
            const SizedBox(
              height: 20,
            ),
            //_body(),
          ],
        ),
      ),
    );
  }
  _appBar() {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [],
      ),
    );
  }

}