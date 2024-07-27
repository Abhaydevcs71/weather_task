import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_task/viewModel/get_weathet_data.notifier.dart';

class CityTextField extends StatefulWidget {
  const CityTextField({super.key});

  @override
  _CityTextFieldState createState() => _CityTextFieldState();
}

class _CityTextFieldState extends State<CityTextField> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextFormField(
          cursorColor: Colors.white,
          style: const TextStyle(color: Colors.white, fontSize: 18),
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: 'City Name',
            hintStyle: const TextStyle(fontSize: 18),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Colors.white,
              ),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Colors.white,
              ),
            ),
            suffixIcon: InkWell(
              onTap: () {
                String cityName = textEditingController.text;
                if (cityName.isNotEmpty) {
                  Provider.of<WeatherDataNotifier>(context, listen: false)
                      .updateCityName(cityName.trim());
                }
              },
              child: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            constraints: const BoxConstraints(
              maxWidth: 250,
            ),
          ),
        ),
      ),
    );
  }
}
