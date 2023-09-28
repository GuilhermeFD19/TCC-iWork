import 'package:flutter/material.dart';
import 'package:iwork_project/screens/home/base_view.dart';
import 'package:iwork_project/services/auth_services.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      index: 2,
      appBar: AppBar(
        title: Column(children: [
          Text(
            "Perfil",
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
        body: Center(
          child: ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Deslogar"),
            onTap: () {
              AutenticationServices().deslogar();
            },
          ),
        ),
      ),
    );
  }
}
