class ApiResponse<T> {
  T data;
  Maintenance? maintenance;
  String? errorMessage;

  ApiResponse({
    required this.data,
    required this.maintenance,
    required this.errorMessage,
  });

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return ApiResponse(
      data: fromJsonT(json),
      maintenance: json['maintenance'] != null
          ? Maintenance.fromJson(json['maintenance'])
          : null,
      errorMessage: json['message'],
    );
  }
}

class Maintenance {
  final bool enabled;
  final String message;

  Maintenance({required this.enabled, required this.message});

  factory Maintenance.fromJson(Map<String, dynamic> json) {
    return Maintenance(
      enabled: json['enabled'],
      message: json['message'],
    );
  }
}
