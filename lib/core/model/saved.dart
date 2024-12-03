class Saved {
  final bool isSaved;

  Saved({required this.isSaved});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isSaved'] = isSaved;
    return data;
  }

  factory Saved.fromJson(Map<String, dynamic> json) {
    return Saved(
      isSaved: json['saved'],
    );
  }
}
