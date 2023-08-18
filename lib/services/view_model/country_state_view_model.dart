import 'package:flutter/material.dart';
import 'package:flutter_multi_level_dd/services/model/country_state_model.dart';
import 'package:flutter_multi_level_dd/services/repo/country_state_repo.dart';

class CountryStateViewModel extends ChangeNotifier {
  
  CountryStateRepo repo = CountryStateRepo();
  List<Province> provinceList = [];
  List<States> stateList = [];

  /// A temporary list
  List<Province> tempList = [];

  String? selectedProvince, selectedState;
  bool isLoading = false;
  
  dynamic getCountry() async {
    isLoading = true;
    notifyListeners();
    final data = await repo.getCountry();
    provinceList = data.provinces;
    stateList = data.states;
    isLoading = false;
    notifyListeners();
  }
}