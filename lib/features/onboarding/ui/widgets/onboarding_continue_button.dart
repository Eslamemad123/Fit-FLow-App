import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/extensions/localization_extension.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class OnboardingContinueButton extends StatelessWidget {
  const OnboardingContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        minimumSize: const Size(double.infinity, 54),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            LocaleKeys.continue_button.tr(),
            style: AppTextStyles.font16SemiBoldWhite,
          ),
          const SizedBox(width: 8),
          Icon(
            context.isArabic
                ? Icons.arrow_back_rounded
                : Icons.arrow_forward_rounded,
            color: AppColors.white,
            size: 20,
          ),
        ],
      ),
    );
  }
}
