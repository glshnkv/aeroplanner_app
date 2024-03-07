import 'package:aeroplanner_app/models/flight_model.dart';
import 'package:aeroplanner_app/models/note_model.dart';
import 'package:aeroplanner_app/router/router.dart';
import 'package:aeroplanner_app/screens/flight/flight_bloc/flight_bloc.dart';
import 'package:aeroplanner_app/screens/flight/flight_details/flight_details_screen.dart';
import 'package:aeroplanner_app/theme/colors.dart';
import 'package:aeroplanner_app/widgets/action_button_widget.dart';
import 'package:aeroplanner_app/widgets/textfield_app_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AddPlanScreen extends StatefulWidget {
  final FlightModel flight;

  const AddPlanScreen({super.key, required this.flight});

  @override
  State<AddPlanScreen> createState() => _AddPlanScreenState();
}

class _AddPlanScreenState extends State<AddPlanScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
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
              context.router.pop();
            },
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios, color: AppColors.yellow),
                Text(
                  'Arrival',
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
              'Your flight',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Plans',
              style: TextStyle(
                color: AppColors.white40,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Task',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 5),
            TextFieldAppWidget(controller: titleController, hintText: 'Title'),
            SizedBox(height: 10),
            TextFieldAppWidget(
                controller: descriptionController,
                hintText: 'Description text ...'),
            SizedBox(height: 20),
            ActionButtonWidget(
                text: 'Add plan',
                width: double.infinity,
                onTap: () {
                  if (titleController.text.isNotEmpty &&
                      descriptionController.text.isNotEmpty) {
                    context.read<FlightBloc>().add(AddPlanEvent(
                        flight: widget.flight,
                        note: NoteModel(
                            title: titleController.text,
                            description: descriptionController.text)));
                    context.router
                        .push(FlightDetailsRoute(flight: widget.flight));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: AppColors.yellow,
                        content: Text(
                          'Plan successfully created!',
                          style: TextStyle(color: AppColors.black),
                        ),
                      ),
                    );
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
    );
  }
}
