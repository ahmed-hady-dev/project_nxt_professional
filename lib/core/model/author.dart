class Author {
  final String id;
  final String name;
  final String avatar;
  Author({required this.id, required this.name, required this.avatar});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(id: json['_id'], name: json['name'], avatar: json['avatar']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'avatar': avatar};
  }
}
