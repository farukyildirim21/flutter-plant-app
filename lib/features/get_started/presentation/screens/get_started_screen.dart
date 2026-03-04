import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/widgets/app_button.dart';

@RoutePage()
class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  // Figma frame: 360×800 | Image area: 360×670 (top) | Button area: 130 (bottom)
  // Clamped so small screens get at least 120dp and large screens at most 150dp.
  static double _buttonAreaH(BuildContext context) =>
      (MediaQuery.sizeOf(context).height * (130.0 / 800.0)).clamp(120.0, 150.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.395, 0.899],
            colors: [AppColors.backgroundStart, AppColors.backgroundEnd],
            transform: GradientRotation(113.8 * 3.14159 / 180),
          ),
        ),
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Positioned(
              top: -14.0 * MediaQuery.sizeOf(context).width / 360.0,
              left: 0,
              right: 0,
              bottom:
                  _buttonAreaH(context) + MediaQuery.paddingOf(context).bottom,
              // BoxFit.cover: takes max(widthScale, heightScale) → always fills
              // the container with no gap, no distortion, minimal edge crop.
              // topCenter alignment keeps the plant top position stable.
              child: Image.asset(
                AppConstants.getStartedPlant,
                fit: BoxFit.cover,
                //  alignment: Alignment.topCenter,
              ),
            ),

            // ── Title & subtitle ──────────────────────────────────────────────
            Positioned(
              top: MediaQuery.paddingOf(context).top + 22,
              left: 20,
              right: 20,

              child: const _TitleBlock(),
            ),

            // ── Button area (pinned to bottom) ────────────────────────────────
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height:
                  _buttonAreaH(context) + MediaQuery.paddingOf(context).bottom,
              child: _BottomContent(
                onPressed: () => context.router.push(const OnboardingRoute()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Title block ──────────────────────────────────────────────────────────────
class _TitleBlock extends StatelessWidget {
  const _TitleBlock();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(text: 'Welcome to ', style: AppTextStyles.welcomeNormal),
              TextSpan(text: 'PlantApp', style: AppTextStyles.welcomeSemiBold),
            ],
          ),
        ),
        const SizedBox(height: 8),
        const SizedBox(
          child: Text(
            'Identify more than 3000+ plants and 88% accuracy.',
            style: AppTextStyles.subtitle,
          ),
        ),
      ],
    );
  }
}

// ─── Bottom content: AppButton + disclaimer ───────────────────────────────────
class _BottomContent extends StatelessWidget {
  final VoidCallback onPressed;
  const _BottomContent({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    //  final bottomInset = MediaQuery.paddingOf(context).bottom;
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 18, 20, 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppButton(text: 'Get Started', onPressed: onPressed),
          const SizedBox(height: 16),
          const _DisclaimerText(),
        ],
      ),
    );
  }
}

// ─── Disclaimer ───────────────────────────────────────────────────────────────
class _DisclaimerText extends StatelessWidget {
  const _DisclaimerText();

  @override
  Widget build(BuildContext context) {
    final linkStyle = AppTextStyles.disclaimer.copyWith(
      decoration: TextDecoration.underline,
      decorationColor: AppColors.disclaimerText,
    );

    return SizedBox(
      width: MediaQuery.sizeOf(context).width * (232.0 / 360.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: AppTextStyles.disclaimer,
          children: [
            const TextSpan(
              text: 'By tapping next, you are agreeing to PlantID\n',
            ),
            TextSpan(text: 'Terms of Use', style: linkStyle),
            const TextSpan(text: ' & '),
            TextSpan(text: 'Privacy Policy', style: linkStyle),
            const TextSpan(text: '.'),
          ],
        ),
      ),
    );
  }
}
