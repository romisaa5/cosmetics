import 'package:cosmetics/core/common/widgets/app_images.dart';
import 'package:cosmetics/core/common/widgets/app_button.dart';
import 'package:cosmetics/core/helpers/extensions.dart';
import 'package:cosmetics/core/theme/app_colors/light_app_colors.dart';
import 'package:cosmetics/core/theme/app_texts/app_text_styles.dart';
import 'package:cosmetics/core/utils/common_imports.dart';
import 'package:cosmetics/views/auth/widgets/otp_field.dart';

class VerifyCodeView extends StatefulWidget {
  const VerifyCodeView({super.key, required this.contact, this.onTap});
  final String contact;
  final void Function()? onTap;

  @override
  State<VerifyCodeView> createState() => _VerifyCodeViewState();
}

class _VerifyCodeViewState extends State<VerifyCodeView> {
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back_ios),
                          ),
                        ),
                        Spacer(),
                        AppImages(
                          imagePath: '/app_logo.png',
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
                          'We just sent a 4-digit verification code to ${widget.contact}. Enter the code in the box below to continue.',
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
                        AppButton(
                          text: 'Done',
                          width: 270.w,
                          onTap: widget.onTap,
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
