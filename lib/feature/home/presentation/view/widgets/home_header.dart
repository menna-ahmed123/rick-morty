import 'package:flutter/material.dart';
import 'package:task/core/constants/home_strings.dart';
import 'package:task/core/resources/app_colors.dart';
import 'package:task/core/resources/app_text_styles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Row(
            children: [
              Icon(
                Icons.description_outlined,
                color: AppColors.primary,
                size: 28,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(HomeStrings.appTitle, style: AppTextStyles.title),
              ),
            ],
          ),
        ),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.file_download_outlined),
          label: const Text(HomeStrings.export, style: AppTextStyles.button),
        ),
      ],
    );
  }
}
