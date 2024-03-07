import 'package:aeroplanner_app/aeroplanner_app.dart';
import 'package:aeroplanner_app/models/flight_model.dart';
import 'package:aeroplanner_app/models/note_model.dart';
import 'package:aeroplanner_app/screens/flight/flight_bloc/flight_bloc.dart';
import 'package:aeroplanner_app/screens/jet_lag_helper/jet_lag_bloc/jet_lag_bloc.dart';
import 'package:aeroplanner_app/screens/statistics/statistics_bloc/statistics_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(FlightModelAdapter());
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox('flights');


  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<FlightBloc>(
          create: (context) => FlightBloc()),
      BlocProvider<StatisticsBloc>(
          create: (context) => StatisticsBloc()),
      BlocProvider<JetLagBloc>(
          create: (context) => JetLagBloc()),
    ],
    child: AeroPlannerApp(),
  ));
}
