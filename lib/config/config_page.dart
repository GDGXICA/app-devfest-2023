import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdgica/agenda/agenda_page.dart';
import 'package:gdgica/config/index.dart';
import 'package:gdgica/faq/faq_page.dart';
import 'package:gdgica/find_devfest/find_devfest_page.dart';
import 'package:gdgica/home/home_page.dart';
import 'package:gdgica/home/register_screen.dart';
import 'package:gdgica/map/map_page.dart';
import 'package:gdgica/speakers/speaker_page.dart';
import 'package:gdgica/sponsors/sponsor_page.dart';
import 'package:gdgica/team/team_page.dart';
import 'package:gdgica/utils/devfest.dart';

class ConfigPage extends StatefulWidget {
  static const String routeName = "/";
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  ConfigBloc? configBloc;

  @override
  void initState() {
    super.initState();
    setupApp();
  }

  setupApp() {
    configBloc = ConfigBloc();
    configBloc!.darkModeOn =
        Devfest.prefs.getBool(Devfest.darkModePref) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ConfigBloc(),
      child: BlocBuilder<ConfigBloc, ConfigState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Google Devfest',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              //* Custom Google Font
              fontFamily: Devfest.googleSansFamily,
              primarySwatch: Colors.red,
              primaryColor: configBloc!.darkModeOn ? Colors.black : Colors.white,
              disabledColor: Colors.grey,
              cardColor: configBloc!.darkModeOn ? Colors.black : Colors.white,
              canvasColor:
                  configBloc!.darkModeOn ? Colors.black : Colors.grey[50],
              brightness:
                  configBloc!.darkModeOn ? Brightness.dark : Brightness.light,
              buttonTheme: Theme.of(context).buttonTheme.copyWith(
                  colorScheme: configBloc!.darkModeOn
                      ? const ColorScheme.dark()
                      : const ColorScheme.light()),
              appBarTheme: const AppBarTheme(
                elevation: 0.0,
              ),
            ),
            home: HomePage(),
            routes: {
              HomePage.routeName: (context) => HomePage(),
              SpeakerPage.routeName: (context) => const SpeakerPage(),
              AgendaPage.routeName: (context) =>const AgendaPage(),
              SponsorPage.routeName: (context) => const SponsorPage(),
              TeamPage.routeName: (context) => const TeamPage(),
              FaqPage.routeName: (context) => const FaqPage(),
              FindDevFestPage.routeName: (context) => const FindDevFestPage(),
              MapPage.routeName: (context) => const MapPage(),
              RegisterScreen.routeName: (context) => const RegisterScreen(),
            },
          );
        },
      ),
    );
  }
}

