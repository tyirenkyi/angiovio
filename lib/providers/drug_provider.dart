import 'package:angiovio/lists/DrugList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'drug.dart';
import '../services.dart';

class DrugProvider with ChangeNotifier {
  List<Drug> _items = [];
  bool busy = true;

  List<Drug> get items {
    return [..._items];
  }

  Drug findByName(String name) {
    return items.firstWhere((element) => element.name == name);
  }

  void deleteDrug(String name) {
    _items.removeWhere((element) => element.name == name);
    notifyListeners();
  }

  void setNextDose(String name, int nextDose) {
    _items.forEach((element) {
      if(element.name == name)
        element.nextDose = nextDose;
    });
  }

  fetchDrugs({required String user}) async{
    try{
      DrugList drugList = await loadDrugs(user: user);
      _items.clear();
      _items.addAll(drugList.drugs);
      busy = false;
      notifyListeners();
    } catch(e) {
      busy = false;
      print('failed to fetch drugs, $e');
    }
  }
}