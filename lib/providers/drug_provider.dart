import 'package:angiovio/lists/DrugList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'drug.dart';
import '../services.dart';

class DrugProvider with ChangeNotifier {
  List<Drug> _items = [];

  List<Drug> get items {
    return [...items];
  }

  Drug findByName(String name) {
    return items.firstWhere((element) => element.name == name);
  }

  fetchDrugs({required String user, required String drug}) async{
    try{
      DrugList drugList = await loadDrugs(user: user, drug: drug);
      _items.clear();
      _items.addAll(drugList.drugs);
      notifyListeners();
    }catch(e) {
      print('failed to fetch drugs, $e');
    }
  }
}