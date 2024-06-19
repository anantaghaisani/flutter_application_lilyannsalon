class UserData {
  final String id;
  final String email;
  final String name;
  final String nomor_hp;
  
  UserData({
    required this.id,
    required this.email,
    required this.name,
    required this.nomor_hp,
  });

  // Factory method untuk mengonversi data JSON menjadi objek UserData
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      // id: int.parse(json['id']),  // Convert the id from string to int
      id: json['id'] ?? "",
      email: json['email'] ?? "",
      name: json['name'] ?? "",
      nomor_hp: json['nomor_hp'] ?? "",
    );
  }

  // Metode untuk mengonversi objek UserData menjadi format JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'nomor_hp': nomor_hp,
    };
  }
}