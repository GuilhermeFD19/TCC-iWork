import 'package:flutter/material.dart';
import 'package:iwork_project/screens/home/home.dart';
import 'package:iwork_project/screens/home/profile.dart';
import 'package:iwork_project/screens/home/search.dart';
import 'package:iwork_project/splash_screen.dart';

class BaseView extends StatefulWidget {
  AppBar appBar;
  Widget body;
  int index;
  BaseView(
      {Key? key, required this.appBar, required this.body, required this.index})
      : super(key: key);

  @override
  _BaseViewState createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.body,
      appBar: widget.appBar,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          switch (value) {
            case 0:
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScreenHome(),
                  ));
              break;
            case 1:
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ));
              break;
            case 2:
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ));
              break;
            default:
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScreenHome(),
                  ));
          }
        },
        currentIndex: widget.index,
        backgroundColor: Theme.of(context).primaryColorLight,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Pesquisar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
          ),
        ],
      ),
    );
  }
}
