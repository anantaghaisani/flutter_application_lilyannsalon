import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';
@JsonSerializable()
class UserData {
  final int idCustomer;
  final String email;
  final String noTelp;
  final String namaLengkap;
  final String password;
  final String pertanyaan;
  final String jawaban;

  UserData({
    required this.idCustomer,
    required this.email,
    required this.noTelp,
    required this.namaLengkap,
    required this.password,
    required this.pertanyaan,
    required this.jawaban,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}