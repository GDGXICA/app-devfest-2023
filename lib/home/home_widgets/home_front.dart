import 'package:flutter/material.dart';
import 'dart:async';
import 'package:gdgica/agenda/agenda_page.dart';
import 'package:gdgica/config/index.dart';
import 'package:gdgica/faq/faq_page.dart';
import 'package:gdgica/home/register_screen.dart';
import 'package:gdgica/map/map_page.dart';
import 'package:gdgica/speakers/speaker_page.dart';
import 'package:gdgica/sponsors/sponsor_page.dart';
import 'package:gdgica/team/team_page.dart';
import 'package:gdgica/universal/image_card.dart';
import 'package:gdgica/utils/devfest.dart';
import 'package:gdgica/utils/tools.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeFront extends StatefulWidget {
  const HomeFront({super.key});

  @override
  HomeFrontState createState() => HomeFrontState();
}

class HomeFrontState extends State<HomeFront> {
  late Timer _timer;
  DateTime eventDate = DateTime(2024, 11, 23); // La fecha del evento

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {}); // Actualiza el estado del widget cada segundo
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancela el timer cuando el widget se destruye
    super.dispose();
  }

  Future<void> _launch(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  Widget dateCounter(context) {
    // Obtener la fecha y hora actual
    DateTime now = DateTime.now();
    // Calcular la diferencia entre la fecha del evento y la fecha actual
    Duration difference = eventDate.difference(now);

    // Obtener los días, horas, minutos y segundos de la diferencia
    int days = difference.inDays;
    int hours = difference.inHours %
        24; // Resto de las horas después de calcular los días
    int minutes = difference.inMinutes %
        60; // Resto de los minutos después de calcular las horas
    int seconds = difference.inSeconds %
        60; // Resto de los segundos después de calcular los minutos

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTimeContainer(days, 'días'),
        _buildTimeContainer(hours, 'Horas'),
        _buildTimeContainer(minutes, 'Minutos'),
        _buildTimeContainer(seconds, 'Segundos'),
      ],
    );
  }

  Widget _buildTimeContainer(int value, String label) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5), // Sombra sutil
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            '$value',
            style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ImageCard(
              img: ConfigBloc().darkModeOn
                  ? Devfest.bannerDark
                  : Devfest.bannerLight,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RegisterScreen.routeName);
              },
              child: const Text('Regístrate'),
            ),
            const SizedBox(
              height: 20,
            ),
            dateCounter(context),
            const SizedBox(
              height: 30,
            ),
            newActions(context),
            const SizedBox(
              height: 20,
            ),
            socialActions(context),
            const SizedBox(
              height: 20,
            ),
            const Text(
              Devfest.appVersion,
              // style: Theme.of(context).textTheme.bodySmall.copyWith(fontSize: 10),
            )
          ],
        ),
      ),
    );
  }

  Widget newActions(context) => Wrap(
        alignment: WrapAlignment.center,
        spacing: 20.0,
        runSpacing: 20.0,
        children: <Widget>[
          ActionCard(
            icon: Icons.schedule,
            color: Colors.red,
            title: Devfest.agendaText,
            onPressed: () => Navigator.pushNamed(context, AgendaPage.routeName),
          ),
          ActionCard(
            icon: Icons.person,
            color: Colors.green,
            title: Devfest.speakersText,
            onPressed: () =>
                Navigator.pushNamed(context, SpeakerPage.routeName),
          ),
          ActionCard(
            icon: Icons.people,
            color: Colors.amber,
            title: Devfest.teamText,
            onPressed: () => Navigator.pushNamed(context, TeamPage.routeName),
          ),
          ActionCard(
            icon: Icons.attach_money,
            color: Colors.purple,
            title: Devfest.sponsorText,
            onPressed: () =>
                Navigator.pushNamed(context, SponsorPage.routeName),
          ),
          ActionCard(
            icon: Icons.question_answer,
            color: Colors.brown,
            title: Devfest.faqText,
            onPressed: () => Navigator.pushNamed(context, FaqPage.routeName),
          ),
          ActionCard(
            icon: Icons.map,
            color: Colors.blue,
            title: Devfest.mapText,
            onPressed: () => Navigator.pushNamed(context, MapPage.routeName),
          )
        ],
      );

  Widget socialActions(context) => FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(FontAwesomeIcons.twitter),
              onPressed: () {
                Uri twitterUrl = Uri.parse('https://twitter.com/GDGICA');
                _launch(twitterUrl);
              },
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.linkedinIn),
              onPressed: () {
                Uri linkedinUrl =
                    Uri.parse('https://www.linkedin.com/company/gdg-ica/');
                _launch(linkedinUrl);
              },
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.youtube),
              onPressed: () {
                Uri youtubeUrl = Uri.parse('https://www.youtube.com/@GDGICA');
                _launch(youtubeUrl);
              },
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.facebook),
              onPressed: () {
                Uri facebookUrl = Uri.parse('https://www.facebook.com/gdgica');
                _launch(facebookUrl);
              },
            ),
          ],
        ),
      );
}

class ActionCard extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData? icon;
  final String? title;
  final Color? color;

  const ActionCard(
      {super.key, this.onPressed, this.icon, this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onPressed,
      child: Ink(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
          color: ConfigBloc().darkModeOn
              ? Tools.hexToColor("#1f2124")
              : Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: !ConfigBloc().darkModeOn
              ? [
                  BoxShadow(
                    // color: Colors.grey[200],
                    color: (Colors.grey[200])!,
                    blurRadius: 10,
                    spreadRadius: 5,
                  )
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: color,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title!,
              // style: Theme.of(context).textTheme.title.copyWith(
              //       fontSize: 12,
              //     ),
            ),
          ],
        ),
      ),
    );
  }
}
