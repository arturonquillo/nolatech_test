// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tennis_time/src/core/utils/assets.dart';
import 'package:tennis_time/src/core/utils/colors.dart';
import 'package:tennis_time/src/core/utils/extensions.dart';
import 'package:tennis_time/src/shared/entities/reservation.dart';

class ReservationTileDashboard extends StatelessWidget {
  final Reservation reservation;

  ReservationTileDashboard(this.reservation);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      color: AppColors.secondaryColor.withOpacity(0.05),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60.0,
            height: 60,
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))),
            clipBehavior: Clip.hardEdge,
            margin: EdgeInsets.only(top:10, left: 10),
            child: Image.asset(
              AppAssets.courtTipeA,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text(reservation.court!.name,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 18,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(reservation.date.toSpanishDate()),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Reservado por:',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 8, right: 8),
                          height: 25,
                          width: 25,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(AppAssets.profile),
                          )),
                      Text(
                        'Andrea Gomez',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        size: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                            '${reservation.timeSlotEnd.parseTime().difference(reservation.timeSlotStart.parseTime()).inHours} hora(s)'),
                      ),
                      Container(
                        height: 12,
                        width: 1,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        color: AppColors.dark,
                      ),Text("\$${reservation.court!.pricePerHour}")
                    ],
                  ),
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
