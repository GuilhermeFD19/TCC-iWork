import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iwork_project/_comum/color_base.dart';
import 'package:iwork_project/models/autonomous_models.dart';
import 'package:iwork_project/providers/auth_provider.dart';
import 'package:iwork_project/screens/home/base_view.dart';
import 'package:iwork_project/screens/login.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  List<AutonomousModels> autonomousList = [];

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  void _loadUserProfile() {
    final User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      setState(() {
        _user = currentUser;
      });
    }
  }

  Future<void> _signOut() async {
    await _auth.signOut();

    await AuthProvider.setToken(false);

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => AuthScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      index: 2,
      appBar: AppBar(
        title: Column(children: [
          Text(
            "Bem vindo ao seu Perfil ",
            style: const TextStyle(fontSize: 22),
          ),
          Text(
            "${_user?.displayName ?? 'N/A'}",
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              fontFamily: 'Roboto',
            ),
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
      body: Padding(
        padding: const EdgeInsets.all(42.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.account_circle_rounded,
              size: 100.0,
              color: Colors.grey,
            ),
            SizedBox(height: 28.0),
            Text(
              'Nome: ${_user?.displayName ?? 'N/A'}',
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Roboto'),
            ),
            SizedBox(height: 8.0),
            Text(
              'E-mail: ${_user?.email ?? 'N/A'}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(primary: MyColors.backgroundColor),
              onPressed: () {
                _signOut();
              },
              child: Text('Sair'),
            ),
          ],
        ),
      ),
    );
  }
}
