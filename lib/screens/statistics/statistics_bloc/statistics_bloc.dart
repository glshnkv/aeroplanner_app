import 'dart:async';

import 'package:aeroplanner_app/models/flight_model.dart';
import 'package:aeroplanner_app/screens/statistics/models/short_flight_model.dart';
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'statistics_event.dart';

part 'statistics_state.dart';

class StatisticsBloc extends Bloc<StatisticsEvent, StatisticsState> {
  StatisticsBloc() : super(StatisticsInitial()) {
    on<GetShortStatisticsEvent>(_getShortStatisticsHandler);
    on<GetVisitedCountriesListEvent>(_getVisitedCountriesListHandler);
    on<GetSpendInFlightListEvent>(_getSpendInFlightListHandler);
    on<GetLargestFlightEvent>(_getLargestFlightHandler);
  }

  void _getShortStatisticsHandler(
      GetShortStatisticsEvent event, Emitter<StatisticsState> emit) async {
    final flightBox = Hive.box('flights');

    List<FlightModel> flights = [];

    Set<String> visitedCountries = {};
    Duration spendInFlight = Duration(milliseconds: 0);

    int maxHours = -1;
    int maxMinutes = -1;

    if (flightBox.isNotEmpty) {
      for (int i = 0; i < flightBox.length; i++) {
        flights.add(flightBox.getAt(i));
      }

      for (int i = 0; i < flights.length; i++) {
        visitedCountries
            .add('${flights[i].countryDeparture}, ${flights[i].cityDeparture}');
        visitedCountries
            .add('${flights[i].countryArrival}, ${flights[i].cityArrival}');
        if (flights[i].hasTransfer) {
          visitedCountries
              .add('${flights[i].countryTransfer}, ${flights[i].cityTransfer}');
        }
        Duration spendTime = flights[i].timeArrival.difference(flights[i].timeDeparture);

        int hours = spendTime.inHours % 24;
        int minutes = spendTime.inMinutes % 60;

        if (hours == maxHours && minutes >= maxMinutes) {
          maxHours = hours;
          maxMinutes = minutes;
        } else if (hours > maxHours) {
          maxHours = hours;
          maxMinutes = minutes;
        }
        spendInFlight +=
            flights[i].timeArrival.difference(flights[i].timeDeparture);
      }
      int hoursOfspendInFlight = spendInFlight.inHours % 24;
      int minutesOfspendInFlight = spendInFlight.inMinutes % 60;

      emit(LoadedShortStatisticsState(
          countriesCount: visitedCountries.length,
          timeSpend: '${hoursOfspendInFlight}h ${minutesOfspendInFlight}min',
          lagestFlight:
              '${maxHours}h ${maxMinutes}min'));
    } else {
      emit(NoDataForStatisticsState());
    }
  }

  void _getVisitedCountriesListHandler(
      GetVisitedCountriesListEvent event, Emitter<StatisticsState> emit) async {
    final flightBox = Hive.box('flights');

    List<FlightModel> flights = [];

    Set<String> visitedCountries = {};

    if (flightBox.isNotEmpty) {
      for (int i = 0; i < flightBox.length; i++) {
        flights.add(flightBox.getAt(i));
      }

      for (int i = 0; i < flights.length; i++) {
        visitedCountries
            .add('${flights[i].countryDeparture}, ${flights[i].cityDeparture}');
        visitedCountries
            .add('${flights[i].countryArrival}, ${flights[i].cityArrival}');
        if (flights[i].hasTransfer) {
          visitedCountries
              .add('${flights[i].countryTransfer}, ${flights[i].cityTransfer}');
        }
      }
      emit(LoadedVisitedCountriesListState(
          visitedCountriesList: visitedCountries.toList()));
    } else {
      emit(NoDataForStatisticsState());
    }
  }

  void _getSpendInFlightListHandler(
      GetSpendInFlightListEvent event, Emitter<StatisticsState> emit) async {
    final flightBox = Hive.box('flights');

    List<FlightModel> flights = [];

    List<ShortFlightModel> spendInFlightList = [];

    if (flightBox.isNotEmpty) {
      for (int i = 0; i < flightBox.length; i++) {
        flights.add(flightBox.getAt(i));
      }

      for (int i = 0; i < flights.length; i++) {
        Duration spendInFlight =
            flights[i].timeArrival.difference(flights[i].timeDeparture);

        int hours = spendInFlight.inHours % 24;
        int minutes = spendInFlight.inMinutes % 60;

        spendInFlightList.add(ShortFlightModel(
            countryDeparture: flights[i].countryDeparture,
            countryArrival: flights[i].countryArrival,
            flightDuration: '${hours}h ${minutes}min'));
      }
      emit(LoadedSpendInFlightListState(spendInFlightList: spendInFlightList));
    } else {
      emit(NoDataForStatisticsState());
    }
  }

  void _getLargestFlightHandler(
      GetLargestFlightEvent event, Emitter<StatisticsState> emit) async {
    final flightBox = Hive.box('flights');

    List<FlightModel> flights = [];

    Duration largestFlightDuration = Duration(milliseconds: 0);
    ShortFlightModel largestFlight = ShortFlightModel(
        countryDeparture: '',
        countryArrival: '',
        flightDuration: '');

    int maxHours = -1;
    int maxMinutes = -1;

    if (flightBox.isNotEmpty) {
      for (int i = 0; i < flightBox.length; i++) {
        flights.add(flightBox.getAt(i));
      }

      for (int i = 0; i < flights.length; i++) {
        Duration spendInFlight =
        flights[i].timeArrival.difference(flights[i].timeDeparture);

        int hours = spendInFlight.inHours % 24;
        int minutes = spendInFlight.inMinutes % 60;

        if (hours == maxHours && minutes >= maxMinutes) {
          largestFlight = ShortFlightModel(
              countryDeparture: flights[i].countryDeparture,
              countryArrival: flights[i].countryArrival,
              flightDuration: '${hours}h ${minutes}min');
          maxHours = hours;
          maxMinutes = minutes;
        } else if (hours > maxHours) {
          largestFlight = ShortFlightModel(
              countryDeparture: flights[i].countryDeparture,
              countryArrival: flights[i].countryArrival,
              flightDuration: '${hours}h ${minutes}min');
          maxHours = hours;
          maxMinutes = minutes;
        }
      }
      emit(LoadedLargestFlightState(largestFlight: largestFlight));
    } else {
      emit(NoDataForStatisticsState());
    }
  }
}
