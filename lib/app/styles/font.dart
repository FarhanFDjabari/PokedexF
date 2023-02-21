import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme textTheme = TextTheme(
  displayLarge: GoogleFonts.poppins().copyWith(
      fontSize: 69.sp, fontWeight: FontWeight.bold, letterSpacing: 0.63.sp),
  displayMedium: GoogleFonts.poppins().copyWith(
      fontSize: 63.sp, fontWeight: FontWeight.bold, letterSpacing: 0.63.sp),
  displaySmall: GoogleFonts.poppins().copyWith(
      fontSize: 56.sp, fontWeight: FontWeight.bold, letterSpacing: 0.63.sp),
  headlineMedium: GoogleFonts.poppins().copyWith(
      fontSize: 50.sp, fontWeight: FontWeight.bold, letterSpacing: 0.63.sp),
  headlineSmall: GoogleFonts.poppins().copyWith(
      fontSize: 44.sp, fontWeight: FontWeight.bold, letterSpacing: 0.63.sp),
  titleLarge: GoogleFonts.poppins().copyWith(
      fontSize: 38.sp, fontWeight: FontWeight.bold, letterSpacing: 0.63.sp),
  bodyLarge: GoogleFonts.poppins().copyWith(
      fontSize: 38.sp, fontWeight: FontWeight.w700, letterSpacing: 0.5.sp),
  bodyMedium:
      GoogleFonts.poppins().copyWith(fontSize: 38.sp, letterSpacing: 0.5.sp),
  titleMedium: GoogleFonts.poppins(
      fontSize: 36.sp, fontWeight: FontWeight.w700, letterSpacing: 0.5.sp),
  titleSmall: GoogleFonts.poppins(fontSize: 36.sp, letterSpacing: 0.5.sp),
  bodySmall: GoogleFonts.poppins(fontSize: 30.sp, letterSpacing: 0.5.sp),
  labelLarge: GoogleFonts.poppins(
      fontSize: 35.sp, letterSpacing: 0.63.sp, fontWeight: FontWeight.bold),
  labelSmall: GoogleFonts.poppins(
    fontSize: 28.sp,
    letterSpacing: 0.63.sp,
  ),
);
