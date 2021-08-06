import 'package:flutter/widgets.dart';

class Drug with ChangeNotifier {
  final String user;
  final String name;
  final int dosage;
  final int interval;
  final int missed;
  final int taken;
  final int repeats;

  Drug({
    required this.user,
    required this.name,
    required this.dosage,
    required this.interval,
    required this.missed,
    required this.taken,
    required this.repeats
  });

  factory Drug.fromJson(Map<String, dynamic> json) {
    return Drug(
        user: json['user'],
        name: json['name'],
        dosage: json['dosage'],
        interval: json['interval'],
        missed: json['missed'],
        taken: json['taken'],
        repeats: json['repeats']
    );
  }
}