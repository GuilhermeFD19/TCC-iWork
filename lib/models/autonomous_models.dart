class AutonomousModels {
  String id;
  String name;
  String autonomous;
  String description;

  String? urlImage;

  AutonomousModels({
    required this.id,
    required this.name,
    required this.autonomous,
    required this.description,
    required String urlImage,
  });

  AutonomousModels.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        autonomous = map['autonomous'],
        description = map['description'],
        urlImage = map['urlImage'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'autonomous': autonomous,
      'description': description,
      'urlImage': urlImage
    };
  }
}
