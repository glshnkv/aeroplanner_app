import 'dart:async';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'package:aeroplanner_app/services/shared_preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'jet_lag_event.dart';
part 'jet_lag_state.dart';

class JetLagBloc extends Bloc<JetLagEvent, JetLagState> {
  JetLagBloc() : super(JetLagInitial()) {
    on<GetTimeEvent>(_getTimeHandler);
    on<CalculateTimeEvent>(_calculateTimeHandler);
    on<SaveTimeEvent>(_saveTimeHandler);
    on<DeleteTimeEvent>(_deleteTimeHandler);
  }

  void _getTimeHandler(
      GetTimeEvent event, Emitter<JetLagState> emit) async {
    SharedPreferencesService storage =
    await SharedPreferencesService.getInstance();

    if (storage.time != '') {
      emit(LoadedTimeState(time: storage.time));
    } else {
      emit(NoJetLagDataState());
    }
  }

  void _calculateTimeHandler(
      CalculateTimeEvent event, Emitter<JetLagState> emit) async {
    SharedPreferencesService storage =
    await SharedPreferencesService.getInstance();

    storage.time = '${event.sleepTime.hour}:${event.sleepTime.minute}';
    emit(LoadedTimeState(time: storage.time));
  }

  void _saveTimeHandler(
      SaveTimeEvent event, Emitter<JetLagState> emit) async {
    SharedPreferencesService storage =
    await SharedPreferencesService.getInstance();

    storage.time = event.time;
  }

  void _deleteTimeHandler(
      DeleteTimeEvent event, Emitter<JetLagState> emit) async {
    SharedPreferencesService storage =
    await SharedPreferencesService.getInstance();

    storage.time = '';
  }
}

