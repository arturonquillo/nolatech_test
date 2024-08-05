// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tennis_time/src/core/utils/assets.dart';
import 'package:tennis_time/src/core/utils/colors.dart';
import 'package:tennis_time/src/core/utils/extensions.dart';
import 'package:tennis_time/src/shared/entities/reservation.dart';

class FavoriteTile extends StatelessWidget {
  final Favorite favorite;

  FavoriteTile(this.favorite);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: AppColors.dark.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(12.0), // Bordes redondeados
      ),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 60.0,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              clipBehavior: Clip.hardEdge,
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Image.asset(
                favorite.court!.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(favorite.court!.name,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Icon(
                          Icons.cloud_outlined,
                          size: 18,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "80%",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      favorite.court!.type,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 18,
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
                              '${favorite.court!.timeSlotEnd.parseTime().difference(favorite.court!.timeSlotStart.parseTime()).inHours} hora(s)'),
                        ),
                        Container(
                          height: 12,
                          width: 1,
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          color: AppColors.dark,
                        ),
                        Text("\$${favorite.court!.pricePerHour}")
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
