import 'package:cosmetics/core/common/widgets/custom_app_images.dart';
import 'package:cosmetics/core/common/widgets/custom_button.dart';
import 'package:cosmetics/core/helpers/extensions.dart';
import 'package:cosmetics/core/theme/app_colors/light_app_colors.dart';
import 'package:cosmetics/core/theme/app_texts/app_text_styles.dart';
import 'package:cosmetics/core/utils/app_images.dart';
import 'package:cosmetics/core/utils/common_imports.dart';
import 'package:cosmetics/features/auth/presentation/widgets/account_activated_dialog.dart';
import 'package:cosmetics/features/auth/presentation/widgets/otp_field.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final formKey = GlobalKey<FormState>();
  String otpCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(12.h),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        CustomAppImages(
                          imagePath: AppImages.splashLayer1,
                          height: 52.h,
                          width: 60.w,
                        ),
                        40.h.ph,
                        Text(
                          'Verify Code',
                          style: AppTextStyles.font24Bold.copyWith(
                            color: LightAppColors.grey900,
                          ),
                        ),
                        40.h.ph,
                        Text(
                          'We just sent a 4-digit verification code to your email amramer522@gmail.com. Enter the code in the box below to continue.',
                          style: AppTextStyles.font14Regular.copyWith(
                            color: LightAppColors.grey500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        40.h.ph,
                        OtpField(
                          onCompleted: (code) {
                            setState(() {
                              otpCode = code;
                            });
                          },
                        ),
                        Spacer(),
                        CustomButton(
                          text: 'Done',
                          width: 270.w,
                          onTap: () => showDialog(
                            context: context,
                            builder: (context) {
                              return AccountActivatedDialog();
                            },
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
