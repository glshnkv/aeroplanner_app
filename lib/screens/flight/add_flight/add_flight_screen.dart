import 'package:aeroplanner_app/models/flight_model.dart';
import 'package:aeroplanner_app/router/router.dart';
import 'package:aeroplanner_app/screens/flight/flight_bloc/flight_bloc.dart';
import 'package:aeroplanner_app/theme/colors.dart';
import 'package:aeroplanner_app/widgets/action_button_widget.dart';
import 'package:aeroplanner_app/widgets/textfield_app_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class AddFlightScreen extends StatefulWidget {
  const AddFlightScreen({super.key});

  @override
  State<AddFlightScreen> createState() => _AddFlightScreenState();
}

class _AddFlightScreenState extends State<AddFlightScreen> {
  String subtitle = 'Departure';

  DateTime _dateDeparture = DateTime.now();
  DateTime _timeDeparture = DateTime.now();

  DateTime _dateArrival = DateTime.now();
  DateTime _timeArrival = DateTime.now();

  DateTime _dateOfDepartureTransfer = DateTime.now();
  DateTime _timeOfDepartureTransfer = DateTime.now();
  DateTime _dateOfArrivalTransfer = DateTime.now();
  DateTime _timeOfArrivalTransfer = DateTime.now();

  final pageController = PageController();

  final countryDepartureController = TextEditingController();
  final cityDepartureController = TextEditingController();
  final airportDepartureController = TextEditingController();
  final dateDepartureController = TextEditingController();
  final timeDepartureController = TextEditingController();

  final countryArrivalController = TextEditingController();
  final cityArrivalController = TextEditingController();
  final airportArrivalController = TextEditingController();
  final dateArrivalController = TextEditingController();
  final timeArrivalController = TextEditingController();

  final countryTransferController = TextEditingController();
  final cityTransferController = TextEditingController();
  final airportTransferController = TextEditingController();
  final dateOfDepartureTransferController = TextEditingController();
  final timeOfDepartureTransferController = TextEditingController();
  final dateOfArrivalTransferController = TextEditingController();
  final timeOfArrivalTransferController = TextEditingController();

  @override
  void dispose() {
    pageController.dispose();
    countryDepartureController.dispose();
    cityDepartureController.dispose();
    airportDepartureController.dispose();
    dateDepartureController.dispose();
    timeDepartureController.dispose();
    countryArrivalController.dispose();
    cityArrivalController.dispose();
    airportArrivalController.dispose();
    dateArrivalController.dispose();
    timeArrivalController.dispose();
    countryTransferController.dispose();
    cityTransferController.dispose();
    airportTransferController.dispose();
    dateOfDepartureTransferController.dispose();
    timeOfDepartureTransferController.dispose();
    dateOfArrivalTransferController.dispose();
    timeOfArrivalTransferController.dispose();
    super.dispose();
  }

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
        ),
        title: Column(
          children: [
            Text(
              'New flight',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                color: AppColors.white40,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: SizedBox(
        child: PageView(
          onPageChanged: (index) {
            setState(() {
              switch (index) {
                case 0:
                  subtitle = 'Departure';
                case 1:
                  subtitle = 'Arrival';
                case 2:
                  subtitle = 'Transfer';
                case 3:
                  subtitle = 'Transfer';
              }
            });
          },
          controller: pageController,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Departure from origin',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFieldAppWidget(
                      controller: countryDepartureController,
                      hintText: 'Country of departure'),
                  SizedBox(height: 10),
                  TextFieldAppWidget(
                      controller: cityDepartureController,
                      hintText: 'City of departure'),
                  SizedBox(height: 10),
                  TextFieldAppWidget(
                      controller: airportDepartureController,
                      hintText: 'Airport name'),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 195,
                        child: TextField(
                          readOnly: true,
                          onTap: () {
                            _showDialog(CupertinoDatePicker(
                              initialDateTime: _dateDeparture,
                              mode: CupertinoDatePickerMode.date,
                              use24hFormat: true,
                              showDayOfWeek: true,
                              onDateTimeChanged: (DateTime newDate) {
                                setState(() {
                                  dateDepartureController.text =
                                      '${newDate.day}.${newDate.month}.${newDate.year}';
                                  _dateDeparture = newDate;
                                });
                              },
                            ));
                          },
                          style: TextStyle(color: Colors.white),
                          controller: dateDepartureController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.white8,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 12),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.white14, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.white14),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            hintText: 'Date of departure',
                            hintStyle: TextStyle(
                              color: AppColors.white14,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 155,
                        child: TextField(
                          readOnly: true,
                          onTap: () {
                            _showDialog(
                              CupertinoDatePicker(
                                initialDateTime: _timeDeparture,
                                mode: CupertinoDatePickerMode.time,
                                use24hFormat: true,
                                // This is called when the user changes the time.
                                onDateTimeChanged: (DateTime newTime) {
                                  setState(() {
                                    timeDepartureController.text =
                                        '${newTime.hour}:${newTime.minute}';
                                    _timeDeparture = newTime;
                                  });
                                },
                              ),
                            );
                          },
                          style: TextStyle(color: Colors.white),
                          controller: timeDepartureController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.white8,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 12),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.white14, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.white14),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            hintText: 'Flight time',
                            hintStyle: TextStyle(
                              color: AppColors.white14,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ActionButtonWidget(
                      text: 'Next',
                      width: double.infinity,
                      onTap: () {
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      }),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Arrival at destination',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFieldAppWidget(
                      controller: countryArrivalController,
                      hintText: 'Country of arrival'),
                  SizedBox(height: 10),
                  TextFieldAppWidget(
                      controller: cityArrivalController,
                      hintText: 'City of arrival'),
                  SizedBox(height: 10),
                  TextFieldAppWidget(
                      controller: airportArrivalController,
                      hintText: 'Airport name'),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 195,
                        child: TextField(
                          readOnly: true,
                          onTap: () {
                            _showDialog(CupertinoDatePicker(
                              initialDateTime: _dateArrival,
                              mode: CupertinoDatePickerMode.date,
                              use24hFormat: true,
                              showDayOfWeek: true,
                              onDateTimeChanged: (DateTime newDate) {
                                setState(() {
                                  dateArrivalController.text =
                                      '${newDate.day}.${newDate.month}.${newDate.year}';
                                  _dateArrival = newDate;
                                });
                              },
                            ));
                          },
                          style: TextStyle(color: Colors.white),
                          controller: dateArrivalController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.white8,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 12),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.white14, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.white14),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            hintText: 'Date of arrival',
                            hintStyle: TextStyle(
                              color: AppColors.white14,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 155,
                        child: TextField(
                          readOnly: true,
                          onTap: () {
                            _showDialog(
                              CupertinoDatePicker(
                                initialDateTime: _timeArrival,
                                mode: CupertinoDatePickerMode.time,
                                use24hFormat: true,
                                onDateTimeChanged: (DateTime newTime) {
                                  setState(() {
                                    timeArrivalController.text =
                                        '${newTime.hour}:${newTime.minute}';
                                    _timeArrival = newTime;
                                  });
                                },
                              ),
                            );
                          },
                          style: TextStyle(color: Colors.white),
                          controller: timeArrivalController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.white8,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 12),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.white14, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.white14),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            hintText: 'Flight time',
                            hintStyle: TextStyle(
                              color: AppColors.white14,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ActionButtonWidget(
                      text: 'Next',
                      width: double.infinity,
                      onTap: () {
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      }),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 5),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: AppColors.yellow14,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0))),
                        child: SvgPicture.asset(
                          'assets/images/elements/swap.svg',
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Any transfer',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: Text(
                          'Tap a button below to add intermediate country and transfer details.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.white40,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ActionButtonWidget(
                          text: 'Add transfer',
                          width: double.infinity,
                          onTap: () {
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut);
                          }),
                      SizedBox(height: 15),
                      ActionButtonWidget(
                          text: 'Create without transfer',
                          width: double.infinity,
                          onTap: () {
                            if (countryDepartureController.text.isNotEmpty &&
                                cityDepartureController.text.isNotEmpty &&
                                airportDepartureController.text.isNotEmpty &&
                                dateDepartureController.text.isNotEmpty &&
                                timeDepartureController.text.isNotEmpty &&
                                countryArrivalController.text.isNotEmpty &&
                                cityArrivalController.text.isNotEmpty &&
                                airportArrivalController.text.isNotEmpty &&
                                dateArrivalController.text.isNotEmpty &&
                                timeArrivalController.text.isNotEmpty) {
                              context.read<FlightBloc>().add(
                                    AddFlightEvent(
                                      flight: FlightModel(
                                          countryDeparture:
                                              countryDepartureController.text,
                                          cityDeparture:
                                              cityDepartureController.text,
                                          airportDeparture:
                                              airportDepartureController.text,
                                          dateDeparture: _dateDeparture,
                                          timeDeparture: _timeDeparture,
                                          countryArrival:
                                              countryArrivalController.text,
                                          cityArrival:
                                              cityArrivalController.text,
                                          airportArrival:
                                              airportArrivalController.text,
                                          dateArrival: _dateArrival,
                                          timeArrival: _timeArrival,
                                          hasTransfer: false,
                                          notes: []),
                                    )
                                  );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: AppColors.yellow,
                                  content: Text(
                                    'Flight successfully created!',
                                    style: TextStyle(color: AppColors.black),
                                  ),
                                ),
                              );
                              context.router.push(HomeRoute());
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: AppColors.yellow,
                                  content: Text(
                                    'Please, Fill out the remaining fields',
                                    style: TextStyle(color: AppColors.black),
                                  ),
                                ),
                              );
                            }
                          }),
                    ],
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Transfer',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFieldAppWidget(
                        controller: countryTransferController,
                        hintText: 'Country'),
                    SizedBox(height: 10),
                    TextFieldAppWidget(
                        controller: cityTransferController,
                        hintText: 'City'),
                    SizedBox(height: 10),
                    TextFieldAppWidget(
                        controller: airportTransferController,
                        hintText: 'Airport name'),
                    SizedBox(height: 15),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Departure',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 195,
                          child: TextField(
                            readOnly: true,
                            onTap: () {
                              _showDialog(CupertinoDatePicker(
                                initialDateTime: _dateOfDepartureTransfer,
                                mode: CupertinoDatePickerMode.date,
                                use24hFormat: true,
                                showDayOfWeek: true,
                                onDateTimeChanged: (DateTime newDate) {
                                  setState(() {
                                    dateOfDepartureTransferController.text =
                                    '${newDate.day}.${newDate.month}.${newDate.year}';
                                    _dateOfDepartureTransfer = newDate;
                                  });
                                },
                              ));
                            },
                            style: TextStyle(color: Colors.white),
                            controller: dateOfDepartureTransferController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.white8,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 12),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.white14, width: 2),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: AppColors.white14),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                              hintText: 'Date of departure',
                              hintStyle: TextStyle(
                                color: AppColors.white14,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 155,
                          child: TextField(
                            readOnly: true,
                            onTap: () {
                              _showDialog(
                                CupertinoDatePicker(
                                  initialDateTime: _timeOfDepartureTransfer,
                                  mode: CupertinoDatePickerMode.time,
                                  use24hFormat: true,
                                  // This is called when the user changes the time.
                                  onDateTimeChanged: (DateTime newTime) {
                                    setState(() {
                                      timeOfDepartureTransferController.text =
                                      '${newTime.hour}:${newTime.minute}';
                                      _timeOfDepartureTransfer = newTime;
                                    });
                                  },
                                ),
                              );
                            },
                            style: TextStyle(color: Colors.white),
                            controller: timeOfDepartureTransferController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.white8,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 12),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.white14, width: 2),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: AppColors.white14),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                              hintText: 'Flight time',
                              hintStyle: TextStyle(
                                color: AppColors.white14,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Arrival',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 195,
                          child: TextField(
                            readOnly: true,
                            onTap: () {
                              _showDialog(CupertinoDatePicker(
                                initialDateTime: _dateOfArrivalTransfer,
                                mode: CupertinoDatePickerMode.date,
                                use24hFormat: true,
                                showDayOfWeek: true,
                                onDateTimeChanged: (DateTime newDate) {
                                  setState(() {
                                    dateOfArrivalTransferController.text =
                                    '${newDate.day}.${newDate.month}.${newDate.year}';
                                    _dateOfArrivalTransfer = newDate;
                                  });
                                },
                              ));
                            },
                            style: TextStyle(color: Colors.white),
                            controller: dateOfArrivalTransferController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.white8,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 12),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.white14, width: 2),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: AppColors.white14),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                              hintText: 'Date of arrival',
                              hintStyle: TextStyle(
                                color: AppColors.white14,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 155,
                          child: TextField(
                            readOnly: true,
                            onTap: () {
                              _showDialog(
                                CupertinoDatePicker(
                                  initialDateTime: _timeOfArrivalTransfer,
                                  mode: CupertinoDatePickerMode.time,
                                  use24hFormat: true,
                                  // This is called when the user changes the time.
                                  onDateTimeChanged: (DateTime newTime) {
                                    setState(() {
                                      timeOfArrivalTransferController.text =
                                      '${newTime.hour}:${newTime.minute}';
                                      _timeOfArrivalTransfer = newTime;
                                    });
                                  },
                                ),
                              );
                            },
                            style: TextStyle(color: Colors.white),
                            controller: timeOfArrivalTransferController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.white8,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 12),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.white14, width: 2),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: AppColors.white14),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                              hintText: 'Flight time',
                              hintStyle: TextStyle(
                                color: AppColors.white14,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    ActionButtonWidget(
                        text: 'Create',
                        width: double.infinity,
                        onTap: () {
                          if (countryDepartureController.text.isNotEmpty &&
                              cityDepartureController.text.isNotEmpty &&
                              airportDepartureController.text.isNotEmpty &&
                              dateDepartureController.text.isNotEmpty &&
                              timeDepartureController.text.isNotEmpty &&
                              countryArrivalController.text.isNotEmpty &&
                              cityArrivalController.text.isNotEmpty &&
                              airportArrivalController.text.isNotEmpty &&
                              dateArrivalController.text.isNotEmpty &&
                              timeArrivalController.text.isNotEmpty &&
                              countryTransferController.text.isNotEmpty &&
                              cityTransferController.text.isNotEmpty &&
                              airportTransferController.text.isNotEmpty &&
                              dateOfDepartureTransferController.text.isNotEmpty &&
                              timeOfDepartureTransferController.text.isNotEmpty &&
                              dateOfArrivalTransferController.text.isNotEmpty &&
                              timeOfArrivalTransferController.text.isNotEmpty) {
                            context.read<FlightBloc>().add(
                                AddFlightEvent(
                                  flight: FlightModel(
                                      countryDeparture:
                                      countryDepartureController.text,
                                      cityDeparture:
                                      cityDepartureController.text,
                                      airportDeparture:
                                      airportDepartureController.text,
                                      dateDeparture: _dateDeparture,
                                      timeDeparture: _timeDeparture,
                                      countryArrival:
                                      countryArrivalController.text,
                                      cityArrival:
                                      cityArrivalController.text,
                                      airportArrival:
                                      airportArrivalController.text,
                                      dateArrival: _dateArrival,
                                      timeArrival: _timeArrival,
                                      hasTransfer: true,
                                      countryTransfer: countryTransferController.text,
                                      cityTransfer: cityTransferController.text,
                                      airportTransfer: airportTransferController.text,
                                      dateOfDepartureTransfer: _dateOfDepartureTransfer,
                                      timeOfDepartureTransfer: _timeOfDepartureTransfer,
                                      dateOfArrivalTransfer: _dateOfArrivalTransfer,
                                      timeOfArrivalTransfer: _timeOfArrivalTransfer,
                                      notes: []),
                                )
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: AppColors.yellow,
                                content: Text(
                                  'Flight successfully created!',
                                  style: TextStyle(color: AppColors.black),
                                ),
                              ),
                            );
                            context.router.push(HomeRoute());
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: AppColors.yellow,
                                content: Text(
                                  'Please, Fill out the remaining fields',
                                  style: TextStyle(color: AppColors.black),
                                ),
                              ),
                            );
                          }
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }
}
