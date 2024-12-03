class SavedParams {
  final String id;
  final String type;

  SavedParams({
    required this.id,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reference'] = id;
    data['type'] = type;
    return data;
  }
}
