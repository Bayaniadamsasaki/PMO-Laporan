// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegisterResponseModel {
  int? id;
  String? name;
  String? email;
  DateTime? createdAt;
  DateTime? updatedAt;

  RegisterResponseModel({
    this.id,
    this.name,
    this.email,
    this.createdAt,
    this.updatedAt,
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
    };
  }

  factory RegisterResponseModel.fromMap(Map<String, dynamic> map) {
    return RegisterResponseModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      createdAt: map['createdAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int) : null,
      updatedAt: map['updatedAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterResponseModel.fromJson(String source) => RegisterResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
