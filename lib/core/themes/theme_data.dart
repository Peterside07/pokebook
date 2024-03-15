// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



const textColor = Colors.white;
const primaryColor = Color(0XFF102C54);
const secondaryColor = Colors.white;
const filterBackground = Color(0xFF5A5A5A);
const itemListColor = Color(0XFFEEEEEE);
final listBackgroundColor = Colors.grey.shade200;
final containerBackGroundColor = /*  Color(0XDDDADADA); */ Color(0XDD383838);
final errorColor = Colors.red[700];
final inputColor = Color(0XFF75ff83);

final enableInputColor = Colors.grey[50];
final readOnlyInputColor = Color(0XFFEEEEEE);

const thirdColor = Colors.grey;


final darkTheme = ThemeData(
  fontFamily: GoogleFonts.sofiaSans().fontFamily, 
  primarySwatch: Colors.grey,
  primaryColor: Colors.red,
  brightness: Brightness.dark,
  errorColor: Colors.red[800],
  backgroundColor:  Colors.yellow,
  dividerColor: Colors.black12,
);

final lightTheme = ThemeData(
  fontFamily: GoogleFonts.sofiaSans().fontFamily, 
    primaryColor: primaryColor,
   errorColor: Colors.red,
    inputDecorationTheme:
        const InputDecorationTheme(fillColor: Colors.transparent),
   backgroundColor: secondaryColor,
   scaffoldBackgroundColor: secondaryColor,
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      buttonColor: Colors.amber,
    ),
    primaryTextTheme:
        const TextTheme(headline6: TextStyle(color: Colors.white)),
    appBarTheme: const AppBarTheme(
      // toolbarTextStyle:
      //     TextStyle(backgroundColor: Colors.pink, color: Color(0XFF2D2F63)),
      actionsIconTheme: IconThemeData(color: Colors.white),
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,

      elevation: 2,
      titleTextStyle: TextStyle(fontSize:  16),
      foregroundColor: Color(0Xff4D47C7),
      backgroundColor: Colors.white, //Colors.white
    )
    );
