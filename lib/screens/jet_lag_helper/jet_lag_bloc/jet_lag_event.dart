part of 'jet_lag_bloc.dart';

@immutable
abstract class JetLagEvent {}

class GetTimeEvent extends JetLagEvent {}

class CalculateTimeEvent extends JetLagEvent {
  final String countryArrival;
  final String countryDeparture;
  final DateTime sleepTime;

  CalculateTimeEvent(
      {required this.countryArrival,
      required this.countryDeparture,
      required this.sleepTime});
}

class SaveTimeEvent extends JetLagEvent {
  final String time;

  SaveTimeEvent({required this.time});
}


class DeleteTimeEvent extends JetLagEvent {}

