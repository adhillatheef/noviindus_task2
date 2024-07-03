import 'package:flutter/material.dart';

import '../../../../common/themes/app_palatte.dart';
import '../../../../common/utils/country_code.dart';

class MobileNumberTextField extends StatefulWidget {
  final TextEditingController controller;

  const MobileNumberTextField({super.key, required this.controller});

  @override
  _MobileNumberTextFieldState createState() => _MobileNumberTextFieldState();
}

class _MobileNumberTextFieldState extends State<MobileNumberTextField> {
  String? selectedCountryCode = '+91';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: DropdownButtonFormField<String>(
              value: selectedCountryCode,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: AppPalette.whiteColor,
              ),
              onChanged: (value) {
                setState(() {
                  selectedCountryCode = value;
                });
              },
              items: CountryCode.countryCodes
                  .map((String code) => DropdownMenuItem<String>(
                value: code,
                child: Text(code),
              ))
                  .toList(),
              validator: (value) {
                if (value == null) {
                  return 'Please select a country code';
                } else {
                  return null;
                }
              },
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 7,
            child: TextFormField(
              controller: widget.controller,
              decoration: const InputDecoration(
                hintText: 'Enter your mobile number',
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
        ],
      ),
    );
  }
}
