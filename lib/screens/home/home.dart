import 'package:flutter/material.dart';
import 'package:iwork_project/models/autonomous_models.dart';
import 'package:iwork_project/models/avaliacao_models.dart';
import 'package:iwork_project/screens/home/base_view.dart';
import 'package:iwork_project/screens/home/desc_autonomous.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  final List<AutonomousModels> listaAvaliacao = [
    AutonomousModels(
      id: '1',
      name: 'José Amparo',
      autonomous: 'Pedreiro',
      description: 'Reparo de encanamento residencial.',
      urlImage: 'assets/logo.png',
    ),
    AutonomousModels(
      id: '2',
      name: 'Eletricista',
      autonomous: 'Eletricista',
      description: 'Instalação elétrica e reparos.',
      urlImage: 'assets/logo.png',
    ),
    AutonomousModels(
      id: '3',
      name: 'Pedreiro',
      autonomous: 'Pedreiro',
      description: 'Reparos e construção de alvenaria.',
      urlImage: 'assets/logo.png',
    ),
    AutonomousModels(
      id: '4',
      name: 'Pedreiro',
      autonomous: 'Pedreiro',
      description: 'Reparos e construção de alvenaria.',
      urlImage: 'assets/logo.png',
    ),
  ];

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
          itemCount: listaAvaliacao.length,
          itemBuilder: (context, index) {
            return AutonomousCard(autonomous: listaAvaliacao[index]);
          },
        ),
      ),
    );
  }
}

class AutonomousCard extends StatelessWidget {
  const AutonomousCard({super.key, required AutonomousModels autonomous});

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
                  image: AssetImage('assets/logo.png'),
                  width: 100,
                  height: 100,
                ),
              ),
              const ListTile(
                title: Text('José Amparo'),
                subtitle: Text('Pedreiro'),
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
                  const SizedBox(width: 8),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
