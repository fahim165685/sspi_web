import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sspi_web/helper/constants.dart';

ThemeData theme() {
  return ThemeData(
    primarySwatch:Colors.green,
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: kSecondaryColor,
        ),
    textTheme: const TextTheme(
        bodySmall: TextStyle(
          color: Colors.grey,
        ),
        bodyMedium: TextStyle(
          color: Colors.grey,
        ),
        bodyLarge: TextStyle(
          color: Colors.grey,
        )),
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kPrimaryColor,
appBarTheme:appBarTheme(),

/*    colorScheme: ThemeData().colorScheme.copyWith(
      primary:kPrimaryColor,
    ),
    primaryColor: kPrimaryColor,
    appBarTheme: appBarTheme(),
    scaffoldBackgroundColor:kBGColor,

    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,*/
  );
}
AppBarTheme appBarTheme() {
  return  AppBarTheme(
    toolbarHeight: 50,
    color: kPrimaryColor,
    elevation: 10,
    shadowColor: Colors.black,
    centerTitle: true,
    titleTextStyle: (GoogleFonts.roboto(color: Colors.grey[200], fontSize: 22,fontWeight: FontWeight.w500)),
    iconTheme: const IconThemeData(color: kSecondaryColor),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(15),
        bottomLeft: Radius.circular(15),
      ),),
  );
}
/*
InputDecorationTheme inputDecorationTheme() {
   return   InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical: 22),
     hintStyle: const TextStyle(
       fontSize: 15,
       color: kTextColor
     ),
     border:OutlineInputBorder(
         borderRadius: BorderRadius.circular(8),
         borderSide: const BorderSide(color: kPrimaryColor)
     ),

     disabledBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(8),
         borderSide: const BorderSide(color: kSecondaryColor)
     ),


     enabledBorder: OutlineInputBorder(
       borderRadius: BorderRadius.circular(8),
       borderSide: const BorderSide(color: kSecondaryColor)
     ),
     focusedBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(8),
         borderSide:  BorderSide(color: kPrimaryColor.withOpacity(0.2,),width: 2)
     ),
     errorBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(8),
         borderSide: const BorderSide(color: Colors.red)
     ),

     focusedErrorBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(8),
         borderSide:  BorderSide(color: Colors.red.withOpacity(0.5))
     ),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: kSecondaryColor,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: (TextStyle(color: Color(0XFF8B8B8B), fontSize: 22)),
    iconTheme: IconThemeData(color: Colors.black),
  );
}*/
