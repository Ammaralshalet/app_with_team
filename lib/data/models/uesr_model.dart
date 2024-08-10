// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UesrModel {
  String uesr;
  String password;
  UesrModel({
    required this.uesr,
    required this.password,
  });

  UesrModel copyWith({
    String? uesr,
    String? password,
  }) {
    return UesrModel(
      uesr: uesr ?? this.uesr,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uesr': uesr,
      'password': password,
    };
  }

  factory UesrModel.fromMap(Map<String, dynamic> map) {
    return UesrModel(
      uesr: map['uesr'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UesrModel.fromJson(String source) =>
      UesrModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UesrModel(uesr: $uesr, password: $password)';

  @override
  bool operator ==(covariant UesrModel other) {
    if (identical(this, other)) return true;

    return other.uesr == uesr && other.password == password;
  }

  @override
  int get hashCode => uesr.hashCode ^ password.hashCode;
}
