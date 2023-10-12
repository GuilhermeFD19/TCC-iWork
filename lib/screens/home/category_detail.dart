import 'package:flutter/material.dart';
import 'package:iwork_project/_comum/select_icon.dart';
import 'package:iwork_project/models/autonomous_models.dart';
import 'package:iwork_project/repository/autonomous_repository.dart';
import 'package:iwork_project/screens/home/base_view.dart';
import 'package:iwork_project/screens/home/descricao_autonomo.dart';
import 'package:iwork_project/screens/home/search.dart';

class DetailHomeScreen extends StatelessWidget {
  String categoria;
  String nome;
  String autonomous;

  DetailHomeScreen(
      {super.key,
      required this.categoria,
      required this.nome,
      required this.autonomous});

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
  SelectIcon selectIcon = SelectIcon();
  AutonomousModels autonomous;

  AutonomousCard({super.key, required this.autonomous});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Card(
          elevation: 3.8,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DescricaoAutonomoScreen(
                    categoria: autonomous.autonomous,
                    nome: autonomous.name,
                    autonomoId: autonomous.id,
                    descricao: autonomous.description.descricao,
                  ),
                ),
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: selectIcon.selection(autonomous.autonomous),
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DescricaoAutonomoScreen(
                                categoria: autonomous.autonomous,
                                nome: autonomous.name,
                                autonomoId: autonomous.id,
                                descricao: autonomous.description.descricao,
                              ),
                            ),
                          );
                        }),
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
      ),
    );
  }
}
