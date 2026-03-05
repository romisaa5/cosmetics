import 'package:cosmetics/core/common/widgets/custom_app_images.dart';
import 'package:cosmetics/core/helpers/extensions.dart';
import 'package:cosmetics/core/theme/app_colors/light_app_colors.dart';
import 'package:cosmetics/core/theme/app_texts/app_text_styles.dart';
import 'package:cosmetics/core/utils/app_icons.dart';
import 'package:cosmetics/core/utils/common_imports.dart';
import 'package:cosmetics/features/cart/presentation/widgets/my_cart_product_card.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProducts = [
      {
        "image": "assets/placeholder/test.jpg",
        "brand": "Note Cosmetics",
        "name": "Ultra rich mascara for lashes",
        "price": 350.0,
        "qty": 1,
      },
      {
        "image": "assets/placeholder/test.jpg",
        "brand": "ARTDECO",
        "name": "Bronzer - 02",
        "price": 490.0,
        "qty": 2,
      },
      {
        "image": "assets/placeholder/test.jpg",
        "brand": "Fendi",
        "name": "Lipstick - shade 9",
        "price": 260.0,
        "qty": 1,
      },
    ];

    return Padding(
      padding: EdgeInsets.all(12.h),
      child: Column(
        children: [
          12.h.ph,
          Row(
            children: [
              const Spacer(),
              Text(
                'My Cart',
                style: AppTextStyles.font24Bold.copyWith(
                  color: LightAppColors.primary800,
                ),
              ),
              const Spacer(),
              CustomAppImages(imagePath: AppIcons.addCart),
            ],
          ),
          24.h.ph,
          Expanded(
            child: ListView.builder(
              itemCount: cartProducts.length,
              itemBuilder: (context, index) {
                final product = cartProducts[index];

                return MyCartProductCard(
                  image: product["image"] as String,
                  brandName: product["brand"] as String,
                  productName: product["name"] as String,
                  price: product["price"] as double,
                  quantity: product["qty"] as int,
                  onDelete: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
