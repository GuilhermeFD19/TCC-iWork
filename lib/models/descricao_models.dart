import 'package:iwork_project/models/autonomous_models.dart';

class DescricaoModels {
  final String id;

  final String endereco;
  final String descricao;
  final String tipoAtendimento;
  final String horarioFuncionamento;
  final double ratingEstrelas;
  final String telefone;

  DescricaoModels({
    required this.id,
    required this.endereco,
    required this.descricao,
    required this.tipoAtendimento,
    required this.horarioFuncionamento,
    required this.ratingEstrelas,
    required this.telefone,
  });

  DescricaoModels.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        endereco = map['endereco'],
        descricao = map['descricao'],
        tipoAtendimento = map['tipoAtendimento'],
        horarioFuncionamento = map['horarioFuncionamento'],
        ratingEstrelas = map['ratingEstrelas'],
        telefone = map['telefone'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'endereco': endereco,
      'descricao': descricao,
      'tipoAtendimento': tipoAtendimento,
      'horarioFuncionamento': horarioFuncionamento,
      'ratingEstrelas': ratingEstrelas,
      'telefone': telefone,
    };
  }
}
