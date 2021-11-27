class Volunteer {
  String id;
  String imageUrl;
  String location;
  String name;
  List<String> volunteerList;

  Volunteer({
    required this.id,
    required this.imageUrl,
    required this.location,
    required this.name,
    required this.volunteerList,
  });

  factory Volunteer.fromJson(Map<String, dynamic> json) {
    return Volunteer(
      id: json['id'] ?? String,
      imageUrl: json['imageUrl'] ?? String,
      location: json['location'] ?? String,
      name: json['name'] ?? String,
      volunteerList: json['volunteerList'].cast<String>() as List<String>,
    );
  }
}
