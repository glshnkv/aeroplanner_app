part of 'statistics_bloc.dart';

@immutable
abstract class StatisticsState {}

class StatisticsInitial extends StatisticsState {}

class LoadedShortStatisticsState extends StatisticsState {
  final int countriesCount;
  final String timeSpend;
  final String lagestFlight;

  LoadedShortStatisticsState({required this.countriesCount, required this.timeSpend, required this.lagestFlight});

}

class LoadedVisitedCountriesListState extends StatisticsState {
  final List<String> visitedCountriesList;

  LoadedVisitedCountriesListState({required this.visitedCountriesList});
}

class LoadedSpendInFlightListState extends StatisticsState {
  final List<ShortFlightModel> spendInFlightList;

  LoadedSpendInFlightListState({required this.spendInFlightList});
}

class LoadedLargestFlightState extends StatisticsState {
  final ShortFlightModel largestFlight;

  LoadedLargestFlightState({required this.largestFlight});
}

class NoDataForStatisticsState extends StatisticsState {}

