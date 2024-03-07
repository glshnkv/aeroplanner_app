import 'package:aeroplanner_app/models/flight_model.dart';
import 'package:aeroplanner_app/models/note_model.dart';
import 'package:aeroplanner_app/router/router.dart';
import 'package:aeroplanner_app/screens/flight/flight_bloc/flight_bloc.dart';
import 'package:aeroplanner_app/screens/jet_lag_helper/jet_lag_bloc/jet_lag_bloc.dart';
import 'package:aeroplanner_app/screens/statistics/statistics_bloc/statistics_bloc.dart';
import 'package:aeroplanner_app/theme/colors.dart';
import 'package:aeroplanner_app/widgets/action_button_widget.dart';
import 'package:aeroplanner_app/widgets/app_container.dart';
import 'package:aeroplanner_app/widgets/flight_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.gradientBackground,
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.router.push(SettingsRoute());
                      },
                      child: Text(
                        'Settings',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.yellow,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.router.push(AddFlightRoute());
                      },
                      child: Text(
                        'Add flight',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.yellow,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Your flight',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.white40,
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                BlocProvider(
                  create: (context) => JetLagBloc()..add(GetTimeEvent()),
                  child: BlocConsumer<JetLagBloc, JetLagState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is NoJetLagDataState) {
                        return AppContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Jet lag helper',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 210,
                                    child: Text(
                                      'Will help you to go bed in time for a better adaptation.',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: AppColors.white40,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  ActionButtonWidget(
                                      text: 'Start',
                                      width: 100,
                                      onTap: () {
                                        context.router
                                            .push(JetLagCalculatorRoute());
                                      }),
                                ],
                              ),
                            ],
                          ),
                        );
                      } else if (state is LoadedTimeState) {
                        return AppContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'To have to go to bed at:',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: AppColors.yellow14,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12.0))),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/images/elements/clock.svg'),
                                        SizedBox(width: 5),
                                        Text(
                                          state.time,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: AppColors.yellow,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ActionButtonWidget(
                                      text: 'Cancel',
                                      width: 100,
                                      onTap: () {
                                        context
                                            .read<JetLagBloc>()
                                            .add(DeleteTimeEvent());
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            backgroundColor: AppColors.yellow,
                                            content: Text(
                                              'Time deleted!',
                                              style: TextStyle(
                                                  color: AppColors.black),
                                            ),
                                          ),
                                        );
                                        context.router.push(HomeRoute());
                                      }),
                                ],
                              ),
                            ],
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                ),
                SizedBox(height: 20),
                BlocProvider(
                  create: (context) =>
                      FlightBloc()..add(ShowRecentFlightEvent()),
                  child: BlocConsumer<FlightBloc, FlightState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is LoadedRecentFlightState) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Recent flights',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context.router.push(FlightsListRoute());
                                  },
                                  child: Text(
                                    'All flights',
                                    style: TextStyle(
                                      color: AppColors.yellow,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            FlightCard(
                              cityDeparture: state.flight.cityDeparture,
                              countryDeparture: state.flight.countryDeparture,
                              timeDeparture: state.flight.timeDeparture,
                              cityArrival: state.flight.cityArrival,
                              countryArrival: state.flight.countryArrival,
                              timeArrival: state.flight.timeArrival,
                              onTap: () {
                                context.router.push(
                                    FlightDetailsRoute(flight: state.flight));
                              },
                            ),
                          ],
                        );
                      }
                      if (state is NotFoundRecentFlightState) {
                        return Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Recent flights',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              child: AppContainer(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: AppColors.yellow14,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0))),
                                      child: SvgPicture.asset(
                                          'assets/images/elements/alert.svg'),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'No added flight yet',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      'Tap add flight button below to necessary details about your first flight.',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: AppColors.white40,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                      return Container();
                    },
                  ),
                ),
                SizedBox(height: 20),
                BlocProvider(
                  create: (context) =>
                      StatisticsBloc()..add(GetShortStatisticsEvent()),
                  child: BlocConsumer<StatisticsBloc, StatisticsState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is LoadedShortStatisticsState) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Flight statistics',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context.router.push(StatisticsRoute());
                                  },
                                  child: Text(
                                    'Show',
                                    style: TextStyle(
                                      color: AppColors.yellow,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            AppContainer(
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: AppColors.yellow14,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12.0))),
                                    child: SvgPicture.asset(
                                        'assets/images/elements/airplane-marker.svg'),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Visited',
                                        style: TextStyle(
                                          color: AppColors.white40,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        '${state.countriesCount} countries',
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            AppContainer(
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: AppColors.yellow14,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12.0))),
                                    child: SvgPicture.asset(
                                        'assets/images/elements/clock.svg'),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Spend in flight',
                                        style: TextStyle(
                                          color: AppColors.white40,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        '${state.timeSpend}',
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            AppContainer(
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: AppColors.yellow14,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12.0))),
                                    child: SvgPicture.asset(
                                        'assets/images/elements/airplane-clock.svg'),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'The largest flight took',
                                        style: TextStyle(
                                          color: AppColors.white40,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        '${state.lagestFlight}',
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      } else if (state is NoDataForStatisticsState) {
                        return Column(
                          children: [
                            Text(
                              'Flight statistics',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10),
                            AppContainer(
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: AppColors.yellow14,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12.0))),
                                    child: SvgPicture.asset(
                                        'assets/images/elements/airplane-marker.svg'),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Visited',
                                        style: TextStyle(
                                          color: AppColors.white40,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        '0 countries',
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            AppContainer(
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: AppColors.yellow14,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12.0))),
                                    child: SvgPicture.asset(
                                        'assets/images/elements/clock.svg'),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Spend in flight',
                                        style: TextStyle(
                                          color: AppColors.white40,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        '0 hours',
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            AppContainer(
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: AppColors.yellow14,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12.0))),
                                    child: SvgPicture.asset(
                                        'assets/images/elements/airplane-clock.svg'),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'The largest flight took',
                                        style: TextStyle(
                                          color: AppColors.white40,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        '0 hours',
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }
                      return Container();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
