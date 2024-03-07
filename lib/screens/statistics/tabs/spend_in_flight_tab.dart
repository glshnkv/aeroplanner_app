import 'package:aeroplanner_app/screens/statistics/statistics_bloc/statistics_bloc.dart';
import 'package:aeroplanner_app/theme/colors.dart';
import 'package:aeroplanner_app/widgets/app_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpendInFlightTab extends StatefulWidget {
  const SpendInFlightTab({super.key});

  @override
  State<SpendInFlightTab> createState() => _SpendInFlightTabState();
}

class _SpendInFlightTabState extends State<SpendInFlightTab> {
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
                'Spend in flight',
                style: TextStyle(
                  color: AppColors.white40,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              BlocProvider(
                create: (context) =>
                StatisticsBloc()..add(GetSpendInFlightListEvent()),
                child: BlocConsumer<StatisticsBloc, StatisticsState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is LoadedSpendInFlightListState) {
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(vertical: 16),
                        itemCount: state.spendInFlightList.length,
                        separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(height: 15),
                        itemBuilder: (BuildContext context, int index) {
                          final spendInFlightItem =
                          state.spendInFlightList[index];
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
                                     '${spendInFlightItem.flightDuration}',
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      '${spendInFlightItem.countryDeparture} - ${spendInFlightItem.countryArrival}',
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
                        },
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
    );
  }
}
