import 'package:cosmetics/core/common/widgets/custom_button.dart';
import 'package:cosmetics/core/common/widgets/custom_phone_field.dart';
import 'package:cosmetics/core/helpers/app_navigator.dart';
import 'package:cosmetics/core/helpers/extensions.dart';
import 'package:cosmetics/core/utils/common_imports.dart';
import 'package:cosmetics/features/auth/presentation/screens/create_new_password_screen.dart';
import 'package:cosmetics/features/auth/presentation/screens/verify_code_screen.dart';
import 'package:cosmetics/features/auth/presentation/widgets/auth_header_section.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: EdgeInsets.all(12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        AuthHeaderSection(
                          title: 'Forget Password',
                          subTitle:
                              'Please enter your phone number below to recovery your password.',
                        ),
                        40.h.ph,
                        CustomPhoneField(phoneController: phoneController),
                        55.h.ph,
                        CustomButton(
                          onTap: () {
                            AppNavigator.push(
                              context,
                              VerifyCodeScreen(
                                contact: '+20 1022658997',
                                onTap: () {
                                  AppNavigator.push(
                                    context,
                                    CreateNewPasswordScreen(),
                                  );
                                },
                              ),
                            );
                          },
                          text: 'Next',
                          width: 270.w,
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
