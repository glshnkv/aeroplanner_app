import 'dart:async';

import 'package:aeroplanner_app/models/flight_model.dart';
import 'package:aeroplanner_app/models/note_model.dart';
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

part 'flight_event.dart';

part 'flight_state.dart';

class FlightBloc extends Bloc<FlightEvent, FlightState> {
  FlightBloc() : super(FlightInitial()) {
    on<ShowRecentFlightEvent>(_showRecentFlightHandler);
    on<GetAllFlightsEvent>(_getAllFlightsHandler);
    on<AddFlightEvent>(_addFlightHandler);
    on<ClearFlightsEvent>(_clearFlightsHandler);
    on<AddPlanEvent>(_addPlanHandler);
  }

  void _showRecentFlightHandler(
      ShowRecentFlightEvent event, Emitter<FlightState> emit) async {
    List<FlightModel> flights = [];
    final flightBox = Hive.box('flights');
    if (flightBox.isNotEmpty) {
      for (int i = 0; i < flightBox.length; i++) {
        flights.add(flightBox.getAt(i));
      }
      flights = flights.reversed.toList();
      final FlightModel flight = flights[0];
      emit(LoadedRecentFlightState(flight: flight));
    } else {
      emit(NotFoundRecentFlightState());
    }
  }

  void _getAllFlightsHandler(
      GetAllFlightsEvent event, Emitter<FlightState> emit) async {
    List<FlightModel> flights = [];
    final flightBox = Hive.box('flights');
    if (flightBox.isNotEmpty) {
      for (int i = 0; i < flightBox.length; i++) {
        flights.add(flightBox.getAt(i));
      }
      emit(LoadedAllFlightsState(flights: flights.reversed.toList()));
    } else {
      emit(EmptyFlightsListState());
    }
  }

  void _addFlightHandler(
      AddFlightEvent event, Emitter<FlightState> emit) async {
    final flightBox = Hive.box('flights');
    flightBox.add(event.flight);
  }

  void _addPlanHandler(AddPlanEvent event, Emitter<FlightState> emit) async {
    List<FlightModel> flights = [];
    final flightBox = Hive.box('flights');
    if (flightBox.isNotEmpty) {
      for (int i = 0; i < flightBox.length; i++) {
        flights.add(flightBox.getAt(i));
      }
      final int replaceIndex = flights.indexOf(event.flight);
      event.flight.notes.add(event.note);
      flightBox.putAt(replaceIndex, event.flight);
    }
  }

  void _clearFlightsHandler(
      ClearFlightsEvent event, Emitter<FlightState> emit) async {
    final flightBox = Hive.box('flights');
    flightBox.clear();
  }
}
