class Volunteer {
  String name;
  String birth;
  String tel;
  List<String> prefers;

  Volunteer({
    required this.name,
    required this.birth,
    required this.tel,
    required this.prefers,
  });

  factory Volunteer.fromJson(Map<String, dynamic> json) {
    return Volunteer(
      name: json['name'] ?? String,
      birth: json['birth'] ?? String,
      tel: json['tel'] ?? String,
      prefers: json['prefers'].cast<String>() as List<String>,
    );
  }
}
