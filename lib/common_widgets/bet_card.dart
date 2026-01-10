import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class BetCard extends StatelessWidget {
  const BetCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF2C1A4A),
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              const CircleAvatar(
                radius: 22,
                backgroundImage:
                AssetImage('assets/images/user.png'),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Alex Watson',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Lose Weight',
                    style: TextStyle(
                      color: Color(0xFFB8AFC9),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 14),

          // Odds Badge
          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFD64E8A),
                  Color(0xFF7E3DBF),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Predicted Success Odds 60%',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          const SizedBox(height: 14),

          // Title
          const Text(
            'Slim Down Thighs',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 8),

          // Description
          const Text(
            'You’ve challenged yourself to lose 10 pounds this month. '
                'Based on your fitness data, Coach Sandow AI predicts you '
                'have a 70% chance.',
            style: TextStyle(
              color: Color(0xFFB8AFC9),
              fontSize: 13,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 14),

          // Chips
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              _InfoChip('1 Month Bet Old'),
              _InfoChip('Daily Steps 8000'),
              _InfoChip('Feeling : Great'),
              _InfoChip('Wager : 10c'),
              _InfoChip('Target Value : 3kg'),
              _InfoChip('Lose Weight : 10kg Chance'),
            ],
          ),

          const SizedBox(height: 18),

          // Buttons
          Row(
            children: [
              Expanded(
                child: _GradientButton(
                  title: 'Place Bet',
                  colors: [
                    Color(0xFFE54312),
                    Color(0xFFDE292F),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _GradientButton(
                  title: 'Bet Against',
                  colors: [
                    Color(0xFF1E90FF),
                    Color(0xFF00BFFF),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class _InfoChip extends StatelessWidget {
  final String text;
  const _InfoChip(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF3A255F),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
        ),
      ),
    );
  }
}

class _GradientButton extends StatelessWidget {
  final String title;
  final List<Color> colors;

  const _GradientButton({
    required this.title,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors),
        borderRadius: BorderRadius.circular(18),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
