import 'package:flutter/material.dart';
import 'package:iwork_project/services/auth_services.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListTile(
          leading: const Icon(Icons.logout),
          title: const Text("Deslogar"),
          onTap: () {
            AutenticationServices().deslogar();
          },
        ),
      ),
    );
  }
}
