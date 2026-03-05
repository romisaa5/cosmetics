import 'package:cosmetics/core/common/widgets/custom_app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cosmetics/core/helpers/extensions.dart';
import 'package:cosmetics/core/theme/app_colors/light_app_colors.dart';
import 'package:cosmetics/core/theme/app_texts/app_text_styles.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final String icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        18.h.ph,
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              CustomAppImages(imagePath: icon, width: 20.w),
              12.w.pw,
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.font14Regular.copyWith(
                    color: LightAppColors.primary800,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: LightAppColors.primary800,
              ),
            ],
          ),
        ),
        18.h.ph,
      ],
    );
  }
}
