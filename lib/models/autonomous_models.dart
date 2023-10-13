import 'package:iwork_project/models/descricao_models.dart';

class AutonomousModels {
  String id;
  String name;
  String autonomous;
  DescricaoModels description;
  String? urlImage;
  String telefone;

  AutonomousModels({
    required this.id,
    required this.name,
    required this.autonomous,
    required this.description,
    required String urlImage,
    required this.telefone,
  });

  AutonomousModels.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        autonomous = map['autonomous'],
        description = map['description'],
        urlImage = map['urlImage'],
        telefone = map['telefone'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'autonomous': autonomous,
      'description': description,
      'urlImage': urlImage,
      'telefone': telefone,
    };
  }
}
