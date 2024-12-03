class NxtUser {
  final String? id;
  final String? authenticationType;
  final String? name;
  final String? username;
  final String? phone;
  final String? email;
  final String? gender;
  final String? avatar;
  final String? profile;
  final bool? isPhoneVerified;
  final bool? isProfileComplete;
  final bool? isEmailVerified;
  final bool? isWelcomed;
  final bool? forcedLogout;
  final String? language;

  NxtUser({
    required this.id,
    required this.authenticationType,
    required this.name,
    required this.username,
    required this.phone,
    required this.email,
    required this.gender,
    required this.avatar,
    required this.profile,
    required this.isPhoneVerified,
    required this.isProfileComplete,
    required this.isEmailVerified,
    required this.isWelcomed,
    required this.forcedLogout,
    required this.language,
  });

  factory NxtUser.fromJson(Map<String, dynamic> json) {
    return NxtUser(
      id: json['_id'],
      authenticationType: json['authenticationType'],
      name: json['name'],
      username: json['username'],
      phone: json['phone'],
      email: json['email'],
      gender: json['gender'],
      avatar: json['avatar'],
      profile: json['profile'],
      isPhoneVerified: json['isPhoneVerified'],
      isProfileComplete: json['isProfileComplete'],
      isEmailVerified: json['isEmailVerified'],
      isWelcomed: json['isWelcomed'],
      forcedLogout: json['forcedLogout'],
      language: json['language'],
    );
  }
}
