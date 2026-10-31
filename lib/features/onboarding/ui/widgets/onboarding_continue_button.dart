import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/extensions/localization_extension.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class OnboardingContinueButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;

  const OnboardingContinueButton({
    super.key,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.7),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        minimumSize: const Size(double.infinity, 54),
      ),
      child: isLoading
          ? const SizedBox(
              width: 22,
              height: 22,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
              ),
            )
          : Row(
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
