import 'package:flutter/widgets.dart';

class Drug with ChangeNotifier {
  final String id;
  final String user;
  final String name;
  final String token;
  final int dosage;
  final int interval;
  final int missed;
  final int taken;
  final int repeats;
  final String createdOn;
  int nextDose;

  Drug({
    required this.id,
    required this.user,
    required this.name,
    required this.token,
    required this.dosage,
    required this.interval,
    required this.missed,
    required this.taken,
    required this.repeats,
    required this.createdOn,
    this.nextDose = 7,
  });

  factory Drug.fromJson(Map<String, dynamic> json) {
    return Drug(
      id: json['id'],
      user: json['userid'],
      name: json['name'],
      token: json['token'],
      dosage: json['dosage'],
      interval: json['interval'],
      missed: json['missed'],
      taken: json['taken'],
      repeats: json['repeats'],
      createdOn: json['createdon']
    );
  }
}