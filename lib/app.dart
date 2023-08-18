import 'package:flutter/material.dart';
import 'package:flutter_multi_level_dd/const/init_provider.dart';
import 'package:flutter_multi_level_dd/screens/mm_dropdown_view.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: InitProviders.initP,
      child: MaterialApp(
        home: MMDropDownView(),
      ),
    );
  }
}

// https://stackoverflow.com/questions/69801280/add-multiple-packages-in-single-command-in-flutter#:~:text=Suppose%20I%20have%20a%20list,those%20packages%20in%20my%20app.

// https://raw.githubusercontent.com/rjcalifornia/drop_example/master/json/states.json