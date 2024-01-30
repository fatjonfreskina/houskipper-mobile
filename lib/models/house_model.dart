class House {
  int id;
  String houseName;
  DateTime createdDate;

  House({required this.id, required this.houseName, required this.createdDate});

  factory House.fromJson(Map<String, dynamic> json) {
    return House(
        id: json['id'] ?? '',
        houseName: json['houseName'] ?? '',
        createdDate: json['createdDate'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'houseName': houseName,
      'createdDate': createdDate,
    };
  }

  @override
  String toString() {
    return 'id: $id, houseName: $houseName, createdDate: $createdDate';
  }
}
