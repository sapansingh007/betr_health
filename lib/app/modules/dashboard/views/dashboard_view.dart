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
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/png/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding:
              const EdgeInsets.symmetric(horizontal: AppSpacing.s24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // App Bar
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage:
                        AssetImage('assets/png/icons/avatar.png'),
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
                      Obx(() => Row(
                        children: [
                          const Icon(Icons.monetization_on,
                              color: Colors.orange),
                          const SizedBox(width: 4),
                          Text(
                            controller.coins.value.toString(),
                            style: const TextStyle(
                                color: Colors.white),
                          ),
                        ],
                      )),
                      const SizedBox(width: 12),
                      const Icon(Icons.notifications,
                          color: Colors.white),
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

                  // Boost Card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF8E44AD),
                          Color(0xFF5B2C83),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.card_giftcard,
                            color: Colors.white),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Tap To Claim\nToday’s Boost!',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios,
                            color: Colors.white, size: 16),
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

                  const Text(
                    'Ongoing Bets',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),

                  const SizedBox(height: 12),

                  SizedBox(
                    height: 450,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, __) => const BetCard(),
                      separatorBuilder: (_, __) =>
                      const SizedBox(width: 16),
                      itemCount: 5,
                    ),
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'Community',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
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

                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: FloatingBottomNav(),
          ),
        ],
      ),
    );
  }
}
