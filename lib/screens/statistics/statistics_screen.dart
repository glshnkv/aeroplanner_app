import 'package:aeroplanner_app/router/router.dart';
import 'package:aeroplanner_app/screens/statistics/tabs/largest_flight_tab.dart';
import 'package:aeroplanner_app/screens/statistics/tabs/spend_in_flight_tab.dart';
import 'package:aeroplanner_app/screens/statistics/tabs/visited_countries_tab.dart';
import 'package:aeroplanner_app/theme/colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.black,
        appBar: AppBar(
            toolbarHeight: 90,
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.white8,
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.router.push(HomeRoute());
                      },
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_ios, color: AppColors.yellow),
                          Text(
                            'Back',
                            style: TextStyle(
                              color: AppColors.yellow,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Flight statistics',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 50),
                  ],
                ),
                SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.white14,
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    indicatorColor: AppColors.yellow,
                    labelColor: AppColors.yellow,
                    unselectedLabelColor: AppColors.white40,
                    tabs: [
                      Tab(height: 30, text: 'Visited countries'),
                      Tab(height: 30, text: 'Spend in flight'),
                      Tab(height: 30, text: 'The largest flight took'),
                    ],
                  ),
                ),
              ],
            )
        ),
        body: TabBarView(
          children: [
            VisitedCountriesTab(),
            SpendInFlightTab(),
            LargestFlightTab(),
          ],
        ),
      ),
    );
  }
}
