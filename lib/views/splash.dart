import 'dart:async';
import 'package:cosmetics/core/common/widgets/app_images.dart';
import 'package:cosmetics/core/helpers/app_navigator.dart';
import 'package:cosmetics/core/helpers/extensions.dart';
import 'package:cosmetics/core/utils/common_imports.dart';
import 'package:cosmetics/views/onboading.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() {
    Future.delayed(const Duration(seconds: 5), () {
      AppNavigator.pushAndRemoveUntil(context, OnboardingScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppImages(imagePath: '/app_logo.png', height: 200.h, width: 200.w),
            16.h.ph,
            AppImages(
              imagePath: '/splash_text.png',
              width: 120.w,
              height: 46.h,
            ),
          ],
        ),
      ),
    );
  }
}
