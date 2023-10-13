import 'package:flutter/material.dart';
import 'package:iwork_project/_comum/select_icon.dart';
import 'package:iwork_project/models/autonomous_models.dart';
import 'package:iwork_project/models/descricao_models.dart';
import 'package:iwork_project/repository/autonomous_repository.dart';
import 'package:iwork_project/repository/descricao_repository.dart';
import 'package:iwork_project/screens/home/base_view.dart';
import 'package:iwork_project/screens/home/descricao_autonomo.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  DescricaoRepository descricaoRepository = DescricaoRepository();

  @override
  Widget build(BuildContext context) {
    DescricaoModels autonomo;

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
        toolbarHeight: 112.0,
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
  SelectIcon selectIcon = SelectIcon();
  List<AutonomousModels> autonomos = AutonomousRepository().listaAvaliacao;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          children: [
            DestaqueCard(
              nome: autonomos[11].name,
              categoria: autonomos[11].autonomous,
              icone: selectIcon.selection(autonomos[11].autonomous),
              autonomoId: autonomos[11].id,
              descricao: autonomos[11].description.descricao,
              telefone: autonomos[11].telefone,
            ),
            DestaqueCard(
              nome: autonomos[4].name,
              categoria: autonomos[4].autonomous,
              icone: selectIcon.selection(autonomos[4].autonomous),
              autonomoId: autonomos[4].id,
              descricao: autonomos[4].description.descricao,
              telefone: autonomos[4].telefone,
            ),
            DestaqueCard(
              nome: autonomos[0].name,
              categoria: autonomos[0].autonomous,
              icone: selectIcon.selection(autonomos[0].autonomous),
              autonomoId: autonomos[0].id,
              descricao: autonomos[0].description.descricao,
              telefone: autonomos[0].telefone,
            ),
            DestaqueCard(
              nome: autonomos[3].name,
              categoria: autonomos[3].autonomous,
              icone: selectIcon.selection(autonomos[3].autonomous),
              autonomoId: autonomos[3].id,
              descricao: autonomos[3].description.descricao,
              telefone: autonomos[3].telefone,
            ),
            DestaqueCard(
              nome: autonomos[1].name,
              categoria: autonomos[1].autonomous,
              icone: selectIcon.selection(autonomos[1].autonomous),
              autonomoId: autonomos[1].id,
              descricao: autonomos[1].description.descricao,
              telefone: autonomos[1].telefone,
            ),
            DestaqueCard(
              nome: autonomos[6].name,
              categoria: autonomos[6].autonomous,
              icone: selectIcon.selection(autonomos[6].autonomous),
              autonomoId: autonomos[6].id,
              descricao: autonomos[6].description.descricao,
              telefone: autonomos[6].telefone,
            ),
            DestaqueCard(
              nome: autonomos[2].name,
              categoria: autonomos[2].autonomous,
              icone: selectIcon.selection(autonomos[2].autonomous),
              autonomoId: autonomos[2].id,
              descricao: autonomos[2].description.descricao,
              telefone: autonomos[2].telefone,
            ),
            DestaqueCard(
              nome: autonomos[5].name,
              categoria: autonomos[5].autonomous,
              icone: selectIcon.selection(autonomos[5].autonomous),
              autonomoId: autonomos[5].id,
              descricao: autonomos[5].description.descricao,
              telefone: autonomos[5].telefone,
            ),
          ],
        ),
      ),
    );
  }
}

class DestaqueCard extends StatelessWidget {
  String nome;
  String categoria;
  Icon icone;
  String autonomoId;
  String descricao;
  String telefone;

  DestaqueCard({
    super.key,
    required this.nome,
    required this.categoria,
    required this.icone,
    required this.autonomoId,
    required this.descricao,
    required this.telefone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.0,
      height: 110.2,
      child: Card(
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DescricaoAutonomoScreen(
                  nome: nome,
                  categoria: categoria,
                  autonomoId: autonomoId,
                  descricao: descricao,
                  telefone: telefone);
            })); // Implemente a navegação para a página de descrição
          },
          child: Wrap(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: icone,
                radius: 60.0,
              ),
              ListTile(
                title: Text(nome),
                subtitle: Text(categoria),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfissionaisNovos extends StatelessWidget {
  SelectIcon selectIcon = SelectIcon();
  List<AutonomousModels> autonomos = AutonomousRepository().listaAvaliacao;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 200.0,
        child: GridView(
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
          ),
          children: [
            CardProfissionais(
              nome: autonomos[11].name,
              categoria: autonomos[11].autonomous,
              icone: selectIcon.selection(autonomos[11].autonomous),
              autonomoId: autonomos[11].id,
              descricao: autonomos[11].description.descricao,
              telefone: autonomos[11].telefone,
            ),
            CardProfissionais(
              nome: autonomos[4].name,
              categoria: autonomos[4].autonomous,
              icone: selectIcon.selection(autonomos[4].autonomous),
              autonomoId: autonomos[4].id,
              descricao: autonomos[4].description.descricao,
              telefone: autonomos[4].telefone,
            ),
            CardProfissionais(
              nome: autonomos[0].name,
              categoria: autonomos[0].autonomous,
              icone: selectIcon.selection(autonomos[0].autonomous),
              autonomoId: autonomos[0].id,
              descricao: autonomos[0].description.descricao,
              telefone: autonomos[0].telefone,
            ),
            CardProfissionais(
              nome: autonomos[5].name,
              categoria: autonomos[5].autonomous,
              icone: selectIcon.selection(autonomos[5].autonomous),
              autonomoId: autonomos[5].id,
              descricao: autonomos[5].description.descricao,
              telefone: autonomos[5].telefone,
            ),
            CardProfissionais(
              nome: autonomos[1].name,
              categoria: autonomos[1].autonomous,
              icone: selectIcon.selection(autonomos[1].autonomous),
              autonomoId: autonomos[1].id,
              descricao: autonomos[1].description.descricao,
              telefone: autonomos[1].telefone,
            ),

            CardProfissionais(
              nome: autonomos[3].name,
              categoria: autonomos[3].autonomous,
              icone: selectIcon.selection(autonomos[3].autonomous),
              autonomoId: autonomos[3].id,
              descricao: autonomos[3].description.descricao,
              telefone: autonomos[3].telefone,
            ),

            CardProfissionais(
              nome: autonomos[2].name,
              categoria: autonomos[2].autonomous,
              icone: selectIcon.selection(autonomos[2].autonomous),
              autonomoId: autonomos[2].id,
              descricao: autonomos[2].description.descricao,
              telefone: autonomos[2].telefone,
            ),

            // Adicione mais CardProfissionais conforme necessário
          ],
        ),
      ),
    );
  }
}

class CardProfissionais extends StatelessWidget {
  String nome;
  String categoria;
  Icon icone;
  String autonomoId;
  String descricao;
  String telefone;

  CardProfissionais({
    super.key,
    required this.nome,
    required this.categoria,
    required this.icone,
    required this.autonomoId,
    required this.descricao,
    required this.telefone,
  });

  @override
  Widget build(BuildContext context) {
    // Implemente o cartão da categoria
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DescricaoAutonomoScreen(
                nome: nome,
                categoria: categoria,
                autonomoId: autonomoId,
                descricao: descricao,
                telefone: telefone);
          })); // Implemente a navegação para a página de descrição
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: icone,
                radius: 30.0,
              ),
            ),
            ListTile(
              title: Text(nome),
              subtitle: Text(categoria),
            ),
          ],
        ),
      ),
    );
  }
}

class ListaProfissionais extends StatelessWidget {
  SelectIcon selectIcon = SelectIcon();
  AutonomousRepository autonomousRepository = AutonomousRepository();

  @override
  Widget build(BuildContext context) {
    List<AutonomousModels> autonomos = autonomousRepository.listaAvaliacao;

    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        listaProfissionaisCard(
          nome: autonomos[11].name,
          categoria: autonomos[11].autonomous,
          icone: selectIcon.selection(autonomos[11].autonomous),
          autonomoId: autonomos[11].id,
          descricao: autonomos[11].description.descricao,
          telefone: autonomos[11].telefone,
        ),
        listaProfissionaisCard(
          nome: autonomos[0].name,
          categoria: autonomos[0].autonomous,
          icone: selectIcon.selection(autonomos[0].autonomous),
          autonomoId: autonomos[0].id,
          descricao: autonomos[0].description.descricao,
          telefone: autonomos[0].telefone,
        ),
        listaProfissionaisCard(
          nome: autonomos[1].name,
          categoria: autonomos[1].autonomous,
          icone: selectIcon.selection(autonomos[1].autonomous),
          autonomoId: autonomos[1].id,
          descricao: autonomos[1].description.descricao,
          telefone: autonomos[1].telefone,
        ),
        listaProfissionaisCard(
          nome: autonomos[2].name,
          categoria: autonomos[2].autonomous,
          icone: selectIcon.selection(autonomos[2].autonomous),
          autonomoId: autonomos[2].id,
          descricao: autonomos[2].description.descricao,
          telefone: autonomos[2].telefone,
        ),
        listaProfissionaisCard(
          nome: autonomos[3].name,
          categoria: autonomos[3].autonomous,
          icone: selectIcon.selection(autonomos[3].autonomous),
          autonomoId: autonomos[3].id,
          descricao: autonomos[3].description.descricao,
          telefone: autonomos[3].telefone,
        ),
        listaProfissionaisCard(
          nome: autonomos[4].name,
          categoria: autonomos[4].autonomous,
          icone: selectIcon.selection(autonomos[4].autonomous),
          autonomoId: autonomos[4].id,
          descricao: autonomos[4].description.descricao,
          telefone: autonomos[4].telefone,
        ),
        listaProfissionaisCard(
          nome: autonomos[5].name,
          categoria: autonomos[5].autonomous,
          icone: selectIcon.selection(autonomos[5].autonomous),
          autonomoId: autonomos[5].id,
          descricao: autonomos[5].description.descricao,
          telefone: autonomos[5].telefone,
        ),
      ],
    );
  }
}

class listaProfissionaisCard extends StatelessWidget {
  String nome;
  String categoria;
  Icon icone;
  String autonomoId;
  String descricao;
  String telefone;

  listaProfissionaisCard(
      {super.key,
      required this.nome,
      required this.categoria,
      required this.icone,
      required this.autonomoId,
      required this.descricao,
      required this.telefone});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      color: Colors.amber[500],
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DescricaoAutonomoScreen(
                    nome: nome,
                    categoria: categoria,
                    autonomoId: autonomoId,
                    descricao: descricao,
                    telefone: telefone);
              })); // Implemente a navegação para a página de descrição
            },
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: icone,
              radius: 30.0,
            ),
            title: Text(nome),
            subtitle: Text(categoria),
          ),
        ],
      ),
    );
  }
}
