import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/network/dio_client.dart';
import '../../data/models/category_model.dart';
import '../../data/models/question_model.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../bloc/home_cubit.dart';
import '../bloc/home_state.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour >= 6 && hour < 12) return 'Good Morning ☀️';
    if (hour >= 12 && hour < 18) return 'Good Afternoon ⛅';
    if (hour >= 18 && hour < 22) return 'Good Evening 🌆';
    return 'Good Night 🌙';
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(HomeRepositoryImpl(DioClient.instance)),
      child: Scaffold(
        backgroundColor: AppColors.backgroundStart,
        extendBody: true,
        body: IndexedStack(
          index: _selectedTab,
          children: [
            _HomeContent(greeting: _getGreeting()),
            const SizedBox(),
            const SizedBox(),
            const SizedBox(),
            const SizedBox(),
          ],
        ),
        bottomNavigationBar: _CustomTabBar(
          selectedIndex: _selectedTab,
          onTap: (index) => setState(() => _selectedTab = index),
        ),
      ),
    );
  }
}

// --- Home content ---

class _HomeContent extends StatelessWidget {
  const _HomeContent({required this.greeting});
  final String greeting;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _HeaderSection(greeting: greeting),
          const SizedBox(height: 24),
          const _PremiumBox(),
          const SizedBox(height: 24),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return state.when(
                initial: () => const SizedBox(),
                loading: () => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 48),
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (msg) => Padding(
                  padding: const EdgeInsets.all(24),
                  child: Center(child: Text(msg)),
                ),
                loaded: (categories, questions) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _QuestionCards(questions: questions),
                    const SizedBox(height: 24),
                    _CategoryGrid(categories: categories),
                    const SizedBox(height: 120),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// --- Header ---

class _HeaderSection extends StatelessWidget {
  const _HeaderSection({required this.greeting});
  final String greeting;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AppConstants.homeSectionBg, fit: BoxFit.cover),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Hi, plant lover! ', style: AppTextStyles.greeting),
                      const SizedBox(height: 4),
                      Text(greeting, style: AppTextStyles.greetingBold),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 16),
                child: _SearchBar(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: AppColors.searchBar,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          const Icon(Icons.search_outlined, color: Color(0xFFAFAFAF), size: 20),
          const SizedBox(width: 8),
          Text('Search for plants', style: AppTextStyles.searchHint),
        ],
      ),
    );
  }
}

// --- Premium box ---

class _PremiumBox extends StatelessWidget {
  const _PremiumBox();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 64,
        padding: const EdgeInsets.only(
          left: 16,
          right: 10,
          top: 10,
          bottom: 10,
        ),
        decoration: BoxDecoration(
          color: AppColors.premiumBox,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Envelope icon — badge is baked into the asset
            Image.asset(AppConstants.infoIcon, width: 40, height: 40),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFFE5C990), Color(0xFFE4B046)],
                    ).createShader(bounds),
                    child: const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'FREE',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              height: 21 / 16,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: ' Premium Available',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              height: 21 / 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xCCFFDE9C), Color(0xCCF5C25B)],
                    ).createShader(bounds),
                    child: const Text(
                      'Tap to upgrade your account!',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        height: 16 / 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(AppConstants.arrowIcon, width: 24, height: 24),
          ],
        ),
      ),
    );
  }
}

// --- Question cards ---

class _QuestionCards extends StatelessWidget {
  const _QuestionCards({required this.questions});
  final List<QuestionModel> questions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 164,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 20),
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: _QuestionCard(question: questions[index]),
          );
        },
      ),
    );
  }
}

class _QuestionCard extends StatelessWidget {
  const _QuestionCard({required this.question});
  final QuestionModel question;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: 240,
        height: 164,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              question.imageUri,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  Container(color: Colors.grey.shade300),
            ),
            Container(color: Colors.black.withValues(alpha: 0.15)),
            // Footer — fixed 60px height, frosted glass
            // Border is on the outer Container so it doesn't double up with
            // the ClipRect's sharp blur boundary.
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 60,
              child: Container(
                decoration: const BoxDecoration(),
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                    child: Container(
                      //color: const Color(0x33000000),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      child: Text(
                        question.title,
                        style: AppTextStyles.questionTitle,

                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Category grid ---

class _CategoryGrid extends StatelessWidget {
  const _CategoryGrid({required this.categories});
  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) =>
            _CategoryCard(category: categories[index]),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.white, Color(0xFFF9FFFA)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0x193C3C43), width: 0.5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            // Plant image from API — right-aligned, fills height
            Positioned(
              right: -10,
              bottom: 0,
              top: -10,
              child: Image.network(
                category.image.url,
                fit: BoxFit.contain,
                alignment: Alignment.bottomRight,
                errorBuilder: (_, __, ___) => const SizedBox(),
              ),
            ),
            // Category name — top-left
            Positioned(
              top: 16,
              left: 16,
              right: 72,
              child: Text(
                category.title,
                style: AppTextStyles.categoryTitle,
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Custom tab bar ---

class _CustomTabBar extends StatelessWidget {
  const _CustomTabBar({required this.selectedIndex, required this.onTap});
  final int selectedIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Blurred background
          Positioned.fill(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 22.5, sigmaY: 22.5),
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.tabBar,
                    border: Border(
                      top: BorderSide(
                        color: AppColors.tabBarBorder,
                        width: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Left group: Home + Diagnose
          Positioned(
            left: 0,
            top: 9,
            child: Row(
              children: [
                _TabItem(
                  icon: AppConstants.homeIcon,
                  label: 'Home',
                  index: 0,
                  selectedIndex: selectedIndex,
                  onTap: onTap,
                ),
                const SizedBox(width: 2),
                _TabItem(
                  icon: AppConstants.diagnoseIcon,
                  label: 'Diagnose',
                  index: 1,
                  selectedIndex: selectedIndex,
                  onTap: onTap,
                ),
              ],
            ),
          ),
          // Right group: My Garden + Profile
          Positioned(
            right: 0,
            top: 9,
            child: Row(
              children: [
                _TabItem(
                  icon: AppConstants.myGardenIcon,
                  label: 'My Garden',
                  index: 3,
                  selectedIndex: selectedIndex,
                  onTap: onTap,
                ),
                const SizedBox(width: 2),
                _TabItem(
                  icon: AppConstants.profileIcon,
                  label: 'Profile',
                  index: 4,
                  selectedIndex: selectedIndex,
                  onTap: onTap,
                ),
              ],
            ),
          ),
          // Identify button — 66×66, top:-29 per Figma
          Positioned(
            top: -29,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () => onTap(2),
                behavior: HitTestBehavior.opaque,
                child: Container(
                  width: 66,
                  height: 66,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF28AF6E), Color(0xFF2CCC80)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.24),
                      width: 4,
                    ),
                  ),
                  child: Image.asset(
                    AppConstants.identifyIcon,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  const _TabItem({
    required this.icon,
    required this.label,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  });

  final String icon;
  final String label;
  final int index;
  final int selectedIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final isActive = selectedIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 74,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 4),
            Image.asset(
              icon,
              width: 26,
              height: 26,
              color: isActive ? AppColors.primary : const Color(0xFFBDBDBD),
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: isActive
                  ? AppTextStyles.tabLabelActive
                  : AppTextStyles.tabLabel,
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
