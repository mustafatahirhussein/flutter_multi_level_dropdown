import 'package:flutter_multi_level_dd/services/api_service/api_service.dart';
import 'package:flutter_multi_level_dd/services/model/country_state_model.dart';

class CountryStateRepo {
  final ApiService apiService = ApiService();

  Future<CountryStateModel> getCountry() async {
    final res = await apiService.getCountry();
    return res;
  }
}