class ConfigData {
  final String id;
  final Template template;

  ConfigData({
    required this.id,
    required this.template,
  });

  factory ConfigData.fromJson(Map<String, dynamic> json) {
    return ConfigData(
      id: json['_id'],
      template: Template.fromJson(json['template']),
    );
  }
}

class Template {
  final String? landingPage;
  final List<String> sponsoredLogos;
  final String? banner;
  Template(
      {required this.landingPage,
      required this.sponsoredLogos,
      required this.banner});

  factory Template.fromJson(Map<String, dynamic> json) {
    return Template(
      landingPage: json['landingPage'],
      sponsoredLogos: List<String>.from(json['sponsoredLogos']),
      banner: json['banners']['home'],
    );
  }
}
