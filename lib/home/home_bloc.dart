import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gdgica/home/index.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static final HomeBloc _homeBlocSingleton = HomeBloc._internal();

  factory HomeBloc() {
    return _homeBlocSingleton;
  }

  HomeBloc._internal() : super(UnHomeState()) {
    on<LoadHomeEvent>(
        _onLoadHomeEvent); // Registra el manejador para el evento LoadHomeEvent
  }

  Future<void> _onLoadHomeEvent(
      LoadHomeEvent event, Emitter<HomeState> emit) async {
    emit(UnHomeState());
    try {
      final newState = await event.applyAsync(currentState: state, bloc: this);
      emit(newState);
    } catch (error) {
      emit(ErrorHomeState(error.toString()));
    }
  }
}
