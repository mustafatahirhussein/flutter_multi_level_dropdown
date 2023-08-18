import 'package:flutter/material.dart';
import 'package:flutter_multi_level_dd/services/view_model/country_state_view_model.dart';
import 'package:provider/provider.dart';

class MMDropDownView extends StatefulWidget {
  const MMDropDownView({Key? key}) : super(key: key);

  @override
  State<MMDropDownView> createState() => _MMDropDownViewState();
}

class _MMDropDownViewState extends State<MMDropDownView> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () {
      var result = Provider.of<CountryStateViewModel>(context, listen: false);
      result.getCountry();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<CountryStateViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Multi-level Dropdown"),
      ),
      body: viewModel.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              children: [
                DropdownButton(
                  items: viewModel.stateList
                      .map(
                        (e) => DropdownMenuItem(
                          value: e.name,
                          child: Text(e.name),
                        ),
                      )
                      .toList(),
                  onChanged: (dynamic val) {
                    setState(() {
                      viewModel.selectedProvince = null;
                      viewModel.selectedState = val.toString();

                      viewModel.tempList = viewModel.provinceList
                          .where((item) => item.name == viewModel.selectedState)
                          .toList();
                    });
                  },
                  value: viewModel.selectedState,
                  hint: const Text("Select a State"),
                  isDense: false,
                  isExpanded: true,
                ),

                DropdownButton(
                        items: viewModel.tempList
                            .map(
                              (e) => DropdownMenuItem(
                                value: e.name,
                                child: Text(e.name),
                              ),
                            )
                            .toList(),
                        onChanged: (dynamic val) {
                          setState(() {
                            viewModel.selectedProvince = val.toString();
                          });
                        },
                        value: viewModel.selectedProvince,
                        hint: const Text("Select a Province"),
                        isDense: false,
                        isExpanded: true,
                      ),
              ],
            ),
    );
  }
}
