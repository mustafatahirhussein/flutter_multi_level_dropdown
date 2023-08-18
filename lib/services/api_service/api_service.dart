import 'dart:convert';

import 'package:flutter_multi_level_dd/const/app_const.dart';
import 'package:flutter_multi_level_dd/services/model/country_state_model.dart';
import 'package:http/http.dart' as http;

class ApiService {

  Future<CountryStateModel> getCountry() async {
    try {
      final res = await http.get(Uri.parse(AppConstants().url));

      if(200 == res.statusCode) {
        return CountryStateModel.fromMap(jsonDecode(res.body));
      }
      else {
        return CountryStateModel.fromMap({});
      }
    }
    catch (e) {
      throw "Something went wrong $e";
    }
  }
}