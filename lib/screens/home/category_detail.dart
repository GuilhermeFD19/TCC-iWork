import 'package:flutter/material.dart';
import 'package:iwork_project/models/autonomous_models.dart';
import 'package:iwork_project/models/avaliacao_models.dart';
import 'package:iwork_project/repository/autonomous_repository.dart';
import 'package:iwork_project/screens/home/base_view.dart';
import 'package:iwork_project/screens/home/search.dart';

class DetailHomeScreen extends StatelessWidget {
  String categoria;
  DetailHomeScreen({super.key, required this.categoria});

  AutonomousRepository autonomousRepository = AutonomousRepository();
  List<AutonomousModels> listaAvaliacao = [];

  @override
  Widget build(BuildContext context) {
    listaAvaliacao = autonomousRepository.listaAvaliacao;
    List<AutonomousModels> listaNova = [];
    for (AutonomousModels item in listaAvaliacao) {
      if (item.autonomous == categoria) {
        listaNova.add(item);
      }
    }
    return BaseView(
      index: 1,
      appBar: AppBar(
        title: Column(children: [
          Text(
            "Profissinais disponíveis",
            style: const TextStyle(fontSize: 22),
          ),
          Text(
            "Classe a ser escolhida",
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
          itemCount: listaNova.length,
          itemBuilder: (context, index) {
            return AutonomousCard(autonomous: listaNova[index]);
          },
        ),
      ),
    );
  }
}

class AutonomousCard extends StatelessWidget {
  AutonomousModels autonomous;

  AutonomousCard({super.key, required this.autonomous});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: InkWell(
          onTap: () {},
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Padding(
                padding: const EdgeInsets.all(2.0),
                child: const Image(
                  image: AssetImage('assets/newlogo.png'),
                  width: 100,
                  height: 100,
                ),
              ),
              ListTile(
                title: Text(autonomous.name),
                subtitle: Text(autonomous.autonomous),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(Icons.star, color: Colors.yellow[600]),
                  TextButton(
                      child: const Text('VER PERFIL'),
                      onPressed: () {/* ... */}),
                  const SizedBox(width: 8),
                  TextButton(
                    child: const Text('AVALIAR'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => descAutoo()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
