import 'package:flutter/material.dart';
import 'package:iwork_project/models/autonomous_models.dart';
import 'package:iwork_project/models/avaliacao_models.dart';
import 'package:iwork_project/screens/home/base_view.dart';
import 'package:iwork_project/screens/home/search.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      index: 0,
      appBar: AppBar(
        title: Column(children: [
          Text(
            "Home",
            style: const TextStyle(fontSize: 22),
          ),
          Text(
            "iWork",
            style: const TextStyle(fontSize: 15),
          ),
        ]),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 55, 63, 55),
        toolbarHeight: 72.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Scaffold(
        body: ListView.builder(
          itemBuilder: (context, index) {},
        ),
      ),
    );
  }
}
