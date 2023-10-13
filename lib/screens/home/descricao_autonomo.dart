import 'package:flutter/material.dart';
import 'package:iwork_project/models/descricao_models.dart';
import 'package:iwork_project/repository/descricao_repository.dart';
import 'package:iwork_project/screens/home/base_view.dart';

class DescricaoAutonomoScreen extends StatelessWidget {
  final String nome;
  final String categoria;
  final String autonomoId;
  final String descricao;
  final String telefone;

  DescricaoAutonomoScreen({
    required this.nome,
    required this.categoria,
    required this.autonomoId,
    required this.descricao,
    required this.telefone,
  });

  Icon selectIcon(String categoria) {
    switch (categoria) {
      case "Eletricista":
        return Icon(Icons.electrical_services);
      case "Encanador":
        return Icon(Icons.water_damage);
      case "Pedreiro":
        return Icon(Icons.construction);
      case "Pintor":
        return Icon(Icons.format_paint);
      case "Carpinteiro":
        return Icon(Icons.handyman);
      case "Manicure":
        return Icon(Icons.woman_2_outlined);
      case "Cabeleireiro":
        return Icon(Icons.cut_outlined);
      case "Jardineiro":
        return Icon(Icons.sunny);
      case "Desenvolvedor":
        return Icon(Icons.computer);

      default:
        return Icon(Icons.person);
    }
  }

  @override
  Widget build(BuildContext context) {
    DescricaoModels autonomo;
    try {
      autonomo = DescricaoRepository()
          .listaDescricao
          .toList()
          .firstWhere((element) => element.id == autonomoId);
    } catch (e) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Detalhes do Autônomo'),
        ),
        body: Center(
          child: Text('Autônomo não encontrado.'),
        ),
      );
    }

    return BaseView(
      index: 1,
      appBar: AppBar(
        title: const Column(
          children: [
            Text(
              "Perfil do Profissional",
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
      body: Padding(
        padding: EdgeInsets.only(top: 180.0, left: 12.9, right: 12.9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categoria: ${categoria}',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 23.0),
            Text(
              'Nome: ${nome}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 23.0),
            Text(
              'Descrição: ${descricao}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 23.0),
            Text(
              'Endereço: ${autonomo.endereco}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 23.0),
            Text(
              'Tipo de Atendimento: ${autonomo.tipoAtendimento}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 23.0),
            Text(
              'Horário de Funcionamento: ${autonomo.horarioFuncionamento}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 23.0),
            Text(
              'Telefone: ${telefone}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 23.0),
            Row(
              children: [
                Text(
                  'Avaliação: ',
                  style: TextStyle(fontSize: 20),
                ),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Text(
                  '${autonomo.ratingEstrelas.toStringAsFixed(1)}',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
