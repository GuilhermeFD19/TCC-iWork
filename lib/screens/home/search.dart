import 'package:flutter/material.dart';
import 'package:iwork_project/models/autonomous_models.dart';
import 'package:iwork_project/screens/home/base_view.dart';
import 'package:iwork_project/screens/home/home.dart';
import 'package:iwork_project/splash_screen.dart';

void main() {
  runApp(descAutoo());
}

class descAutoo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfessionalListScreen(),
    );
  }
}

class ProfessionalListScreen extends StatefulWidget {
  @override
  _ProfessionalListScreenState createState() => _ProfessionalListScreenState();
}

class _ProfessionalListScreenState extends State<ProfessionalListScreen> {
  List<String> professionals = [
    'Eletricista',
    'Encanador',
    'Carpinteiro',
    'Pintor',
    'Pedreiro',
    'Jardineiro',
    'Jardineiro',
    'Jardineiro',
    'Jardineiro',
  ];

  List<String> filteredProfessionals = [];

  @override
  void initState() {
    super.initState();
    filteredProfessionals = professionals;
  }

  List<AutonomousModels> listadeautonomos = [];
  void adicionarAutonomo() {
    listadeautonomos.add(AutonomousModels(
      id: '1',
      name: 'José Amparo',
      autonomous: 'Pedreiro',
      description: 'Reparo de encanamento residencial.',
      urlImage: 'assets/logo.png',
    ));
    listadeautonomos.add(AutonomousModels(
      id: '2',
      name: 'Eletricista',
      autonomous: 'Eletricista',
      description: 'Instalação elétrica e reparos.',
      urlImage: 'assets/logo.png',
    ));
    listadeautonomos.add(AutonomousModels(
      id: '3',
      name: 'Pedreiro',
      autonomous: 'Pedreiro',
      description: 'Reparos e construção de alvenaria.',
      urlImage: 'assets/logo.png',
    ));
    listadeautonomos.add(AutonomousModels(
      id: '4',
      name: 'Pedreiro',
      autonomous: 'Pedreiro',
      description: 'Reparos e construção de alvenaria.',
      urlImage: 'assets/logo.png',
    ));
  }

  void filterProfessionals(String query) {
    setState(() {
      filteredProfessionals = professionals
          .where((professional) =>
              professional.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Card> cards = [];

    for (var filtered in filteredProfessionals) {
      Card card = Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScreenHome()),
                  );
                },
                child: Text(
                  filtered,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      );
      cards.add(card);
    }

    return BaseView(
      index: 1,
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "Procurar Autonomo",
              style: const TextStyle(fontSize: 22),
            ),
            Text(
              "iWork",
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: filterProfessionals,
              decoration: InputDecoration(
                fillColor: Color.fromARGB(255, 255, 254, 249),
                filled: true,
                labelText: 'Pesquisar Profissionais',
                hintText: 'Pesquisar Profissionais',
                prefixIcon: Icon(Icons.person_search),
                iconColor: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Categorias",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: cards,
            ),
          ),
        ],
      ),
    );
  }
}
