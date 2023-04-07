import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sspi_web/app/modules/panel_right/from/student_from.dart';
import 'package:sspi_web/helper/constants.dart';
import 'package:sspi_web/helper/responsive_layout.dart';

import '../../../panel_left/from_left.dart';



class FromWidgetTree extends StatefulWidget {

  FromWidgetTree({Key? key,this.value}) : super(key: key);

  String? value;
  @override
  State<FromWidgetTree> createState() => _FromWidgetTreeState();
}

class _FromWidgetTreeState extends State<FromWidgetTree> {
  @override
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: ResponsiveLayout(
        tine: const Center(child: Text("Tine",style: TextStyle(fontSize: 20),)),
        phone:const StudentForm(),
        tablet:const Center(child: Text("tablet",style: TextStyle(fontSize: 20),)),
        largeTablet: Row(
          children: const [
            Expanded(child: FromLeft()),
            Expanded(child: StudentForm()),
          ],
        ),
        computer:
          Row(
            children: const [
              Expanded(child: FromLeft()),
              Expanded(child: StudentForm()),
            ],
          ),
        )
    );
  }
}
