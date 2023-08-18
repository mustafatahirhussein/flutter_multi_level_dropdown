import 'package:flutter_multi_level_dd/services/view_model/country_state_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class InitProviders {
  static final List<SingleChildWidget> initP = [
    ChangeNotifierProvider(create: (_) => CountryStateViewModel()),
  ];
}