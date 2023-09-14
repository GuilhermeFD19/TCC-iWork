class ExeModels {
  String id;
  String name;
  String treino;
  String comoFazer;

  String? urlImage;

  ExeModels({
    required this.id,
    required this.name,
    required this.treino,
    required this.comoFazer,
    required String urlImage,
  });

  ExeModels.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        treino = map['treino'],
        comoFazer = map['comoFazer'],
        urlImage = map['urlImage'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'treino': treino,
      'comoFazer': comoFazer,
      'urlImage': urlImage
    };
  }
}
