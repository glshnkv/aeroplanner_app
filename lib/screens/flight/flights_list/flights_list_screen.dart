import 'package:aeroplanner_app/router/router.dart';
import 'package:aeroplanner_app/screens/flight/flight_bloc/flight_bloc.dart';
import 'package:aeroplanner_app/theme/colors.dart';
import 'package:aeroplanner_app/widgets/flight_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class FlightsListScreen extends StatefulWidget {
  const FlightsListScreen({super.key});

  @override
  State<FlightsListScreen> createState() => _FlightsListScreenState();
}

class _FlightsListScreenState extends State<FlightsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 125,
        backgroundColor: AppColors.white8,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GestureDetector(
            onTap: () {
              context.router.push(HomeRoute());
            },
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios, color: AppColors.yellow),
                Text(
                  'Your flight',
                  style: TextStyle(
                    color: AppColors.yellow,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        title: Text(
          'All flights',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => FlightBloc()..add(GetAllFlightsEvent()),
        child: BlocConsumer<FlightBloc, FlightState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is LoadedAllFlightsState) {
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    itemCount: state.flights.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(height: 15),
                    itemBuilder: (BuildContext context, int index) {
                      final flight = state.flights[index];
                      return FlightCard(
                          cityDeparture: flight.cityDeparture,
                          countryDeparture: flight.countryDeparture,
                          timeDeparture: flight.timeDeparture,
                          cityArrival: flight.cityArrival,
                          countryArrival: flight.countryArrival,
                          timeArrival: flight.timeArrival,
                          onTap: () {
                            context.router.push(FlightDetailsRoute(flight: flight));
                          });
                    },
                  ),
                ),
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
