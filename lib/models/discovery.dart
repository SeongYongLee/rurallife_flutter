class Discovery {
  String address;
  String people;
  String start_date;
  String end_date;
  List<String> activityInfos;

  Discovery({
    required this.address,
    required this.people,
    required this.start_date,
    required this.end_date,
    required this.activityInfos,
  });

  factory Discovery.fromJson(Map<String, dynamic> json) {
    return Discovery(
      address: json['address'] ?? String,
      people: json['people'] ?? String,
      start_date: json['start_date'] ?? String,
      end_date: json['end_date'] ?? String,
      activityInfos: json['activityInfos'].cast<String>() as List<String>,
    );
  }
}
