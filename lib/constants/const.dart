import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String imageBaseUrl =
    'http://sampleserver.org/starmath/uploads/thumbnails/topic_thumbnails/';
const String hintImageBaseUrl =
    'http://sampleserver.org/starmath/uploads/hint/';

const kOrangeColor = const Color(0xFFFC6A57);
const kBlueLightColor = const Color(0xFF007EFF);
const kRedDarkColor = const Color(0xFFFB4E4E);
const kYellowColor = const Color(0xFFF6A609);
const kGreenLightColor = const Color(0xFF2AC769);
const kDarkBlack1Color = const Color(0xFF25282B);
const kDarkBlack2Color = const Color(0xFF52575C);
const kDarkGrey1Color = const Color(0xFFA0A4A8);
const kDarkGrey2Color = const Color(0xFFCACCCF);
const kLightGrey1Color = const Color(0xFFE8E8E8);
const kLightGrey2Color = const Color(0xFFF8F8FA);
const kWhiteColor = const Color(0xFFFFFFFF);
const kBlackColor = const Color(0xFF000000);

const kPrimaryColor = const Color(0xFF449534);
const kErrorColor = const Color(0xFFFF6262);
const kAccentColor = const Color(0xFF60D749);
const kPrimaryTextColor = const Color(0xFF373738);
const kAccentTextColor = const Color(0xFF737373);
const kBackgroundColor = const Color(0xFFFBFAF9);

final TextTheme kTextTheme = TextTheme(
  // headline1: GoogleFonts.inter(
  //     fontSize: 93, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  // headline2: GoogleFonts.inter(
  //     fontSize: 58, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  // headline3: GoogleFonts.inter(fontSize: 47, fontWeight: FontWeight.w400),
  // headline4: GoogleFonts.inter(
  //     fontSize: 33, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.inter(
    fontSize: 23,
    fontWeight: FontWeight.w700,
    color: kDarkBlack1Color,
  ),
  // headline6: GoogleFonts.inter(
  //     fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: kDarkBlack2Color,
    letterSpacing: 0.15,
  ),
  // subtitle2: GoogleFonts.inter(
  //     fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    color: kDarkGrey1Color,
  ),
  // bodyText2: GoogleFonts.inter(
  //     fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: kWhiteColor,
    letterSpacing: 1.25,
  ),
  // caption: GoogleFonts.inter(
  //     fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  // overline: GoogleFonts.inter(
  //     fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
