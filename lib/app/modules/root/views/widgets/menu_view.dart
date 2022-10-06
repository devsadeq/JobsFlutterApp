import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobs_flutter_app/app/modules/auth/controllers/auth_controller.dart';

class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () => AuthController.to.logout(),
          icon: const FaIcon(FontAwesomeIcons.rightFromBracket),
        ),
      ],
    );
  }
}
