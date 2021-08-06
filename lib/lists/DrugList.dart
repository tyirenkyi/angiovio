import '../providers/drug.dart';

class DrugList {
  List<Drug> drugs = [];

  DrugList({
    required this.drugs
  });

  factory DrugList.fromJson(List<dynamic> parsedJson) {
    List<Drug> drugs = List.empty(growable: true);
    drugs = parsedJson.map((e) => Drug.fromJson(e)).toList();
    return DrugList(
        drugs: drugs
    );
  }
}