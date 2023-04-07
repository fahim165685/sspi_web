import 'package:flutter/material.dart';

import '../../../../../helper/constants.dart';


//ignore: must_be_immutable
class CustomTextFiled extends StatelessWidget {
  CustomTextFiled({
    required this.labelText,
    this.controller,
    this.maxLength,
    this.validator,
    this.hPadding=0,
    this.vPadding=0,
    Key? key, }) : super(key: key);

  int? maxLength;
  final String labelText;
  String? Function(String?)? validator;
  double? hPadding,vPadding;
  TextEditingController? controller;




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPadding!,vertical: vPadding!),
      child: TextFormField(
        controller:controller,
        validator: validator,
        maxLength: maxLength,
        style: const TextStyle(color: kTextLightColor, fontSize: 18),
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
          counterStyle: const TextStyle(color:kTextColor),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        ),
      ),
    );
  }
}
