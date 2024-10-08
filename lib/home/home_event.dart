import 'dart:async';
import 'package:gdgica/home/home_provider.dart';
import 'package:gdgica/home/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeEvent {}

class LoadHomeEvent extends HomeEvent {
  final IHomeProvider _homeProvider = HomeProvider();

  @override
  String toString() => 'LoadHomeEvent';

  Future<HomeState> applyAsync(
      {HomeState? currentState, HomeBloc? bloc}) async {
    try {
      var speakersData = await _homeProvider.getSpeakers();
      var sessionsData = await _homeProvider.getSessions();
      var teamsData = await _homeProvider.getTeams();
      return InHomeState(
        speakersData: speakersData,
        sessionsData: sessionsData,
        teamsData: teamsData,
      );
    } catch (error) {
      return ErrorHomeState(error.toString());
    }
  }
}
