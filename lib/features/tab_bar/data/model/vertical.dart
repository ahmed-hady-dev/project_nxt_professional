typedef Verticals = List<Vertical>;

class Vertical {
  // TODO: Change from nullable
  final String? id;
  final String name;
  final String color;

  Vertical({required this.id, required this.name, required this.color});

  factory Vertical.fromJson(Map<String, dynamic> json) {
    return Vertical(
      id: json['_id'],
      name: json['name'],
      color: json['hexColor'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'color': color,
    };
  }
}
