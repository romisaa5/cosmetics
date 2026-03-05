import 'package:cosmetics/core/common/widgets/custom_app_images.dart';
import 'package:cosmetics/core/common/widgets/custom_text_form_field.dart';
import 'package:cosmetics/core/helpers/extensions.dart';
import 'package:cosmetics/core/theme/app_colors/light_app_colors.dart';
import 'package:cosmetics/core/theme/app_texts/app_text_styles.dart';
import 'package:cosmetics/core/utils/app_icons.dart';
import 'package:cosmetics/core/utils/app_images.dart';
import 'package:cosmetics/core/utils/common_imports.dart';
import 'package:cosmetics/features/home/presentation/widgets/top_rated_product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            12.h.ph,

            AppTextFormField(
              labelText: 'Search',
              suffixIcon: SizedBox(
                height: 24.h,
                width: 24.w,
                child: Center(
                  child: CustomAppImages(imagePath: AppIcons.search),
                ),
              ),
            ),

            12.h.ph,

            CustomAppImages(imagePath: AppImages.poster),

            12.h.ph,

            Text(
              'Top rated products',
              style: AppTextStyles.font16Bold.copyWith(
                color: LightAppColors.primary800,
              ),
            ),

            14.h.ph,

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                return TopRatedProductCard(
                  imageUrl: 'assets/placeholder/test.jpg',
                  title: "Face tint / lip tint",
                  price: "\$120",
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
