// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_super_parameters, prefer_const_literals_to_create_immutables
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realm/realm.dart';
import 'package:tennis_time/src/core/utils/colors.dart';
import 'package:tennis_time/src/core/utils/extensions.dart';
import 'package:tennis_time/src/core/utils/ui_functions.dart';
import 'package:tennis_time/src/features/favorites/presentation/blocs/favorites_bloc.dart';
import 'package:tennis_time/src/features/favorites/presentation/blocs/favorites_event.dart';
import 'package:tennis_time/src/features/home/presentation/widgets/custom_dropdown.dart';
import 'package:tennis_time/src/features/home/presentation/widgets/select.dart';
import 'package:tennis_time/src/features/reservations/presentation/blocs/reservation_bloc.dart';
import 'package:tennis_time/src/features/reservations/presentation/blocs/reservation_event.dart';
import 'package:tennis_time/src/features/reservations/presentation/blocs/reservation_state.dart';
import 'package:tennis_time/src/shared/entities/reservation.dart';
import 'package:tennis_time/src/shared/models/court.dart';

import 'package:tennis_time/src/shared/widgets/back_button.dart';
import 'package:tennis_time/src/shared/widgets/custom_buttom.dart';

class ReservationPage extends StatefulWidget {
  final CourtModel court;
  final void Function(String instructor, String date, String startTime,
      String endTime, String comment) onReserve;

  const ReservationPage({
    Key? key,
    required this.court,
    required this.onReserve,
  }) : super(key: key);

  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  String? selectedInstructor;
  String? selectedStartTime;
  String? selectedEndTime;
  DateTime reserveDate = DateTime.now();
  final TextEditingController commentController = TextEditingController();
  List<String> availableSchedule = [];
  bool showErrors = false;
  changeDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    setState(() {
      if (date != null) {
        reserveDate = date;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    availableSchedule = generateAvailableSlots(
        widget.court.timeSlotStart, widget.court.timeSlotEnd);

    return Scaffold(
      body: BlocListener<ReservationBloc, ReservationState>(
        listener: (context, state) {
          print(state);
          if (state is ReservationLoaded) {
            Navigator.of(context).pop();
            UiFunctions.showSnackBar(
                context, "Exito", "La reserva se ha realizado con exito");
          }
        },
        child: BlocBuilder<ReservationBloc, ReservationState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 300.0,
                  leading: CustomBackButton(
                    onTap: () {
                      Navigator.of(context).pop();

                      context
                          .read<ReservationBloc>()
                          .add(ResetReservationEvent());

                      setState(() {
                        showErrors = false;
                      });
                    },
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {
                          context.read<FavoriteBloc>().add(CreateFavorite(
                              Favorite(ObjectId(),
                                  court: Court(
                                      ObjectId(),
                                      widget.court.name,
                                      widget.court.type,
                                      widget.court.imageUrl,
                                      widget.court.price,
                                      widget.court.availability,
                                      widget.court.location,
                                      widget.court.timeSlotStart,
                                      widget.court.timeSlotEnd))));
                        },
                        icon: Icon(
                          Icons.favorite_border,
                          color: AppColors.light,
                        ))
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      widget.court.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  pinned: true,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Column(
                          children: [
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(widget.court.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          fontWeight: FontWeight.w700,
                                        )),
                                Text(
                                  '\$${widget.court.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                          color: AppColors.secondaryColor,
                                          fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(widget.court.type,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!),
                                Text('Por hora',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            color: AppColors.dark
                                                .withOpacity(0.5))),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                          widget.court.availability
                                              ? 'Disponible'
                                              : "No disponible",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Icon(Icons.circle,
                                            color: Colors.green, size: 12),
                                      ),
                                      Text(
                                          "${widget.court.timeSlotStart} a ${widget.court.timeSlotEnd}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.cloud_outlined, size: 18),
                                      SizedBox(width: 4),
                                      Text('80%',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on_outlined, size: 18),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Text(widget.court.location,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16),
                            Container(
                              height: 60,
                              padding: EdgeInsets.only(right: 120.w),
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(6.0),
                                    ),
                                  ),
                                  filled: false,
                                  fillColor: AppColors.light,
                                ),
                                hint: Text('Agregar instructor'),
                                value: selectedInstructor,
                                items: <String>[
                                  'Mark Gonzales',
                                  'Jane Doe',
                                  'John Smith'
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedInstructor = value;
                                  });
                                  BlocProvider.of<ReservationBloc>(context)
                                      .add(ValidateReservationEvent(
                                    value ?? "",
                                    reserveDate,
                                    selectedStartTime ?? "",
                                    selectedEndTime ?? "",
                                    commentController.text,
                                  ));
                                },
                              ),
                            ),
                            if (state is ReservationValidationState &&
                                state.instructorError.isNotEmpty &&
                                showErrors)
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  state.instructorError,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Colors.red,
                                      ),
                                ),
                              ),
                            SizedBox(height: 16),
                          ],
                        ),
                      ),
                      Container(
                        color: AppColors.secondaryColor.withOpacity(0.1),
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 18.0),
                              child: Text('Establecer fecha y hora',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                            ),
                            Select(
                              onTap: () async {
                                await changeDate();
                                BlocProvider.of<ReservationBloc>(context)
                                    .add(ValidateReservationEvent(
                                  selectedInstructor ?? "",
                                  reserveDate,
                                  selectedStartTime ?? "",
                                  selectedEndTime ?? "",
                                  commentController.text,
                                ));
                              },
                              child: Container(
                                width: 360.w,
                                height: 50.h,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 14),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Fecha',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall),
                                    Text(reserveDate.toSpanishDate(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              color: AppColors.secondaryColor,
                                              fontWeight: FontWeight.w600,
                                            )),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 4.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        CustomDropDown(
                                          items: availableSchedule ?? [],
                                          onChanged: (val) {
                                            setState(() {
                                              selectedEndTime = null;
                                            });
                                            setState(() {
                                              selectedStartTime = val;
                                            });
                                            BlocProvider.of<ReservationBloc>(
                                                    context)
                                                .add(ValidateReservationEvent(
                                              selectedInstructor ?? "",
                                              reserveDate,
                                              selectedStartTime ?? "",
                                              selectedEndTime ?? "",
                                              commentController.text,
                                            ));
                                          },
                                          selectedValue: selectedStartTime,
                                          hintText: 'Hora de inicio',
                                        ),
                                        (state is ReservationValidationState &&
                                                state.timeSlotStartError
                                                    .isNotEmpty &&
                                                showErrors)
                                            ? Container(
                                                alignment: Alignment.centerLeft,
                                                width: 150,
                                                height: 50,
                                                child: Text(
                                                  state.timeSlotStartError,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                        color: Colors.red,
                                                      ),
                                                ),
                                              )
                                            : SizedBox(
                                                height: 50,
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CustomDropDown(
                                          items: generateEndDates(),
                                          onChanged: (val) {
                                            setState(() {
                                              selectedEndTime = val;
                                            });
                                            BlocProvider.of<ReservationBloc>(
                                                    context)
                                                .add(ValidateReservationEvent(
                                              selectedInstructor ?? "",
                                              reserveDate,
                                              selectedStartTime ?? "",
                                              selectedEndTime ?? "",
                                              commentController.text,
                                            ));
                                          },
                                          hintText: 'Hora de fin',
                                          selectedValue: selectedEndTime,
                                        ),
                                        (state is ReservationValidationState &&
                                                state.timeSlotEndError
                                                    .isNotEmpty &&
                                                showErrors)
                                            ? Container(
                                                alignment: Alignment.centerLeft,
                                                width: 150,
                                                height: 50,
                                                child: Text(
                                                  state.timeSlotEndError,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                        color: Colors.red,
                                                      ),
                                                ),
                                              )
                                            : SizedBox(
                                                height: 50,
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 18.0),
                              child: Text('Agregar un comentario',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                            ),
                            TextField(
                              controller: commentController,
                              maxLines: 4,
                              onTapOutside: (event) {
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              onChanged: (val) {
                                BlocProvider.of<ReservationBloc>(context)
                                    .add(ValidateReservationEvent(
                                  selectedInstructor ?? "",
                                  reserveDate,
                                  selectedStartTime ?? "",
                                  selectedEndTime ?? "",
                                  val,
                                ));
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: AppColors.light,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide(
                                      width: 1.5,
                                      color: AppColors.dark.withOpacity(0.2)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide(
                                      width: 1.5,
                                      color: AppColors.dark.withOpacity(0.2)),
                                ),
                              ),
                            ),
                            if (state is ReservationValidationState &&
                                state.commentError.isNotEmpty &&
                                showErrors)
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  state.commentError,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Colors.red,
                                      ),
                                ),
                              ),
                            SizedBox(height: 16),
                            CustomButton(
                                text: "Reservar",
                                onPressed: () {
                                  if (state is ReservationValidationState) {
                                    setState(() {
                                      showErrors = true;
                                    });
                                    return;
                                  }

                                  if (state is ReservationInitial) {
                                    BlocProvider.of<ReservationBloc>(context)
                                        .add(CreateReservation(Reservation(
                                      ObjectId(),
                                      selectedInstructor ?? "",
                                      reserveDate,
                                      selectedStartTime ?? "",
                                      selectedEndTime ?? "",
                                      commentController.text,
                                      court: Court(
                                          ObjectId(),
                                          widget.court.name,
                                          widget.court.type,
                                          widget.court.imageUrl,
                                          widget.court.price,
                                          widget.court.availability,
                                          widget.court.location,
                                          widget.court.timeSlotStart,
                                          widget.court.timeSlotEnd),
                                    )));
                                  }
                                })
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  List<String> generateAvailableSlots(String start, String end) {
    // Convertir las horas inicial y final a DateTime
    DateTime startTime = start.parseTime();
    DateTime endTime = end.parseTime();

    // Lista para almacenar las horas disponibles
    List<String> slots = [];

    // Iterar de la hora inicial a la hora final en intervalos de una hora
    while (startTime.isBefore(endTime)) {
      slots.add(startTime.formatTime());
      startTime = startTime.add(Duration(hours: 1));
    }

    return slots;
  }

  List<String> generateEndDates() {
    List<String> endDates = [];
    if (availableSchedule.isNotEmpty && selectedStartTime != null) {
      for (String val in availableSchedule) {
        String day = val.parseTime().add(Duration(hours: 1)).formatTime();
        if (day.parseTime().isAfter(selectedStartTime!.parseTime())) {
          endDates.add(day);
        }
      }
    }
    return endDates;
  }
}
