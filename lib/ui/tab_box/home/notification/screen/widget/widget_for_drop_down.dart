import 'package:flutter/material.dart';
import 'package:taxi_app/utils/constants/constants.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton({Key? key}) : super(key: key);

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}
class _DropDownButtonState extends State<DropDownButton> {
  String _selectedValue = "discount";
  String get selectedValue => _selectedValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(

      value: _selectedValue,
      items: iconMapping.keys
          .map((e) => DropdownMenuItem(
        value: e,
        child: Text(e),
      )).toList(),
      icon: const Icon(Icons.keyboard_arrow_down),
      onChanged: (value) {
        setState(() {
          _selectedValue = value!;

        });
      },
    );
  }

}


