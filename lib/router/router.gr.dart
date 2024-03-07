// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddFlightRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddFlightScreen(),
      );
    },
    AddPlanRoute.name: (routeData) {
      final args = routeData.argsAs<AddPlanRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddPlanScreen(
          key: args.key,
          flight: args.flight,
        ),
      );
    },
    FlightDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<FlightDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FlightDetailsScreen(
          key: args.key,
          flight: args.flight,
        ),
      );
    },
    FlightsListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FlightsListScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    JetLagCalculatorRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const JetLagCalculatorScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    StatisticsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StatisticsScreen(),
      );
    },
  };
}

/// generated route for
/// [AddFlightScreen]
class AddFlightRoute extends PageRouteInfo<void> {
  const AddFlightRoute({List<PageRouteInfo>? children})
      : super(
          AddFlightRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddFlightRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddPlanScreen]
class AddPlanRoute extends PageRouteInfo<AddPlanRouteArgs> {
  AddPlanRoute({
    Key? key,
    required FlightModel flight,
    List<PageRouteInfo>? children,
  }) : super(
          AddPlanRoute.name,
          args: AddPlanRouteArgs(
            key: key,
            flight: flight,
          ),
          initialChildren: children,
        );

  static const String name = 'AddPlanRoute';

  static const PageInfo<AddPlanRouteArgs> page =
      PageInfo<AddPlanRouteArgs>(name);
}

class AddPlanRouteArgs {
  const AddPlanRouteArgs({
    this.key,
    required this.flight,
  });

  final Key? key;

  final FlightModel flight;

  @override
  String toString() {
    return 'AddPlanRouteArgs{key: $key, flight: $flight}';
  }
}

/// generated route for
/// [FlightDetailsScreen]
class FlightDetailsRoute extends PageRouteInfo<FlightDetailsRouteArgs> {
  FlightDetailsRoute({
    Key? key,
    required FlightModel flight,
    List<PageRouteInfo>? children,
  }) : super(
          FlightDetailsRoute.name,
          args: FlightDetailsRouteArgs(
            key: key,
            flight: flight,
          ),
          initialChildren: children,
        );

  static const String name = 'FlightDetailsRoute';

  static const PageInfo<FlightDetailsRouteArgs> page =
      PageInfo<FlightDetailsRouteArgs>(name);
}

class FlightDetailsRouteArgs {
  const FlightDetailsRouteArgs({
    this.key,
    required this.flight,
  });

  final Key? key;

  final FlightModel flight;

  @override
  String toString() {
    return 'FlightDetailsRouteArgs{key: $key, flight: $flight}';
  }
}

/// generated route for
/// [FlightsListScreen]
class FlightsListRoute extends PageRouteInfo<void> {
  const FlightsListRoute({List<PageRouteInfo>? children})
      : super(
          FlightsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'FlightsListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [JetLagCalculatorScreen]
class JetLagCalculatorRoute extends PageRouteInfo<void> {
  const JetLagCalculatorRoute({List<PageRouteInfo>? children})
      : super(
          JetLagCalculatorRoute.name,
          initialChildren: children,
        );

  static const String name = 'JetLagCalculatorRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StatisticsScreen]
class StatisticsRoute extends PageRouteInfo<void> {
  const StatisticsRoute({List<PageRouteInfo>? children})
      : super(
          StatisticsRoute.name,
          initialChildren: children,
        );

  static const String name = 'StatisticsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
