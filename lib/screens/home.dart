import 'package:flutter/material.dart';
import 'package:iwork_project/models/exe_models.dart';
import 'package:iwork_project/models/sentimento_models.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  final ExeModels exeModels = ExeModels(
    id: '1',
    name: 'Remada supinada',
    treino: 'Costas',
    comoFazer: 'Pegada baixa e puxa',
    urlImage: 'urlImage',
  );
  ExeModels exeModels2 = ExeModels(
    id: '2',
    name: 'Supino reto',
    treino: 'Peito',
    comoFazer: 'Concentrar a barra no peito',
    urlImage: 'urlImage',
  );
  final List<SentimentoModelo> listaSentimentos = [
    SentimentoModelo(
      id: '1',
      sentindo: 'cabouuu',
      data: '12-12-2021',
    ),
    SentimentoModelo(
      id: '2',
      sentindo: 'dor nas costas',
      data: '12-12-2021',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Column(children: [
          Text(
            exeModels.name,
            style: const TextStyle(fontSize: 22),
          ),
          Text(
            exeModels.treino,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Clique");
        },
        child: const Icon(Icons.search),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(50.0),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Enviar foto"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Enviar video"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Como fazer?",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xFF000000),
              ),
            ),
            Text(exeModels.comoFazer),
            const Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(
                  color: Colors.black,
                  thickness: 2.0,
                  indent: 10.0,
                )),
            const Text(
              "Como estou me sentindo?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xFF000000),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(listaSentimentos.length, (index) {
                return ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text(listaSentimentos[index].sentindo),
                    subtitle: Text(listaSentimentos[index].data),
                    leading: const Icon(Icons.double_arrow),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () {
                        print("Deletado ${listaSentimentos[index].id}");
                      },
                    ));
              }),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
