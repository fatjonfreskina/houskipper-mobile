class Chore {
  int id;
  String choreName;
  int choreValue;
  String choreDescription;

  Chore(
      {required this.id,
      required this.choreName,
      required this.choreValue,
      required this.choreDescription});

  factory Chore.fromJson(Map<String, dynamic> json) {
    return Chore(
        id: json['id'] ?? '',
        choreName: json['choreName'] ?? '',
        choreValue: json['choreValue'] ?? '',
        choreDescription: json['choreDescription'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'choreName': choreName,
      'choreValue': choreValue,
      'choreDescription': choreDescription,
    };
  }

  @override
  String toString() {
    return 'id: $id, choreName: $choreName, choreValue: $choreValue, choreDescription: $choreDescription';
  }
}
