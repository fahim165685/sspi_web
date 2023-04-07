import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FromLeft extends StatelessWidget {
  const FromLeft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset('assets/images/form_img.svg',fit: BoxFit.cover,)
    );
  }
}
