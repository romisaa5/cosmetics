import 'package:cosmetics/core/common/widgets/custom_app_images.dart';
import 'package:cosmetics/core/utils/app_icons.dart';
import 'package:cosmetics/features/profile/presentation/widgets/profile_item.dart';
import 'package:cosmetics/core/helpers/extensions.dart';
import 'package:cosmetics/core/theme/app_colors/light_app_colors.dart';
import 'package:cosmetics/core/theme/app_texts/app_text_styles.dart';
import 'package:cosmetics/core/utils/common_imports.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 160.h,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff434C6D).withValues(alpha: .83),
                    Color(0xffECA4C5).withValues(alpha: .8),
                    Color(0xffECA4C5),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 60.h,
                width: MediaQuery.of(context).size.width,
                color: LightAppColors.background,
              ),
            ),
            Positioned(
              top: 60.h,
              child: CircleAvatar(
                radius: 50.r,
                backgroundColor: LightAppColors.grey200,
                child: Icon(
                  Icons.person,
                  size: 40.sp,
                  color: LightAppColors.primary800,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              12.h.ph,
              Text(
                "Sara Samer Talaat",
                style: AppTextStyles.font16SemiBold.copyWith(
                  color: LightAppColors.primary800,
                ),
              ),
              32.h.ph,
              ProfileItem(
                icon: AppIcons.editInfo,
                title: "Edit Info",
                onTap: () {},
              ),
              ProfileItem(
                icon: AppIcons.orderHistory,
                title: "Order history",
                onTap: () {},
              ),
              ProfileItem(icon: AppIcons.wallet, title: "Wallet", onTap: () {}),
              ProfileItem(
                icon: AppIcons.settings,
                title: "Settings",
                onTap: () {},
              ),
              ProfileItem(
                icon: AppIcons.voucher,
                title: "Voucher",
                onTap: () {},
              ),
              20.h.ph,
              Row(
                children: [
                  CustomAppImages(imagePath: AppIcons.logout, width: 20.w),
                  8.w.pw,
                  Text(
                    "Logout",
                    style: AppTextStyles.font14SemiBold.copyWith(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
