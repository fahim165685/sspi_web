
import 'package:flutter/material.dart';

class LoginLeft extends StatefulWidget {
  const LoginLeft({Key? key}) : super(key: key);

  @override
  State<LoginLeft> createState() => _LoginLeftState();
}

class _LoginLeftState extends State<LoginLeft> {

  PageController controller=PageController();
  final List item=[
    "assets/images/login_img.png",
    "assets/images/login_img.png",
    "assets/images/login_img.png",
  ];
 int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 4/3,
            child: PageView.builder(
              controller: controller,
              itemCount: item.length,
              onPageChanged: (value) {
                setState(() {
                  selectedIndex=value;
                });
              },
              itemBuilder: (context, index) => Image.asset(item[index]),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(item.length, (index) => buildDot(index)),
          ),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }

  Widget buildDot(int index) {

    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {
        controller.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.ease);
      },
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOutBack,
          height: 10,
          width: index==selectedIndex? 25:10,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: index==selectedIndex? Colors.red:Colors.red.withOpacity(0.5),
          ),
        ),
    );
  }
}
