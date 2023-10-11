import 'package:flutter/material.dart';
import 'package:iwork_project/screens/home/base_view.dart';
import 'package:iwork_project/screens/home/category_detail.dart';
import 'package:iwork_project/screens/home/descricao_autonomo.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

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
        body: ListView(
          children: [
            // Seção de Autônomos em Destaque
            SectionTitle(
              title: "Profissionais Novos",
            ),
            ProfissionaisNovos(),

            // Seção de ProfissionaisNovos
            SectionTitle(title: "Autonomos em Destaque"),
            AutonomosEmDestaque(),

            // Seção de ListaProfissionais
            SectionTitle(title: "Lista de Profissionais"),
            ListaProfissionais(),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
        ),
      ),
    );
  }
}

class AutonomosEmDestaque extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        children: [
          DestaqueCard(),
          DestaqueCard(),
          DestaqueCard(),
          DestaqueCard(),
          DestaqueCard(),
          DestaqueCard(),
          DestaqueCard(),
        ],
      ),
    );
  }
}

class DestaqueCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.0,
      height: 110.2,
      child: Card(
        child: Wrap(
          children: [
            Image.asset(
              'assets/newlogo.png',
              width: 110.0,
              height: 110.0,
              fit: BoxFit.fill,
            ),
            ListTile(
              title: Text("Guilherme Doretto"),
              subtitle: Text("Pedreiro"),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfissionaisNovos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 150.0,
        child: GridView(
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
          ),
          children: [
            CardProfissionais(),
            CardProfissionais(),
            CardProfissionais(),
            CardProfissionais(),
            CardProfissionais(),
            CardProfissionais(),
            // Adicione mais CardProfissionais conforme necessário
          ],
        ),
      ),
    );
  }
}

class CardProfissionais extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implemente o cartão da categoria
    return Card(
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Padding(
              padding: const EdgeInsets.all(12.0),
              child: const Image(
                image: AssetImage('assets/newlogo.png'),
                width: 40,
                height: 40,
              ),
            ),
            ListTile(
              title: Text("Nome Profissional"),
              subtitle: Text("Nome estbelecimento"),
            ),
          ],
        ),
      ),
    );
  }
}

class ListaProfissionais extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        ListaDeProfissionais(),
        ListaDeProfissionais(),
        ListaDeProfissionais(),
        ListaDeProfissionais(),
        ListaDeProfissionais(),
        ListaDeProfissionais(),
      ],
    );
  }
}

class ListaDeProfissionais extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      color: Colors.amber[500],
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/newlogo.png'),
              radius: 30.0,
            ),
            title: Text("Nome Profissional"),
            subtitle: Text("Nome Estabelecimento"),
          ),
        ],
      ),
    );
  }
}
