import 'package:cosmetics/core/common/widgets/custom_app_images.dart';
import 'package:cosmetics/core/common/widgets/custom_button.dart';
import 'package:cosmetics/core/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cosmetics/core/theme/app_colors/light_app_colors.dart';
import 'package:cosmetics/core/theme/app_texts/app_text_styles.dart';

class AccountActivatedDialog extends StatelessWidget {
  const AccountActivatedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      backgroundColor: LightAppColors.background,
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomAppImages(imagePath: AppIcons.done),
            SizedBox(height: 20.h),
            Text(
              'Account Activated!',
              style: AppTextStyles.font16SemiBold.copyWith(
                color: LightAppColors.grey900,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.h),
            Text(
              'Congratulations! Your account has been successfully activated',
              style: AppTextStyles.font12Regular.copyWith(
                color: LightAppColors.grey600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 25.h),
            CustomButton(
              text: 'Go to home',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
