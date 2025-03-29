import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class PreferencesRotatedImage extends StatelessWidget {
  const PreferencesRotatedImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -50,
      left: -20,
      child: ClipRect(
        child: Transform.rotate(
          angle: .2,
          child: SizedBox(
            width: 230,
            height: 290,
            child: Image.asset(
              AppAssets.preferenceImg,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
    );
  }
}
