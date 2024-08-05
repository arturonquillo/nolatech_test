class CourtModel {
  final String name;
  final String type;
  final String imageUrl;
  final double price;
  final bool availability;
  final String location;
  late String timeSlotStart;
  late String timeSlotEnd;

  CourtModel({
    required this.name,
    required this.type,
    required this.imageUrl,
    required this.price,
    required this.availability,
    required this.location,
    required this.timeSlotStart,
    required this.timeSlotEnd,
  });
}
