import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Devfest {
  static const String appName = "Devfest";
  static const String appVersion = "Version 1.0.4";
  static const int appVersionCode = 1;
  static const String appColor = "#ffd7167";
  static Color primaryAppColor = Colors.white;
  static Color secondaryAppColor = Colors.black;
  static const String googleSansFamily = "GoogleSans";
  static bool isDebugMode = false;

  // * Url related
  static String baseUrl = "https://storage.googleapis.com/gdg-devfest";

  static checkDebug() {
    assert(() {
      // baseUrl = "http://127.0.0.1:8000/gdg-devfest/";
      // * Change with your local url if any
      baseUrl = "https://storage.googleapis.com/gdg-devfest";
      isDebugMode = true;
      return true;
    }());
  }

  static bool get checkDebugBool {
    var debug = false;
    assert(debug = true);

    return debug;
  }

  //* Images
  static const String homeImg = "assets/images/home_img.jpeg";
  static const String bannerLight = "assets/images/banner_light.png";
  static const String bannerDark = "assets/images/banner_dark.png";

  //*  Texts
  static const String welcomeText = "GDG Ica DevFest";
  static const String descText =
      '''DevFest son eventos globales organizados por capítulos de GDG en todo el mundo, donde la comunidad de desarrolladores se reúne para aprender sobre las tecnologías de Google y fortalecer sus lazos.''';

  static const String loadingText = "Loading...";
  static const String tryAgainText = "Try Again";
  static const String someErrorText = "Some error";
  static const String signInText = "Sign In";
  static const String signInGoogleText = "Sign in with google";
  static const String signOutText = "Sign Out";
  static const String wrongText = "Something went wrong";
  static const String confirmText = "Confirm";
  static const String supportText = "Support Needed";
  static const String featureText = "Feature Request";
  static const String moreFeatureText = "More Features coming soon.";
  static const String updateNowText =
      "Please update your app for seamless experience.";
  static const String checkNetText =
      "It seems like your internet connection is not active.";

  //* ActionTexts
  static const String agendaText = "Agenda";
  static const String speakersText = "Speakers";
  static const String teamText = "Team";
  static const String sponsorText = "Sponsors";
  static const String faqText = "FAQ";
  static const String mapText = "Locate Us";

  //* Preferences
  static late SharedPreferences prefs;
  static const String loggedInPref = "loggedInPref1";
  static const String displayNamePref = "displayNamePref";
  static const String emailPref = "emailPref";
  static const String phonePref = "phonePref";
  static const String photoPref = "photoPref";
  static const String isAdminPref = "isAdminPref";
  static const String darkModePref = "darkModePref";

  //* JSON URLS
  static const String speakersAssetJson = "assets/json/speakers.json";
  static const String sessionsAssetJson = "assets/json/sessions.json";
  static const String teamsAssetJson = "assets/json/teams.json";
}
