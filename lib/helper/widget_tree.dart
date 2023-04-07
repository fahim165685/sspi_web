import 'package:flutter/material.dart';
import 'package:sspi_web/helper/responsive_layout.dart';

import '../app/modules/panel_left/login_left.dart';
import '../app/modules/panel_right/login/login_right.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       /* appBar: PreferredSize(
      preferredSize:  Size(double.infinity,
          (ResponsiveLayout.isTinyLimit(context) ||
              ResponsiveLayout.isTinyHeightLimit(context)|| ResponsiveLayout.isComputer(context))?0:60),
      child: (ResponsiveLayout.isTinyLimit(context) ||
              ResponsiveLayout.isTinyHeightLimit(context)|| ResponsiveLayout.isComputer(context))
          ? Container()
          : AppBar(
              title: const Text("Widget Tree"),
            )),*/
      body: ResponsiveLayout(
        tine: const Center(child: Text("Tine",style: TextStyle(fontSize: 20),)),
        phone:const LoginRight(),
        tablet:const LoginRight(),
        largeTablet: Row(
          children: const [
            Expanded(child:LoginLeft()),
            Expanded(child:LoginRight()),
          ],
        ),
        computer: Row(
          children: const [
            Expanded(child:LoginLeft()),
            Expanded(child:LoginRight()),
          ],
        )
      ),
    );
  }
}
