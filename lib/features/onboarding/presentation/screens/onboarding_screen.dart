import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/widgets/app_button.dart';
import '../bloc/onboarding_cubit.dart';

// ─── Page data ────────────────────────────────────────────────────────────────
// Asset sizes (actual exported PNG dimensions):
//   onboarding1_phone.png → 360×800  (full Figma frame — gradient + mockup)
//   onboarding2_phone.png → 360×670  (image area only — 0..670 of 800px frame)
//
// Figma layout:
//   Title:   X=20, Y=46
//   Image:   X=0,  Y=0,   W=360, H=670
//   Content: X=0,  Y=670, W=360, H=130
class _PageData {
  final String image;

  // true  → asset is full 360×800 frame  → scale to fill entire screen
  // false → asset is 360×670 image area  → scale to fill top 670/800 of screen
  final bool isFullFrame;

  // Title text parts
  final String titleNormal;
  final String titleBold;
  final String titleTrailing;

  // Brush underline coords inside the title frame (title frame: X=20, Y=46)
  final double brushLeft; // px from title-frame left edge
  final double brushTop; // px from title-frame top edge
  final double brushWidth; // px

  const _PageData({
    required this.image,
    required this.isFullFrame,
    required this.titleNormal,
    required this.titleBold,
    this.titleTrailing = '',
    required this.brushLeft,
    required this.brushTop,
    required this.brushWidth,
  });
}

// Page definitions (Figma node 470:125 and 470:171)
const _pages = [
  // ── Page 1 ─ "Take a photo to identify the plant!"
  // Asset: 360×800 (full frame) — place at top=0, fill screen
  // Brush: X=179, Y=34, W=136  (within title frame)
  _PageData(
    image: AppConstants.onboarding1Phone,
    isFullFrame: true,
    titleNormal: 'Take a photo to ',
    titleBold: 'identify',
    titleTrailing: '\nthe plant!',
    brushLeft: 179.0,
    brushTop: 34.0,
    brushWidth: 136.0,
  ),

  // ── Page 2 ─ "Get plant care guides"
  // Asset: 360×670 (image area only) — place at top=0, height=670/800 of screen
  // Brush: X=126, Y=33, W=151  (within title frame)
  _PageData(
    image: AppConstants.onboarding2Phone,
    isFullFrame: false,
    titleNormal: 'Get plant ',
    titleBold: 'care guides',
    brushLeft: 126.0,
    brushTop: 33.0,
    brushWidth: 151.0,
  ),
];

// ─── Screen ───────────────────────────────────────────────────────────────────
@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundStart,
        body: BlocConsumer<OnboardingCubit, int>(
          listener: (context, page) {
            _pageController.animateToPage(
              page,
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeInOut,
            );
          },
          builder: (context, currentPage) {
            final size = MediaQuery.sizeOf(context);
            // Clamped: küçük ekranlarda min 120dp, büyük ekranlarda max 150dp
            final buttonAreaH = (size.height * (130.0 / 800.0)).clamp(
              120.0,
              150.0,
            );

            return Stack(
              children: [
                // ── Gradient background — shared, never scrolls ──────────
                // Needed for page 2's button area (Y=670..screen bottom)
                // and as a fallback base layer for page 1.
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.395, 0.899],
                        colors: [
                          AppColors.backgroundStart,
                          AppColors.backgroundEnd,
                        ],
                        transform: GradientRotation(113.8 * 3.14159 / 180),
                      ),
                    ),
                  ),
                ),

                // ── PageView: image assets scroll between pages ──────────
                PageView.builder(
                  controller: _pageController,
                  itemCount: _pages.length,
                  onPageChanged: context.read<OnboardingCubit>().goToPage,
                  itemBuilder: (_, i) =>
                      _ImageArea(data: _pages[i], size: size),
                ),

                // ── Title (rebuilds on page change, no scroll) ───────────
                Positioned(
                  top: MediaQuery.paddingOf(context).top + 22,
                  left: 20,
                  child: _TitleBlock(data: _pages[currentPage]),
                ),

                // ── Bottom: Continue button + page dots ──────────────────
                // Figma: Y=670, H=130 → pinned to screen bottom, adaptive H
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: buttonAreaH + MediaQuery.paddingOf(context).bottom,
                  child: _BottomContent(
                    currentPage: currentPage,
                    onContinue: () {
                      final cubit = context.read<OnboardingCubit>();
                      if (currentPage < OnboardingCubit.pageCount - 1) {
                        cubit.nextPage();
                      } else {
                        context.router.push(const PaywallRoute());
                      }
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// ─── Image area ───────────────────────────────────────────────────────────────
// Page 1 (360×800): covers entire screen → top=0, h=screenH
// Page 2 (360×670): covers image area    → top=0, h=screenH×(670/800)
class _ImageArea extends StatelessWidget {
  final _PageData data;
  final Size size;

  const _ImageArea({required this.data, required this.size});

  @override
  Widget build(BuildContext context) {
    final imgHeight = data.isFullFrame
        ? size.height
        : size.height * (670.0 / 800.0);

    return SizedBox.expand(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: imgHeight,
            child: Image.asset(
              data.image,
              // BoxFit.fill: aspect ratios of 360×800 and screen are very
              // close (~0.45), so distortion is imperceptible.
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Title block with brush underline ────────────────────────────────────────
class _TitleBlock extends StatelessWidget {
  final _PageData data;

  const _TitleBlock({required this.data});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: data.titleNormal,
                style: AppTextStyles.onboardingTitle,
              ),
              TextSpan(
                text: data.titleBold,
                style: AppTextStyles.onboardingTitleBold,
              ),
              if (data.titleTrailing.isNotEmpty)
                TextSpan(
                  text: data.titleTrailing,
                  style: AppTextStyles.onboardingTitle,
                ),
            ],
          ),
        ),

        // Brush underline — Figma exact coords within title frame
        Positioned(
          top: data.brushTop,
          left: data.brushLeft,
          width: data.brushWidth,
          height: 13,
          child: Image.asset(AppConstants.brushUnderline, fit: BoxFit.fill),
        ),
      ],
    );
  }
}

// ─── Bottom: Continue button + animated page dots ─────────────────────────────
class _BottomContent extends StatelessWidget {
  final int currentPage;
  final VoidCallback onContinue;

  const _BottomContent({required this.currentPage, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18, 16, 16, 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppButton(text: 'Continue', onPressed: onContinue),
          const SizedBox(height: 16),
          _PageDots(
            currentPage: currentPage,
            totalPages: OnboardingCubit.pageCount + 1,
          ),
        ],
      ),
    );
  }
}

// ─── Animated page indicator dots
class _PageDots extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const _PageDots({required this.currentPage, required this.totalPages});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(totalPages, (i) {
        final isActive = i == currentPage;
        return Padding(
          padding: EdgeInsets.only(right: i < totalPages - 1 ? 8 : 0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            width: isActive ? 10 : 6,
            height: isActive ? 10 : 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? AppColors.dotActive : AppColors.dotInactive,
            ),
          ),
        );
      }),
    );
  }
}
