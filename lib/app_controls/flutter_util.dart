import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:json_path/json_path.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main.dart';
export 'package:page_transition/page_transition.dart';

T valueOrDefault<T>(T value, T defaultValue) =>
    (value is String && value.isEmpty) || value == null ? defaultValue : value;

Future launchURL(String url) async {
  var uri = Uri.parse(url).toString();
  try {
    await launch(uri);
  } catch (e) {
    throw 'Could not launch $uri: $e';
  }
}

dynamic getJsonField(dynamic response, String jsonPath) {
  final field = JsonPath(jsonPath).read(response);
  return field.isNotEmpty
      ? field.length > 1
          ? field.map((f) => f.value).toList()
          : field.first.value
      : null;
}

bool get isAndroid => !kIsWeb && Platform.isAndroid;
bool get isiOS => !kIsWeb && Platform.isIOS;
bool get isWeb => kIsWeb;
bool responsiveVisibility({
  @required BuildContext context,
  bool phone = true,
  bool tablet = true,
  bool tabletLandscape = true,
  bool desktop = true,
}) {
  final width = MediaQuery.of(context).size.width;
  if (width < 479) {
    return phone;
  } else if (width < 767) {
    return tablet;
  } else if (width < 991) {
    return tabletLandscape;
  } else {
    return desktop;
  }
}

void setAppLanguage(BuildContext context, String language) =>
    MyApp.of(context).setLocale(Locale(language, ''));

void setDarkModeSetting(BuildContext context, ThemeMode themeMode) =>
    MyApp.of(context).setThemeMode(themeMode);

