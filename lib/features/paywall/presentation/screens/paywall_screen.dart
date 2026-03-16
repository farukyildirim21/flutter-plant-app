import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/router/app_router.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../onboarding/domain/repositories/onboarding_repository.dart';
import '../bloc/paywall_cubit.dart';

// Onboarding tamamlandı → flag kaydet, Home'a git
Future<void> _completeOnboarding(BuildContext context) async {
  await context.read<OnboardingRepository>().completeOnboarding();
  if (context.mounted) {
    context.router.replaceAll([const HomeRoute()]);
  }
}

// ─── Screen ───────────────────────────────────────────────────────────────────
@RoutePage()
class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PaywallCubit(),
      child: const _PaywallView(),
    );
  }
}

class _PaywallView extends StatelessWidget {
  const _PaywallView();

  static const double _figmaH = 800.0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: const Color(0xFF101E17),
      body: Stack(
        children: [
          // ── Background image (top 465/800 of screen) ─────────────────────
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: size.height * (465.0 / _figmaH),
            child: Image.asset(AppConstants.paywallBg, fit: BoxFit.cover),
          ),

          // ── Scrollable content ────────────────────────────────────────────
          SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Space for the image area overlap (content starts at Y=276)
                SizedBox(height: size.height * (276.0 / _figmaH)),
                _ContentSection(),
                const SizedBox(height: 24),
              ],
            ),
          ),

          // ── Close button (Figma: X=316, Y=38 → right=20, top=38) ─────────
          Positioned(top: 38, right: 20, child: _CloseButton()),
        ],
      ),
    );
  }
}

// ─── Content ──────────────────────────────────────────────────────────────────
class _ContentSection extends StatelessWidget {
  const _ContentSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title + subtitle
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: _TitleSection(),
        ),

        const SizedBox(height: 24),

        // Feature cards — 20px left padding, can scroll right
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: _FeaturesSection(),
        ),

        const SizedBox(height: 24),

        // Plan options
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: _PlanOptions(),
        ),

        const SizedBox(height: 24),

        // CTA + disclaimers
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: _CTASection(),
        ),
      ],
    );
  }
}

// ─── Title: "PlantApp Premium" + "Access All Features" ───────────────────────
class _TitleSection extends StatelessWidget {
  const _TitleSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(text: 'PlantApp', style: AppTextStyles.premiumTitleBold),
              TextSpan(text: ' Premium', style: AppTextStyles.premiumTitle),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Access All Features',
          style: AppTextStyles.featureTitle.copyWith(
            fontSize: 17,
            fontWeight: FontWeight.w300,
            color: const Color(0xB2FFFFFF),
          ),
        ),
      ],
    );
  }
}

// ─── Feature cards (horizontal scroll) ───────────────────────────────────────
class _FeatureData {
  final String? iconAsset;
  final IconData? iconFallback;
  final String title;
  final String subtitle;

  const _FeatureData({
    this.iconAsset,
    this.iconFallback,
    required this.title,
    required this.subtitle,
  });
}

const _features = [
  _FeatureData(
    iconAsset: AppConstants.iconUnlimited,
    title: 'Unlimited',
    subtitle: 'Plant Identify',
  ),
  _FeatureData(
    iconAsset: AppConstants.iconFaster,
    title: 'Faster',
    subtitle: 'Process',
  ),
  _FeatureData(
    iconFallback: Icons.spa_outlined,
    title: 'Detailed',
    subtitle: 'Plant care',
  ),
];

class _FeaturesSection extends StatelessWidget {
  const _FeaturesSection();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(_features.length, (i) {
          return Padding(
            padding: EdgeInsets.only(right: i < _features.length - 1 ? 8 : 20),
            child: _FeatureCard(data: _features[i]),
          );
        }),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final _FeatureData data;

  const _FeatureCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          width: 155,
          padding: const EdgeInsets.fromLTRB(16, 16, 42, 16),
          decoration: BoxDecoration(
            color: AppColors.featureCard,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon container — 36×36 with 9px padding → 18×18 icon (Figma spec)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 36,
                  height: 36,
                  color: const Color(0x3D000000),
                  padding: const EdgeInsets.all(9),
                  child: data.iconAsset != null
                      ? Image.asset(data.iconAsset!, fit: BoxFit.contain)
                      : Icon(
                          data.iconFallback,
                          color: Colors.white,
                          size: 18,
                        ),
                ),
              ),
              const SizedBox(height: 10),
              // Texts — softWrap: false matches Figma whitespace-nowrap
              Text(
                data.title,
                style: AppTextStyles.featureTitle,
                softWrap: false,
              ),
              const SizedBox(height: 4),
              Text(
                data.subtitle,
                style: AppTextStyles.featureSubtitle,
                softWrap: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Plan options ─────────────────────────────────────────────────────────────
class _PlanOptions extends StatelessWidget {
  const _PlanOptions();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaywallCubit, int>(
      builder: (context, selectedPlan) {
        return Column(
          children: [
            _PlanOption(
              isSelected: selectedPlan == 0,
              title: '1 Month',
              // "$2.99/month" → Light (w300), ", auto renewable" → Regular (w400)
              subtitleSpan: const TextSpan(
                children: [
                  TextSpan(
                    text: '\$2.99/month',
                    style: AppTextStyles.optionSubtitle,
                  ),
                  TextSpan(
                    text: ', auto renewable',
                    style: AppTextStyles.optionSubtitleRegular,
                  ),
                ],
              ),
              onTap: () => context.read<PaywallCubit>().selectPlan(0),
            ),
            const SizedBox(height: 16),
            _PlanOption(
              isSelected: selectedPlan == 1,
              title: '1 Year',
              // Single style: Regular (w400)
              subtitleSpan: const TextSpan(
                text: 'First 3 days free, then \$529,99/year',
                style: AppTextStyles.optionSubtitleRegular,
              ),
              badgeText: 'Save 50%',
              onTap: () => context.read<PaywallCubit>().selectPlan(1),
            ),
          ],
        );
      },
    );
  }
}

class _PlanOption extends StatelessWidget {
  final bool isSelected;
  final String title;
  final InlineSpan subtitleSpan;
  final String? badgeText;
  final VoidCallback onTap;

  const _PlanOption({
    required this.isSelected,
    required this.title,
    required this.subtitleSpan,
    this.badgeText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Stack(
            children: [
              // Card background
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primary
                        : AppColors.paywallBorder,
                    width: isSelected ? 1.5 : 0.5,
                  ),
                  gradient: isSelected
                      ? const LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Color(0x2B28AF6E), // rgba(40,175,110,0.168)
                            Color(0x0028AF6E), // transparent
                          ],
                          stops: [0.0, 0.685],
                        )
                      : null,
                  color: isSelected ? null : AppColors.paywallCard,
                ),
                child: Row(
                  children: [
                    // Radio indicator
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primary
                              : const Color(0x4DFFFFFF),
                          width: 1.5,
                        ),
                        color: isSelected
                            ? AppColors.primary
                            : Colors.transparent,
                      ),
                      child: isSelected
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 14,
                            )
                          : null,
                    ),
                    const SizedBox(width: 12),
                    // Plan text
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title, style: AppTextStyles.optionTitle),
                          const SizedBox(height: 2),
                          Text.rich(subtitleSpan),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // "Save 50%" badge (yearly only)
              if (badgeText != null)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(14),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: Text(
                      badgeText!,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        height: 18 / 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── CTA: button + disclaimers ────────────────────────────────────────────────
class _CTASection extends StatelessWidget {
  const _CTASection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(
          text: 'Try free for 3 days',
          onPressed: () => _completeOnboarding(context),
        ),
        const SizedBox(height: 10),
        Text(
          "After the 3-day free trial period you'll be charged ₺274.99 per year "
          "unless you cancel before the trial expires. "
          "Yearly Subscription is Auto-Renewable",
          style: AppTextStyles.paywallDisclaimer,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Terms  •  Privacy  •  Restore',
          style: AppTextStyles.paywallDisclaimer.copyWith(
            color: const Color(0x80FFFFFF),
            fontSize: 11,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

// ─── Close button ─────────────────────────────────────────────────────────────
class _CloseButton extends StatelessWidget {
  const _CloseButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _completeOnboarding(context),
      child: Container(
        width: 24,
        height: 24,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0x4D000000),
        ),
        child: const Icon(Icons.close, color: Colors.white, size: 14),
      ),
    );
  }
}
