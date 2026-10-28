import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_assets.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo();
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AppAssets.logo, fit: BoxFit.contain);
  }
}
