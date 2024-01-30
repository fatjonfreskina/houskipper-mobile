import 'package:app/models/chore_model.dart';
import 'package:app/models/user_model.dart';

class ChoreRecord {
  Chore chore;
  User user;
  DateTime createdAt;

  ChoreRecord(
      {required this.chore, required this.user, required this.createdAt});

  factory ChoreRecord.fromJson(Map<String, dynamic> json) {
    return ChoreRecord(
        chore: json['chore'] ?? '',
        user: json['user'] ?? '',
        createdAt: json['createdAt'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'chore': chore,
      'user': user,
      'createdAt': createdAt,
    };
  }

  @override
  String toString() {
    return 'chore: $chore, user: $user, createdAt: $createdAt';
  }
}
