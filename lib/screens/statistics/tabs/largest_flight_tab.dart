import 'package:aeroplanner_app/screens/statistics/statistics_bloc/statistics_bloc.dart';
import 'package:aeroplanner_app/theme/colors.dart';
import 'package:aeroplanner_app/widgets/app_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LargestFlightTab extends StatefulWidget {
  const LargestFlightTab({super.key});

  @override
  State<LargestFlightTab> createState() => _LargestFlightTabState();
}

class _LargestFlightTabState extends State<LargestFlightTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'The largest flight took',
                style: TextStyle(
                  color: AppColors.white40,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 15),
              BlocProvider(
                create: (context) =>
                StatisticsBloc()..add(GetLargestFlightEvent()),
                child: BlocConsumer<StatisticsBloc, StatisticsState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is LoadedLargestFlightState) {
                      return AppContainer(
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: AppColors.yellow14,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(12.0))),
                              child: SvgPicture.asset(
                                  'assets/images/elements/airplane.svg'),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${state.largestFlight.flightDuration}',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  '${state.largestFlight.countryDeparture} - ${state.largestFlight.countryArrival}',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
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
            ],
          ),
        ),
      ),
    );  }
}
