import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../lab_clinicas_core.dart';

class IconPopupMenuButton extends StatelessWidget {
  const IconPopupMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PhosphorIcon(
      PhosphorIcons.dotsThreeCircle(),
      color: AppTheme.orangeColor,
      size: 32,
    );
  }
}
