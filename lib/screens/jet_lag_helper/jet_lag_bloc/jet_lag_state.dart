part of 'jet_lag_bloc.dart';

@immutable
abstract class JetLagState {}

class JetLagInitial extends JetLagState {}

class LoadedTimeState extends JetLagState {
  final String time;

  LoadedTimeState({required this.time});
}

class NoJetLagDataState extends JetLagState {}
