// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tennis_time/src/core/utils/colors.dart';
import 'package:tennis_time/src/shared/widgets/custom_buttom.dart';

class CourtCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String type;
  final String date;
  final bool availability;
  final String weather;
  final String time;
  final VoidCallback onReserve;

  const CourtCard({
    required this.imageUrl,
    required this.name,
    required this.type,
    required this.date,
    required this.availability,
    required this.weather,
    required this.time,
    required this.onReserve,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      color: AppColors.light,
      shadowColor: AppColors.light,
      surfaceTintColor: AppColors.light,
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 170,
              child: Image.asset(imageUrl,
                  fit: BoxFit.cover, width: double.infinity)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                child:
                    Text(name, style: Theme.of(context).textTheme.titleMedium),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Icon(Icons.cloud_outlined, size: 14.0),
                    SizedBox(width: 4.0),
                    Text(weather, style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(type, style: Theme.of(context).textTheme.bodySmall),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: Row(
              children: [
                Icon(Icons.calendar_today, size: 14.0),
                SizedBox(width: 4.0),
                Text(date, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 4.0, bottom: 4.0, right: 4.0),
                  child: Text(
                    availability ? "Disponible" : "No disponible",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: availability ? Colors.green : Colors.red,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.circle,
                      size: 14,
                      color: availability ? Colors.green : Colors.red),
                ),
                Icon(Icons.access_time, size: 14.0),
                SizedBox(width: 4.0),
                Text(time, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 6),
                  height: 70,
                  child: CustomButton(
                    onPressed: onReserve,
                    text: "Reservar",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
