import 'package:flutter/material.dart';
import 'package:task/core/resources/app_colors.dart';
import 'package:task/core/resources/app_text_styles.dart';
import 'package:task/feature/home/domain/entities/character_entity.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key, required this.character});

  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    final Color statusColor = _statusColor();
    final Color statusBackground = _statusBackground();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.lightGrey),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.network(
              character.image,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(character.name, style: AppTextStyles.characterName),
                const SizedBox(height: 8),
                Text(
                  'Species: ${character.species}',
                  style: AppTextStyles.body,
                ),
                const SizedBox(height: 4),
                Text('Gender: ${character.gender}', style: AppTextStyles.body),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: statusBackground,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              character.status,
              style: AppTextStyles.status.copyWith(color: statusColor),
            ),
          ),
        ],
      ),
    );
  }

  Color _statusColor() {
    switch (character.status.toLowerCase()) {
      case 'alive':
        return AppColors.alive;
      case 'dead':
        return AppColors.dead;
      default:
        return AppColors.unknown;
    }
  }

  Color _statusBackground() {
    switch (character.status.toLowerCase()) {
      case 'alive':
        return AppColors.aliveBackground;
      case 'dead':
        return AppColors.deadBackground;
      default:
        return AppColors.unknownBackground;
    }
  }
}
