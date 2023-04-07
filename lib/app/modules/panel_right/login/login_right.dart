import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sspi_web/helper/constants.dart';

import 'custom_login_button.dart';


class LoginRight extends StatelessWidget {
  const LoginRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                    child: CircleAvatar(
                      backgroundColor: kPrimaryLightColor,
                      radius: 50,
                      backgroundImage: AssetImage("assets/images/sspi_logo.png"),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome To SSPI",
                    style: GoogleFonts.lora(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    "please Select your\ntitle".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lora(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                   const CustomButton(),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: (){},
                    child: RichText(text: const TextSpan(text:"ADMIN ",style: TextStyle(color: Colors.grey,fontSize: 16),  children: [
                      TextSpan(text:"LOGIN", style: TextStyle(color: kSecondaryColor,fontSize: 16)),
                    ])),
                  ),

                  const SizedBox(height: 80,),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: (){},
                    child: RichText(text: const TextSpan(text:" Developer ",style: TextStyle(color: Colors.grey,fontSize: 16),  children: [
                      TextSpan(text:"HM Fahim ", style: TextStyle(color: kSecondaryColor,fontSize: 16)),
                    ])),
                  ),
                ],
              ),
            ),

      ),
    );
  }
}