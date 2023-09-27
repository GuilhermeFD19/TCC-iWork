class AvaliacaoAutonomous {
  String id;
  String rating;
  String date;
  String assessment;

  AvaliacaoAutonomous({
    required this.id,
    required this.rating,
    required this.date,
    required this.assessment,
  });

  AvaliacaoAutonomous.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        rating = map['rating'],
        date = map['date'],
        assessment = map['assessment'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'rating': rating,
      'date': date,
      'assessment': assessment,
    };
  }
}
