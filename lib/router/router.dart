import 'package:aeroplanner_app/models/flight_model.dart';
import 'package:aeroplanner_app/screens/flight/add_flight/add_flight_screen.dart';
import 'package:aeroplanner_app/screens/flight/add_plan/add_plan_screen.dart';
import 'package:aeroplanner_app/screens/flight/flight_details/flight_details_screen.dart';
import 'package:aeroplanner_app/screens/flight/flights_list/flights_list_screen.dart';
import 'package:aeroplanner_app/screens/home/home_screen.dart';
import 'package:aeroplanner_app/screens/jet_lag_helper/jet_lag_calculator_screen.dart';
import 'package:aeroplanner_app/screens/onboarding/onboarding_screen.dart';
import 'package:aeroplanner_app/screens/settings/settings_screen.dart';
import 'package:aeroplanner_app/screens/statistics/statistics_screen.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: OnboardingRoute.page, initial: true),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: FlightsListRoute.page),
    AutoRoute(page: FlightDetailsRoute.page),
    AutoRoute(page: AddPlanRoute.page),
    AutoRoute(page: AddFlightRoute.page),
    AutoRoute(page: StatisticsRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: JetLagCalculatorRoute.page),
  ];
}