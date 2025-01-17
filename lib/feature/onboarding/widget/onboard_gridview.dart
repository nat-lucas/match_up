import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:match_up/core/utils/image.dart';
import 'package:match_up/feature/onboarding/widget/image_card.dart';

class OnboardGridview extends StatelessWidget {
  const OnboardGridview({super.key});

  @override
  Widget build(BuildContext context) {
    final List image = [
      ImagePath.one,
      ImagePath.two,
      ImagePath.three,
      ImagePath.four
    ];
    return MasonryGridView.builder(
      itemCount: image.length,
      shrinkWrap: true,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      primary: false,
      
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return ImageCard(image: image[index]);
      },
    );
  }
}
