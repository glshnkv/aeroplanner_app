// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FlightModelAdapter extends TypeAdapter<FlightModel> {
  @override
  final int typeId = 0;

  @override
  FlightModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FlightModel(
      countryDeparture: fields[0] as String,
      cityDeparture: fields[1] as String,
      airportDeparture: fields[2] as String,
      dateDeparture: fields[3] as DateTime,
      timeDeparture: fields[4] as DateTime,
      countryArrival: fields[5] as String,
      cityArrival: fields[6] as String,
      airportArrival: fields[7] as String,
      dateArrival: fields[8] as DateTime,
      timeArrival: fields[9] as DateTime,
      hasTransfer: fields[18] as bool,
      countryTransfer: fields[10] as String?,
      cityTransfer: fields[11] as String?,
      airportTransfer: fields[12] as String?,
      dateOfDepartureTransfer: fields[13] as DateTime?,
      timeOfDepartureTransfer: fields[14] as DateTime?,
      dateOfArrivalTransfer: fields[15] as DateTime?,
      timeOfArrivalTransfer: fields[16] as DateTime?,
      notes: (fields[17] as List).cast<NoteModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, FlightModel obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.countryDeparture)
      ..writeByte(1)
      ..write(obj.cityDeparture)
      ..writeByte(2)
      ..write(obj.airportDeparture)
      ..writeByte(3)
      ..write(obj.dateDeparture)
      ..writeByte(4)
      ..write(obj.timeDeparture)
      ..writeByte(5)
      ..write(obj.countryArrival)
      ..writeByte(6)
      ..write(obj.cityArrival)
      ..writeByte(7)
      ..write(obj.airportArrival)
      ..writeByte(8)
      ..write(obj.dateArrival)
      ..writeByte(9)
      ..write(obj.timeArrival)
      ..writeByte(10)
      ..write(obj.countryTransfer)
      ..writeByte(11)
      ..write(obj.cityTransfer)
      ..writeByte(12)
      ..write(obj.airportTransfer)
      ..writeByte(13)
      ..write(obj.dateOfDepartureTransfer)
      ..writeByte(14)
      ..write(obj.timeOfDepartureTransfer)
      ..writeByte(15)
      ..write(obj.dateOfArrivalTransfer)
      ..writeByte(16)
      ..write(obj.timeOfArrivalTransfer)
      ..writeByte(17)
      ..write(obj.notes)
      ..writeByte(18)
      ..write(obj.hasTransfer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlightModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
