part of 'flight_bloc.dart';

@immutable
abstract class FlightEvent {}

class ShowRecentFlightEvent extends FlightEvent {}

class GetAllFlightsEvent extends FlightEvent {}

class AddFlightEvent extends FlightEvent {
  final FlightModel flight;

  AddFlightEvent({required this.flight});
}

class ClearFlightsEvent extends FlightEvent {}

class AddPlanEvent extends FlightEvent {
  final FlightModel flight;
  final NoteModel note;

  AddPlanEvent({required this.flight, required this.note});

}




