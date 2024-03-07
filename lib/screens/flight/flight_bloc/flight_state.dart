part of 'flight_bloc.dart';

@immutable
abstract class FlightState {}

class FlightInitial extends FlightState {}

class LoadedRecentFlightState extends FlightState {
  final FlightModel flight;

  LoadedRecentFlightState({required this.flight});
}

class LoadedAllFlightsState extends FlightState {
  final List<FlightModel> flights;

  LoadedAllFlightsState({required this.flights});
}

class NotFoundRecentFlightState extends FlightState {}

class EmptyFlightsListState extends FlightState {}
