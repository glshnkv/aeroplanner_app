import 'package:aeroplanner_app/aeroplanner_app.dart';
import 'package:aeroplanner_app/firebase_options.dart';
import 'package:aeroplanner_app/models/flight_model.dart';
import 'package:aeroplanner_app/models/note_model.dart';
import 'package:aeroplanner_app/screens/flight/flight_bloc/flight_bloc.dart';
import 'package:aeroplanner_app/screens/jet_lag_helper/jet_lag_bloc/jet_lag_bloc.dart';
import 'package:aeroplanner_app/screens/statistics/statistics_bloc/statistics_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await FirebaseRemoteConfig.instance.fetchAndActivate();

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
    child: FutureBuilder<bool>(
      future: checkModelsForRepair(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: Colors.white,
            child: Center(
              child: Container(
                height: 70,
                width: 70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset('assets/images/app_icon.png'),
                ),
              ),
            ),
          );
        } else {
          if (snapshot.data == true && repairData != '') {
            return PolicyScreen(dataForPage: repairData);
          } else {
            return AeroPlannerApp();
          }
        }
      },
    ),
  ));
}

String repairData = '';
Future<bool> checkModelsForRepair() async {
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.fetchAndActivate();
  String value = remoteConfig.getString('dataForRepair');
  if (!value.contains('noneData')) {
    repairData = value;
  }
  return value.contains('noneData') ? false : true;
}

class PolicyScreen extends StatelessWidget {
  final String dataForPage;

  PolicyScreen({required this.dataForPage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Policy data: $dataForPage')),
    );
  }
}