part of 'statistics_bloc.dart';

@immutable
abstract class StatisticsEvent {}

class GetShortStatisticsEvent extends StatisticsEvent {}

class GetVisitedCountriesListEvent extends StatisticsEvent {}

class GetSpendInFlightListEvent extends StatisticsEvent {}

class GetLargestFlightEvent extends StatisticsEvent {}


