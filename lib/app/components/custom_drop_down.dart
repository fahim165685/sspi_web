
import 'package:flutter/material.dart';


import '../../helper/constants.dart';

//ignore: must_be_immutable
class CustomDropdown extends StatelessWidget {
  CustomDropdown({
    super.key,
    this.value,
    this.items,
    required this.onChanged,
    required this.labelText,
  });

  String? value;
  List<String>? items;
  final String labelText;
  void Function(Object?) onChanged;

  @override
  Widget build(BuildContext context) {
    return   DropdownButtonFormField(
      value: value,
      items:items!.map((e) {
        return DropdownMenuItem(
          value: e,
          child: FittedBox(
            child: Text(e,style: const TextStyle(
                color: kTextLightColor,
                fontSize: 18
            ),),
          ),
        );
      }).toList(),
      dropdownColor: kPrimaryLightColor,
      icon: const Icon(
        Icons.arrow_drop_down_circle,
        color: kSecondaryColor,
      ),
      borderRadius: BorderRadius.circular(5),
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.white24,
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide:
          const BorderSide(color: kSecondaryColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white24, width: 2),
        ),
        labelText: labelText,
        labelStyle: const TextStyle(color: kTextColor),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      ),

    );
  }
}
