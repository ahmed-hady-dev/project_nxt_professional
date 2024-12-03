import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  SharedPreferences preferences;
  PrefHelper(this.preferences);

  String kLandingImage = "landingImage";
  set landingImage(String value) => preferences.setString(kLandingImage, value);
  String get landingImage => preferences.getString(kLandingImage) ?? "";

  String kLogo = "logo";
  set logo(String? value) => preferences.setString(kLogo, value ?? "");
  String? get logo => preferences.getString(kLogo) ?? "";

  String kFirstTime = "firstTime";
  set firstTime(bool value) => preferences.setBool(kFirstTime, value ?? false);
  bool get firstTime => preferences.getBool(kFirstTime) ?? false;

  String kToken = "token";
  set token(String value) => preferences.setString(kToken, value ?? "");
  String get token => preferences.getString(kToken) ?? "";

  String kLocale = "locale";
  set locale(String value) => preferences.setString(kLocale, value ?? "");
  String get locale => preferences.getString(kLocale) ?? "";

  String kUserID = "userID";
  set userID(String value) => preferences.setString(kUserID, value ?? "");
  String get userID => preferences.getString(kUserID) ?? "";

  String kBanner = "banner";
  set banner(String? value) => preferences.setString(kBanner, value ?? "");
  String? get banner => preferences.getString(kBanner) ?? "";

  String kUsername = "username";
  set username(String value) => preferences.setString(kUsername, value);
  String get username => preferences.getString(kUsername) ?? "";

  void clearValues() {
    preferences.remove("token");
  }
}
