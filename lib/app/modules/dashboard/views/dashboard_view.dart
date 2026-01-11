import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_widgets/bet_card.dart';
import '../../../../common_widgets/community_item.dart';
import '../../../../common_widgets/progress_card.dart';
import '../../../../core/floating_bottom_nav.dart';
import '../../../../core/theme/app_spacing.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.coins.value;
      return Scaffold(
        extendBody: true,
        floatingActionButton: Container(
          width: 66,
          height: 66,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF8E44AD), Color(0xFF5B2C83)],
            ),
          ),
          child: const Icon(Icons.add, color: Colors.white, size: 34),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: FloatingBottomNav(),
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset('assets/png/bg.png', fit: BoxFit.cover),
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// ===== HEADER + GREETING =====
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.s24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundImage: AssetImage(
                                  'assets/png/icons/avatar.png',
                                ),
                              ),
                              const Spacer(),
                              const Text(
                                'Dashboard',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacer(),
                              Obx(
                                () => Row(
                                  children: [
                                    const Icon(
                                      Icons.monetization_on,
                                      color: Colors.orange,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      controller.coins.value.toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Icon(
                                Icons.notifications,
                                color: Colors.white,
                              ),
                            ],
                          ),

                          const SizedBox(height: 24),

                          const Text(
                            'Hey Alexandra07 🙌\nReady to Crush Today’s Goal?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          const SizedBox(height: 16),

                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFFB14273), Color(0xFF5D298A)],
                              ),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Row(
                              children:  [
                                Image.asset('assets/png/icons/gift.png', height: 43),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    'Tap To Claim\nToday’s Boost!',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 20),

                          const Text(
                            'Your Progress This Week',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          const SizedBox(height: 12),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              ProgressStatCard(
                                icon: 'assets/png/icons/goals.png',
                                label: 'Active Goals',
                                value: '10',
                              ),
                              ProgressStatCard(
                                icon: 'assets/png/icons/coins.png',
                                label: 'Coins Earned',
                                value: '500',
                              ),
                              ProgressStatCard(
                                icon: 'assets/png/icons/badge.png',
                                label: 'Badges',
                                value: '10',
                              ),
                            ],
                          ),

                          const SizedBox(height: 24),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Ongoing Bets',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              ArrowCircleButton(onTap: () {}),
                            ],
                          ),

                          const SizedBox(height: 12),
                        ],
                      ),
                    ),

                    /// ===== BET CARD (NO PADDING – FULL WIDTH) =====
                    SizedBox(
                      height: 430,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, __) => SizedBox(
                          width:
                              MediaQuery.of(context).size.width -
                              (AppSpacing.s24 * 2),
                          child: const BetCard(),
                        ),
                        separatorBuilder: (_, __) => const SizedBox(width: 16),
                        itemCount: 5,
                      ),
                    ),

                    const SizedBox(height: 24),

                    /// ===== COMMUNITY =====
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.s24,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Community',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              ArrowCircleButton(onTap: () {}),
                            ],
                          ),

                          const SizedBox(height: 12),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              CommunityItem(
                                icon: 'assets/png/icons/lose_weight.png',
                                label: 'Lose weight',
                              ),
                              CommunityItem(
                                icon: 'assets/png/icons/lifting.png',
                                label: 'Lifting',
                              ),
                              CommunityItem(
                                icon: 'assets/png/icons/strength.png',
                                label: 'Strength',
                              ),
                              CommunityItem(
                                icon: 'assets/png/icons/cycling.png',
                                label: 'Cycling',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class ArrowCircleButton extends StatelessWidget {
  final VoidCallback? onTap;

  const ArrowCircleButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.08),
        ),
        child: const Center(
          child: Icon(Icons.arrow_forward, color: Colors.white, size: 18),
        ),
      ),
    );
  }
}
