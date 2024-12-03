typedef TaskFields = List<TaskField>;

class TaskField {
  final String? id;
  final String type;
  final String title;
  final String placeholder;
  final bool isRequired;
  String? uploadMedia;

  TaskField({
    required this.id,
    required this.type,
    required this.title,
    required this.placeholder,
    required this.isRequired,
    this.uploadMedia,
  });

  factory TaskField.fromJson(Map<String, dynamic> json) {
    return TaskField(
      id: json['_id'],
      type: json['type'],
      title: json['title'],
      placeholder: json['placeholder'],
      isRequired: json['isRequired'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['value'] = uploadMedia;
    return data;
  }
}
