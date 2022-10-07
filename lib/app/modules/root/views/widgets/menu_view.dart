import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

import '../../../auth/controllers/auth_controller.dart';

class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () => AuthController.to.logout(),
          icon: const HeroIcon(HeroIcons.arrowLeftOnRectangle),
        ),
      ],
    );
  }
}
