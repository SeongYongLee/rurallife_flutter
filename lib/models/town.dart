class Town {
  String id;
  String image_url;
  String image_detail_url;
  String address_do;
  String address;
  String contact;
  String name;
  String description;
  String start_date;
  String end_date;
  List<String> roomOptions;
  List<String> categorys;
  List<String> activityInfos;

  Town({
    required this.id,
    required this.image_url,
    required this.image_detail_url,
    required this.address_do,
    required this.address,
    required this.contact,
    required this.name,
    required this.description,
    required this.start_date,
    required this.end_date,
    required this.roomOptions,
    required this.categorys,
    required this.activityInfos,
  });

  factory Town.fromJson(Map<String, dynamic> json) {
    return Town(
      id: json['id'] ?? String,
      image_url: json['image_url'] ?? String,
      image_detail_url: json['image_detail_url'] ?? String,
      address_do: json['address_do'] ?? String,
      address: json['address'] ?? String,
      contact: json['contact'] ?? String,
      name: json['name'] ?? String,
      description: json['description'] ?? String,
      start_date: json['start_date'] ?? String,
      end_date: json['end_date'] ?? String,
      roomOptions: json['roomOptions'].cast<String>() as List<String>,
      categorys: json['categorys'].cast<String>() as List<String>,
      activityInfos: json['activityInfos'].cast<String>() as List<String>,
    );
  }
}
