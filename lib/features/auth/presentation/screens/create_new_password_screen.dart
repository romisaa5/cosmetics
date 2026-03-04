import 'package:cosmetics/core/common/widgets/custom_button.dart';
import 'package:cosmetics/core/common/widgets/custom_text_form_field.dart';
import 'package:cosmetics/core/helpers/app_validators.dart';
import 'package:cosmetics/core/helpers/extensions.dart';
import 'package:cosmetics/core/utils/common_imports.dart';
import 'package:cosmetics/features/auth/presentation/widgets/auth_header_section.dart';
import 'package:cosmetics/features/auth/presentation/widgets/success_dialog.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final passwordContoller = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isPasswordObscure = true;
  bool isConfirmPasswordObscure = true;

  @override
  void dispose() {
    passwordContoller.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

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
                        40.h.ph,
                        Flexible(
                          child: AuthHeaderSection(
                            title: 'Create Password',
                            subTitle:
                                'The password should have at least 6 characters.',
                          ),
                        ),
                        62.h.ph,
                        AppTextFormField(
                          labelText: 'Create your password',
                          controller: passwordContoller,
                          isObscureText: isPasswordObscure,
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                isPasswordObscure = !isPasswordObscure;
                              });
                            },
                          ),
                          validator: AppValidators.password,
                        ),
                        16.h.ph,
                        AppTextFormField(
                          labelText: 'Confirm password',
                          controller: confirmPasswordController,
                          isObscureText: isConfirmPasswordObscure,
                          suffixIcon: IconButton(
                            icon: Icon(
                              isConfirmPasswordObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                isConfirmPasswordObscure =
                                    !isConfirmPasswordObscure;
                              });
                            },
                          ),
                          validator: (value) => AppValidators.confirmPassword(
                            value,
                            passwordContoller.text,
                          ),
                        ),
                        60.h.ph,
                        CustomButton(
                          onTap: () => showDialog(
                            context: context,
                            builder: (context) {
                              return AccountActivatedDialog(
                                title: 'Password Created!',
                                subTitle:
                                    'Congratulations! Your password has been successfully created',
                                buttonTitle: 'Return to login',
                              );
                            },
                          ),
                          text: 'Confirm',
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
