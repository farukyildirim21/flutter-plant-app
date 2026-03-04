import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // Get Started
  static const TextStyle welcomeNormal = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: 28,
    color: AppColors.mainText,
  );

  static const TextStyle welcomeSemiBold = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w600,
    fontSize: 28,
    color: AppColors.mainText,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 22 / 16,
    color: Color(0xB313231B),
  );

  // Onboarding
  static const TextStyle onboardingTitle = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: 28,
    height: 1.2,
    letterSpacing: -1,
    color: AppColors.mainText,
  );

  static const TextStyle onboardingTitleBold = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w800,
    fontSize: 28,
    height: 1.2,
    letterSpacing: -1,
    color: AppColors.mainText,
  );

  static const TextStyle onboardingSubtitle = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: 15,
    height: 22 / 15,
    color: Color(0x8013231B),
  );

  // Button
  static const TextStyle buttonText = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w600,
    fontSize: 16,
    height: 24 / 16,
    color: AppColors.white,
  );

  // Disclaimer
  static const TextStyle disclaimer = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: 11,
    height: 15 / 11,
    color: AppColors.disclaimerText,
  );

  // Tab Bar
  static const TextStyle tabLabel = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: 11,
    letterSpacing: -0.24,
    color: Color(0xFF979798),
  );

  static const TextStyle tabLabelActive = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: 11,
    letterSpacing: -0.24,
    color: AppColors.primary,
  );

  // Home
  static const TextStyle greeting = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: AppColors.mainText,
  );

  static const TextStyle greetingBold = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: 24,
    height: 28 / 24,
    color: AppColors.mainText,
  );

  static const TextStyle searchHint = TextStyle(
    fontFamily: 'Rubik',
    fontWeight: FontWeight.w400,
    fontSize: 15.5,
    letterSpacing: 0.07,
    color: Color(0xFFAFAFAF),
  );

  static const TextStyle sectionTitle = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: 15,
    height: 18 / 15,
    color: AppColors.mainText,
  );

  // Paywall
  static const TextStyle premiumTitle = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w300,
    fontSize: 27,
    color: AppColors.white,
  );

  static const TextStyle premiumTitleBold = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
    fontSize: 27,
    color: AppColors.white,
  );

  static const TextStyle featureTitle = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: 20,
    height: 24 / 20,
    letterSpacing: 0.38,
    color: AppColors.white,
  );

  static const TextStyle featureSubtitle = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,

    fontSize: 13,
    height: 18 / 13,
    letterSpacing: -0.08,
    color: Color(0xB2FFFFFF),
  );

  static const TextStyle optionTitle = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: AppColors.white,
  );

  // "$2.99/month" part → Light
  static const TextStyle optionSubtitle = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w300,
    fontSize: 12,
    color: Color(0xB2FFFFFF),
  );

  // ", auto renewable" part + 1 Year subtitle → Regular
  static const TextStyle optionSubtitleRegular = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: Color(0xB2FFFFFF),
  );

  static const TextStyle paywallDisclaimer = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w300,
    fontSize: 9,
    height: 1.32,
    color: Color(0x85FFFFFF),
  );

  // Category
  static const TextStyle categoryTitle = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 21 / 16,
    color: AppColors.mainText,
  );

  // Question card
  static const TextStyle questionTitle = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: 15,
    height: 18 / 15,
    color: AppColors.white,
  );
}
