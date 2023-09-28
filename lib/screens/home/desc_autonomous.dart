import 'package:flutter/material.dart';
import 'package:iwork_project/screens/home/home.dart';

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
  ];

  List<String> filteredProfessionals = [];

  @override
  void initState() {
    super.initState();
    filteredProfessionals = [];
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Profissionais Autônomos'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: filterProfessionals,
              decoration: InputDecoration(
                labelText: 'Pesquisar Profissionais',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProfessionals.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredProfessionals[index]),
                  // Adicione ação para cada profissional, se necessário
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ScreenHome()),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
