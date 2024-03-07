import 'package:aeroplanner_app/models/flight_model.dart';
import 'package:aeroplanner_app/screens/flight/flight_details/widgets/details_card_widget.dart';
import 'package:aeroplanner_app/theme/colors.dart';
import 'package:aeroplanner_app/widgets/app_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FlightDetailsTab extends StatefulWidget {
  final FlightModel flight;

  const FlightDetailsTab({super.key, required this.flight});

  @override
  State<FlightDetailsTab> createState() => _FlightDetailsTabState();
}

class _FlightDetailsTabState extends State<FlightDetailsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Main flight',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 5),
              AppContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.flight.cityDeparture,
                          style: TextStyle(
                            color: AppColors.white40,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          widget.flight.countryDeparture,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: AppColors.yellow14,
                          borderRadius:
                          BorderRadius.all(Radius.circular(12.0))),
                      child: SvgPicture.asset(
                        'assets/images/elements/airplane.svg',
                        width: 30,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          widget.flight.cityArrival,
                          style: TextStyle(
                            color: AppColors.white40,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          widget.flight.countryArrival,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              DetailsCardWidget(
                  iconUrl: 'assets/images/elements/airplane-takeoff.svg',
                  type: 'Deprture',
                  time: widget.flight.timeDeparture,
                  date: widget.flight.dateDeparture,
                  airport: widget.flight.airportDeparture,
                  country: widget.flight.countryDeparture,
                  city: widget.flight.cityDeparture),
              SizedBox(height: 10),
              DetailsCardWidget(
                  iconUrl: 'assets/images/elements/airplane-landing.svg',
                  type: 'Arrival',
                  time: widget.flight.timeArrival,
                  date: widget.flight.dateArrival,
                  airport: widget.flight.airportArrival,
                  country: widget.flight.countryArrival,
                  city: widget.flight.cityArrival),
              SizedBox(height: 20),
              widget.flight.hasTransfer ? Column(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Transfer',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                DetailsCardWidget(
                    iconUrl: 'assets/images/elements/airplane-takeoff.svg',
                    type: 'Deprture',
                    time: widget.flight.timeOfDepartureTransfer,
                    date: widget.flight.dateOfDepartureTransfer,
                    airport: widget.flight.airportTransfer,
                    country: widget.flight.countryTransfer,
                    city: widget.flight.cityTransfer),
                SizedBox(height: 10),
                DetailsCardWidget(
                    iconUrl: 'assets/images/elements/airplane-landing.svg',
                    type: 'Arrival',
                    time: widget.flight.timeOfArrivalTransfer,
                    date: widget.flight.dateOfArrivalTransfer,
                    airport: widget.flight.airportTransfer,
                    country: widget.flight.countryTransfer,
                    city: widget.flight.cityTransfer),
              ],) : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
