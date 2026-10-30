import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class AvailabilityPill extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback? onTap;

  const AvailabilityPill({
    super.key,
    required this.text,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: isSelected
                ? AppTextStyles.font14Medium.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  )
                : AppTextStyles.font14Medium.copyWith(
                    color: AppColors.textGrey,
                    fontWeight: FontWeight.w500,
                  ),
          ),
        ),
      ),
    );
  }
}
