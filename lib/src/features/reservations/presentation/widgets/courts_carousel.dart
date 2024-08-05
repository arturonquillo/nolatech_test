import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tennis_time/src/core/utils/extensions.dart';
import 'package:tennis_time/src/features/reservations/presentation/pages/reservation_page.dart';
import 'package:tennis_time/src/features/reservations/presentation/widgets/court_card.dart';
import 'package:tennis_time/src/shared/models/court.dart';

class CourtsCarousel extends StatelessWidget {
  final List<CourtModel> courts;

  CourtsCarousel({required this.courts});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: courts.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        final court = courts[index];
        return CourtCard(
          imageUrl: court.imageUrl,
          name: court.name,
          type: court.type,
          date: DateTime.now().toSpanishDate(),
          availability: court.availability,
          weather: "80%",
          time: court.name,
          onReserve: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReservationPage(
                  court: court,
                  onReserve: (String instructor, String date, String startTime,
                      String endTime, String comment) {},
                ),
              ),
            );
          },
        );
      },
      options: CarouselOptions(
        height: 400.0,
        enlargeCenterPage: false,
        autoPlay: false,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
    );
  }
}
