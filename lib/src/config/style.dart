import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/src/config/extension.dart';

var headerStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w500, fontSize: 20.sp, color: Colors.black);

var subheader_01Style = GoogleFonts.inter(
    fontWeight: FontWeight.w400, fontSize: 14.sp, color: Colors.black);

var subheader_02Style = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 10.sp,
    color: const Color(0xff5F607E));

class ColorStore {
  static const Color bgColor1 = Color(0xff706CFF);
  static const Color bgColor2 = Color(0xffF5F5F5);
  static const Color bgColor3 = Color(0xffFF9C37);
}

class Constant {
  static const String token = 'token';
}
