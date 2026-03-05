import 'package:cosmetics/core/theme/app_colors/light_app_colors.dart';
import 'package:cosmetics/core/utils/app_icons.dart';
import 'package:cosmetics/core/utils/common_imports.dart';
import 'package:cosmetics/features/cart/presentation/screens/my_cart_screen.dart';
import 'package:cosmetics/features/categories/presentation/screens/categories_screen.dart';
import 'package:cosmetics/features/home/presentation/screens/home_screen.dart';
import 'package:cosmetics/features/profile/presentation/screens/profile_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const CategoriesScreen(),
    const MyCartScreen(),
    const ProfileScreen(),
  ];

  Widget buildSvg(String path, bool isSelected) {
    return SvgPicture.asset(
      path,
      width: 20.w,
      height: 20.h,
      colorFilter: ColorFilter.mode(
        isSelected ? LightAppColors.secondary800 : LightAppColors.grey600,
        BlendMode.srcIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          color: LightAppColors.grey300,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: GNav(
          gap: 8,
          activeColor: LightAppColors.secondary900,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          duration: const Duration(milliseconds: 400),
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          tabs: [
            GButton(
              icon: Icons.circle,
              leading: buildSvg(AppIcons.home, _selectedIndex == 0),
            ),
            GButton(
              icon: Icons.circle,
              leading: buildSvg(AppIcons.categories, _selectedIndex == 1),
            ),
            GButton(
              icon: Icons.circle,
              leading: buildSvg(AppIcons.cart, _selectedIndex == 2),
            ),
            GButton(
              icon: Icons.circle,
              leading: buildSvg(AppIcons.profile, _selectedIndex == 3),
            ),
          ],
        ),
      ),
    );
  }
}
