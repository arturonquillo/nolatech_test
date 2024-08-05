import 'package:tennis_time/src/shared/bloc/shared_event.dart';

extension FormattedDate on DateTime {
  String toSpanishDate() {
    final months = [
      'enero',
      'febrero',
      'marzo',
      'abril',
      'mayo',
      'junio',
      'julio',
      'agosto',
      'septiembre',
      'octubre',
      'noviembre',
      'diciembre'
    ];

    return '${this.day} de ${months[this.month - 1]} ${this.year}';
  }

  String formatTime() {
    // Formatear la hora a una cadena en formato "HH:MM"
    String hours = this.hour.toString().padLeft(2, '0');
    String minutes = this.minute.toString().padLeft(2, '0');

    return "$hours:$minutes";
  }
}

extension FormattedString on String {
  DateTime parseTime() {
    // Dividir la cadena de tiempo en horas y minutos
    List<String> parts = this.split(':');
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);

    // Devolver la hora convertida a DateTime
    return DateTime(0, 1, 1, hours, minutes);
  }

  DateTime? toDateTime() {
    final months = {
      'enero': 1,
      'febrero': 2,
      'marzo': 3,
      'abril': 4,
      'mayo': 5,
      'junio': 6,
      'julio': 7,
      'agosto': 8,
      'septiembre': 9,
      'octubre': 10,
      'noviembre': 11,
      'diciembre': 12,
    };

    final parts = this.split(' ');

    if (parts.length != 4) return null;

    final day = int.tryParse(parts[0]);
    final month = months[parts[2].toLowerCase()];
    final year = int.tryParse(parts[3]);

    if (day == null || month == null || year == null) return null;

    return DateTime(year, month, day);
  }
}

extension NavigationPages on NavigationEnum {
  int get position {
    switch (this) {
      case NavigationEnum.home:
        return 0;
      case NavigationEnum.reservations:
        return 1;
      case NavigationEnum.favorites:
        return 2;
      
    }
  }
}
