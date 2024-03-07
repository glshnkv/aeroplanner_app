import 'package:aeroplanner_app/models/note_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'flight_model.g.dart';

@HiveType(typeId: 0)
class FlightModel {
  @HiveField(0)
  final String countryDeparture;
  @HiveField(1)
  final String cityDeparture;
  @HiveField(2)
  final String airportDeparture;
  @HiveField(3)
  final DateTime dateDeparture;
  @HiveField(4)
  final DateTime timeDeparture;
  @HiveField(5)
  final String countryArrival;
  @HiveField(6)
  final String cityArrival;
  @HiveField(7)
  final String airportArrival;
  @HiveField(8)
  final DateTime dateArrival;
  @HiveField(9)
  final DateTime timeArrival;
  @HiveField(10)
  final String? countryTransfer;
  @HiveField(11)
  final String? cityTransfer;
  @HiveField(12)
  final String? airportTransfer;
  @HiveField(13)
  final DateTime? dateOfDepartureTransfer;
  @HiveField(14)
  final DateTime? timeOfDepartureTransfer;
  @HiveField(15)
  final DateTime? dateOfArrivalTransfer;
  @HiveField(16)
  final DateTime? timeOfArrivalTransfer;
  @HiveField(17)
  List<NoteModel> notes;
  @HiveField(18)
  final bool hasTransfer;

  FlightModel({
    required this.countryDeparture,
    required this.cityDeparture,
    required this.airportDeparture,
    required this.dateDeparture,
    required this.timeDeparture,
    required this.countryArrival,
    required this.cityArrival,
    required this.airportArrival,
    required this.dateArrival,
    required this.timeArrival,
    required this.hasTransfer,
    this.countryTransfer,
    this.cityTransfer,
    this.airportTransfer,
    this.dateOfDepartureTransfer,
    this.timeOfDepartureTransfer,
    this.dateOfArrivalTransfer,
    this.timeOfArrivalTransfer,
    required this.notes,
  });
}