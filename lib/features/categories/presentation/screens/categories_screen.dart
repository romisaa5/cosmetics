import 'package:cosmetics/core/common/widgets/custom_app_images.dart';
import 'package:cosmetics/core/common/widgets/custom_text_form_field.dart';
import 'package:cosmetics/core/helpers/extensions.dart';
import 'package:cosmetics/core/theme/app_colors/light_app_colors.dart';
import 'package:cosmetics/core/theme/app_texts/app_text_styles.dart';
import 'package:cosmetics/core/utils/app_icons.dart';
import 'package:cosmetics/core/utils/common_imports.dart';
import 'package:cosmetics/features/categories/presentation/widgets/category_card.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {"title": "Bundles", "image": "assets/placeholder/test.jpg"},
      {"title": "Perfumes", "image": "assets/placeholder/test.jpg"},
      {"title": "Makeup", "image": "assets/placeholder/test.jpg"},
      {"title": "Skin Care", "image": "assets/placeholder/test.jpg"},
      {"title": "Gifts", "image": "assets/placeholder/test.jpg"},
    ];
    return Padding(
      padding: EdgeInsets.all(12.h),
      child: Column(
        children: [
          12.h.ph,
          Align(
            alignment: Alignment.center,
            child: Text(
              'Categories',
              style: AppTextStyles.font24Bold.copyWith(
                color: LightAppColors.primary800,
              ),
            ),
          ),
          24.h.ph,
          AppTextFormField(
            labelText: 'Search',
            suffixIcon: SizedBox(
              height: 24.h,
              width: 24.w,
              child: Center(child: CustomAppImages(imagePath: AppIcons.search)),
            ),
          ),
          30.h.ph,
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategoryCard(
                  image: categories[index]["image"]!,
                  title: categories[index]["title"]!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
